//
//  PropertyDetailViewController.m
//  iKMS
//
//  Created by Luyen Do Van on 6/10/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import "PropertyDetailViewController.h"
#import "CellSectionList.h"
#import "CellPropertyDetail.h"
#import "SectionDetailViewController.h"
#import "ViewHeader.h"
#import "ViewHeaderList.h"

@interface PropertyDetailViewController ()

@end

@implementation PropertyDetailViewController
@synthesize m_property,listResources,listIdentifier;

@synthesize m_current_index,listContacts;

- (void)viewDidLoad {
    [super viewDidLoad];
    listResources = [NSMutableArray new];
    listIdentifier = @[@"CellCode", @"CellName", @"CellStartyear", @"CellFloors", @"CellSections", @"CellSquare", @"CellBlockno", @"CellSlotno", @"CellPurchaseprice", @"CellDebt", @"CellAddress"];
//    [self sendRequestSection];
    if (m_property) {
        is_edit = false;
        [self addEditButton];
        self.navigationItem.title = m_property.Name;
    }else{
        is_edit = true;
        [self addCreateButton];
        self.navigationItem.title = @"Add New Property";
    }
    
    
}
-(void)processLoad{
    [self sendRequestSection];
    if (m_property) {
        is_edit = false;
        [self addEditButton];
        self.navigationItem.title = m_property.Name;
    }else{
        is_edit = true;
        [self addCreateButton];
        self.navigationItem.title = @"Add New Property";
    }
    [listResources removeAllObjects];
    [self.tableView reloadData];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self sendRequestSection];
}

-(void)addEditButton{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(onSelectEditButton)];
    self.navigationItem.rightBarButtonItem = item;
}
-(void)onSelectEditButton{
    is_edit = true;
    [self addDoneButton];
    [self.tableView reloadData];
    
}
-(void)addDoneButton{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onSelectDoneButton)];
    self.navigationItem.rightBarButtonItem = item;
}
-(void)onSelectDoneButton{
    
    
    self.navigationItem.rightBarButtonItem.enabled =false;
    if (m_property) {
        [self updateProperty];
    }
}
-(void)addCreateButton{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Submit" style:UIBarButtonItemStyleDone target:self action:@selector(onSelectCreateButton)];
    self.navigationItem.rightBarButtonItem = item;
}
-(void)onSelectCreateButton{
    [self createProperty];
}

-(void)onSelectAddSection{
    SectionDetailViewController *controller = (SectionDetailViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"SectionDetailViewController"];
    controller.m_property = m_property;
    [self.navigationController pushViewController:controller animated:true];
}
-(void)onSelectBack{
    m_current_index--;
    if (m_current_index<0) {
        m_current_index=0;
        return;
    }
    m_property = [listContacts objectAtIndex:m_current_index];
    [self processLoad];
}

-(void)onSelectNext{
    m_current_index++;
    if (m_current_index>[listContacts count]-1) {
        m_current_index = [listContacts count]-1;
        return;
    }
    m_property = [listContacts objectAtIndex:m_current_index];
    [self processLoad];
}

-(void)updateProperty{
    NSMutableDictionary *params = [NSMutableDictionary new];
    [params setValue:m_property.Id forKey:@"Id"];
    NSArray *key = @[@"Code",@"Name",@"StartYear",@"Floors",@"Sections",@"Square",@"BlockNo",@"SlotNo",@"PurchPrice",@"Debt",@"Address"];
    for (int i=0; i<key.count; i++) {
        CellPropertyDetail *cell = (CellPropertyDetail*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        [params setValue:cell.txt_name.text forKey:[key objectAtIndex:i]];
    }
    [OSConst showLocalProgressHudInView:self.navigationController.view WithTitle:@"Updating..."];
    [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:NULL forHTTPHeaderField:@"Accept"];
    [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:NULL forHTTPHeaderField:@"Content-Type"];
    [[AFAppDotNetAPIClient sharedClient] POST:kPathCreditProperty parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [OSConst dismissLocalHUDInView:self.navigationController.view];
        [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        NSLog(@"response update property: %@", responseObject);
        @try {
            BOOL success = [[responseObject objectForKey:@"Success"] boolValue];
            if (success) {
                [OSConst showMessageInView:self.tableView withTitle:@"Success" withMessage:@"Property has been updated successful!"];
                [self.navigationController popViewControllerAnimated:YES];
            }else{
                [OSConst showMessageInView:self.tableView withTitle:@"Error" withMessage:[responseObject objectForKey:@"Msg"]];
                self.navigationItem.rightBarButtonItem.enabled =true;
            }
        }
        @catch (NSException *exception) {
            
        }
        @finally {
            
        }
//        [self addEditButton];
//        is_edit = false;
//        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [OSConst dismissLocalHUDInView:self.navigationController.view];
        [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        NSLog(@"fail update property: %@", error.description);
        self.navigationItem.rightBarButtonItem.enabled =true;
        [OSConst showMessageInView:self.tableView withTitle:@"Error" withMessage:@"Have some problems when update property. Please try again!"];
    }];

}

-(void)createProperty{
    NSMutableDictionary *params = [NSMutableDictionary new];
    [params setValue:m_property.Id forKey:@"Id"];
    NSArray *key = @[@"Code",@"Name",@"StartYear",@"Floors",@"Sections",@"Square",@"BlockNo",@"SlotNo",@"PurchPrice",@"Debt",@"Address"];
    for (int i=0; i<key.count; i++) {
        CellPropertyDetail *cell = (CellPropertyDetail*)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        [params setValue:cell.txt_name.text forKey:[key objectAtIndex:i]];
    }
//    __weak PropertyDetailViewController *weakSelf = self;
    [OSConst showLocalProgressHudInView:self.navigationController.view WithTitle:@"Creating..."];
    [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:NULL forHTTPHeaderField:@"Accept"];
    [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:NULL forHTTPHeaderField:@"Content-Type"];
    [[AFAppDotNetAPIClient sharedClient] POST:kPathCreditProperty parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [OSConst dismissLocalHUDInView:self.navigationController.view];
        NSLog(@"response update property: %@", responseObject);
        @try {
            BOOL success = [[responseObject objectForKey:@"Success"] boolValue];
            if (success) {
                [OSConst showMessageInView:self.tableView withTitle:@"Success" withMessage:@"Property has been updated successful!"];
                [self.navigationController popViewControllerAnimated:YES];
            }else{
                [OSConst showMessageInView:self.tableView withTitle:@"Error" withMessage:[responseObject objectForKey:@"Msg"]];
                self.navigationItem.rightBarButtonItem.enabled =true;
            }
        }
        @catch (NSException *exception) {
            
        }
        @finally {
            
        }
//        [self addEditButton];
//        is_edit = false;
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [OSConst dismissLocalHUDInView:self.navigationController.view];
        NSLog(@"fail update property: %@", error.description);
        self.navigationItem.rightBarButtonItem.enabled =true;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)sendRequestSection{
    NSMutableDictionary *params = [NSMutableDictionary new];
    [params setValue:m_property.Id forKey:@"property"];
    [[AFAppDotNetAPIClient sharedClient] GET:kPathGetSectionAll parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"response GetSectionAll: %@", responseObject);
        [listResources removeAllObjects];
        if ([responseObject count]>0) {
//            SectionObject *object = [[SectionObject alloc] initWithName:@"Add New Section"];
//            [listResources addObject:object];
            for (int i=0; i<[responseObject count]; i++) {
                SectionObject *object = [[SectionObject alloc] initWithData:[responseObject objectAtIndex:i]];
                [listResources addObject:object];
            }
            [self.tableView reloadData];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error GetSectionAll: %@", error.description);
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    if (m_property) {
        return 2;
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    if (section==0) {
        return 11;
    }
    return [listResources count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        if (m_property) {
            return 44;
        }
        return 0;
    }
    return 44;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
        if (indexPath.section==0) {
            if (indexPath.row==8) {
                return 84;
            }
            return 64;
        }
        
        return 44;
    }
    if (indexPath.section==0) {
        if (indexPath.row==8) {
            return 64;
        }
        return 44;
    }
    
    return 44;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==0) {
        if (m_property) {
            ViewHeaderList *view = (ViewHeaderList*)[OSConst loadViewFromXib:@"ViewHeader" ownew:self viewClass:[ViewHeaderList class]];
            [view.btn_back addTarget:self action:@selector(onSelectBack) forControlEvents:UIControlEventTouchUpInside];
            [view.btn_next addTarget:self action:@selector(onSelectNext) forControlEvents:UIControlEventTouchUpInside];
            return view;
        }
        return NULL;
    }
    ViewHeader *view = (ViewHeader*)[OSConst loadViewFromXib:@"ViewHeader" ownew:self viewClass:[ViewHeader class]];
    view.lb_name.text = @"SECTIONS";
    [view.btn_add addTarget:self action:@selector(onSelectAddSection) forControlEvents:UIControlEventTouchUpInside];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        CellPropertyDetail *cell = [tableView dequeueReusableCellWithIdentifier:[listIdentifier objectAtIndex:indexPath.row]];
        [cell setEnable:is_edit];
        switch (indexPath.row) {
            case 0://Code
                if (![m_property.Code isKindOfClass:[NSNull class]]) {
                    cell.txt_name.text = m_property.Code;
                }
                
                break;
            case 1://Name
                if (![m_property.Name isKindOfClass:[NSNull class]]) {
                    cell.txt_name.text = m_property.Name;
                }
                break;
            case 2://Start year
                if (![m_property.StartYear isKindOfClass:[NSNull class]]) {
                    cell.txt_name.text = [NSString stringWithFormat:@"%d",[m_property.StartYear intValue]];
                }
                break;
            case 3://Floors
                if (![m_property.Floors isKindOfClass:[NSNull class]]) {
                    cell.txt_name.text = [NSString stringWithFormat:@"%d",[m_property.Floors intValue]];
                }
                break;
            case 4://Sections
                if (![m_property.Sections isKindOfClass:[NSNull class]]) {
                    cell.txt_name.text = [NSString stringWithFormat:@"%d",[m_property.Sections intValue]];
                }
                break;
            case 5://Square
                if (![m_property.Square isKindOfClass:[NSNull class]]) {
                    cell.txt_name.text = [NSString stringWithFormat:@"%d",[m_property.Square intValue]];
                }
                break;
            case 6://Block no
                if (![m_property.BlockNo isKindOfClass:[NSNull class]]) {
                    cell.txt_name.text = [NSString stringWithFormat:@"%d",[m_property.BlockNo intValue]];
                }
                break;
            case 7://Slot no
                if (![m_property.SlotNo isKindOfClass:[NSNull class]]) {
                    cell.txt_name.text = m_property.SlotNo;
                }
                break;
            case 8://Purchase price
                if (![m_property.PurchPrice isKindOfClass:[NSNull class]]) {
                    cell.txt_name.text = [NSString stringWithFormat:@"%d",[m_property.PurchPrice intValue]];
                }
                break;
            case 9://Debt
                if (![m_property.Debt isKindOfClass:[NSNull class]]) {
                    cell.txt_name.text = [NSString stringWithFormat:@"%d",[m_property.Debt intValue]];
                }
                break;
            case 10://Address
                if (![m_property.Address isKindOfClass:[NSNull class]]) {
                    cell.txt_name.text = m_property.Address;
                }
                break;
                
            default:
                break;
        }
        
        // Configure the cell...
        
        return cell;
    }
    CellSectionList *cell = [tableView dequeueReusableCellWithIdentifier:@"CellSectionList"];
    [cell loadUIWithData:[listResources objectAtIndex:indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==1) {
        SectionDetailViewController *controller = (SectionDetailViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"SectionDetailViewController"];
        controller.m_section = [listResources objectAtIndex:indexPath.row];
        controller.m_property = m_property;
        controller.m_current_index = indexPath.row;
        controller.listContacts = listResources;
        [self.navigationController pushViewController:controller animated:true];
    }
}


@end
