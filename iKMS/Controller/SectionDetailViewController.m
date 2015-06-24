//
//  SectionDetailViewController.m
//  iKMS
//
//  Created by Luyen Do Van on 6/10/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import "SectionDetailViewController.h"
#import "CellSectionDetailRentType.h"
#import "ViewHeaderList.h"

@interface SectionDetailViewController ()
@property(nonatomic,strong)IBOutlet UITextField *txt_Property;
@property(nonatomic,strong)IBOutlet UITextField *txt_Code;
@property(nonatomic,strong)IBOutlet UITextField *txt_Name;
@property(nonatomic,strong)IBOutlet UITextField *txt_Entrance;
@property(nonatomic,strong)IBOutlet UITextField *txt_Hno;
@property(nonatomic,strong)IBOutlet UITextField *txt_Floor;
@property(nonatomic,strong)IBOutlet UITextField *txt_Square;
@property(nonatomic,strong)IBOutlet UITextField *txt_Bedrooms;
@property(nonatomic,strong)IBOutlet UITextField *txt_Measureno;
//@property(nonatomic,strong)IBOutlet UITextField *txt_Type;
@property(nonatomic,strong)IBOutlet UITextField *txt_Leaseamt;
@property(nonatomic,strong)IBOutlet UITextField *txt_Feeamt;

@property(nonatomic,strong)IBOutlet CellSectionDetailRentType *cell_RentType;
@end

@implementation SectionDetailViewController
@synthesize m_section,cell_RentType,m_property;

@synthesize m_current_index,listContacts;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self processLoad];
}

-(void)processLoad{
    [cell_RentType loadUIWithData:m_section];
    [self fillData];
    
    if (m_section) {
        is_edit = false;
        [self addEditButton];
        self.navigationItem.title = m_section.Name;
    }else{
        is_edit = true;
        [self addCreateButton];
        self.navigationItem.title = @"Add New Section";
    }
}

-(void)addEditButton{
    [_txt_Bedrooms setEnabled:false];
    [_txt_Code setEnabled:false];
    [_txt_Entrance setEnabled:false];
    [_txt_Feeamt setEnabled:false];
    [_txt_Floor setEnabled:false];
    [_txt_Hno setEnabled:false];
    [_txt_Leaseamt setEnabled:false];
    [_txt_Measureno setEnabled:false];
    [_txt_Name setEnabled:false];
    [_txt_Property setEnabled:false];
    [_txt_Square setEnabled:false];
    [cell_RentType setEnable:false];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(onSelectEditButton)];
    self.navigationItem.rightBarButtonItem = item;
}
-(void)onSelectEditButton{
    is_edit = true;
    [self addDoneButton];
    [_txt_Bedrooms setEnabled:true];
    [_txt_Code setEnabled:true];
    [_txt_Entrance setEnabled:true];
    [_txt_Feeamt setEnabled:true];
    [_txt_Floor setEnabled:true];
    [_txt_Hno setEnabled:true];
    [_txt_Leaseamt setEnabled:true];
    [_txt_Measureno setEnabled:true];
    [_txt_Name setEnabled:true];
    [_txt_Property setEnabled:false];
    [_txt_Square setEnabled:true];
    [cell_RentType setEnable:true];
    
}
-(void)addDoneButton{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onSelectDoneButton)];
    self.navigationItem.rightBarButtonItem = item;
}
-(void)onSelectDoneButton{
    
    [_txt_Bedrooms setEnabled:false];
    [_txt_Code setEnabled:false];
    [_txt_Entrance setEnabled:false];
    [_txt_Feeamt setEnabled:false];
    [_txt_Floor setEnabled:false];
    [_txt_Hno setEnabled:false];
    [_txt_Leaseamt setEnabled:false];
    [_txt_Measureno setEnabled:false];
    [_txt_Name setEnabled:false];
    [_txt_Property setEnabled:false];
    [_txt_Square setEnabled:false];
    [cell_RentType setEnable:false];
    self.navigationItem.rightBarButtonItem.enabled =false;
    if (m_property) {
        [self updateSection];
    }
}
-(void)addCreateButton{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Submit" style:UIBarButtonItemStyleDone target:self action:@selector(onSelectCreateButton)];
    self.navigationItem.rightBarButtonItem = item;
}
-(void)onSelectCreateButton{
    [self createSection];
}

-(void)updateSection{
    
    NSMutableDictionary *params = [NSMutableDictionary new];
    
    [params setValue:m_section.Id forKey:@"Id"];
    [params setValue:m_section.PropertyId forKey:@"PropertyId"];
    
    [params setValue:_txt_Code.text forKey:@"Code"];
    [params setValue:_txt_Name.text forKey:@"Name"];
    [params setValue:_txt_Entrance.text forKey:@"Enterance"];
    [params setValue:_txt_Hno.text forKey:@"HNumber"];
    [params setValue:_txt_Floor.text forKey:@"Floor"];
    [params setValue:_txt_Square.text forKey:@"Square"];
    [params setValue:_txt_Bedrooms.text forKey:@"Bedrooms"];
    [params setValue:_txt_Measureno.text forKey:@"MeasureNo"];
    if (cell_RentType.m_user_input!=-1) {
        [params setValue:[NSString stringWithFormat:@"%d",cell_RentType.m_user_input] forKey:@"RentType"];
    }
    
    [params setValue:_txt_Leaseamt.text forKey:@"LeaseAmt"];
    [params setValue:_txt_Feeamt.text forKey:@"FeeAmt"];
    
    [OSConst showLocalProgressHudInView:self.navigationController.view WithTitle:@"Updating..."];
    [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:NULL forHTTPHeaderField:@"Accept"];
    [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:NULL forHTTPHeaderField:@"Content-Type"];
    [[AFAppDotNetAPIClient sharedClient] POST:kPathCreditSection parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [OSConst dismissLocalHUDInView:self.navigationController.view];
        [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        NSLog(@"response update section: %@", responseObject);
        @try {
            BOOL success = [[responseObject objectForKey:@"Success"] boolValue];
            if (success) {
                [OSConst showMessageInView:self.tableView withTitle:@"Success" withMessage:@"Section has been updated successful!"];
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
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [OSConst dismissLocalHUDInView:self.navigationController.view];
        [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        NSLog(@"fail update section: %@", error.description);
        self.navigationItem.rightBarButtonItem.enabled =true;
    }];
}

-(void)createSection{
    NSMutableDictionary *params = [NSMutableDictionary new];
    
    [params setValue:m_property.Id forKey:@"PropertyId"];
    
    [params setValue:_txt_Code.text forKey:@"Code"];
    [params setValue:_txt_Name.text forKey:@"Name"];
    [params setValue:_txt_Entrance.text forKey:@"Enterance"];
    [params setValue:_txt_Hno.text forKey:@"HNumber"];
    [params setValue:_txt_Floor.text forKey:@"Floor"];
    [params setValue:_txt_Square.text forKey:@"Square"];
    [params setValue:_txt_Bedrooms.text forKey:@"Bedrooms"];
    [params setValue:_txt_Measureno.text forKey:@"MeasureNo"];
    if (cell_RentType.m_user_input!=-1) {
        [params setValue:[NSString stringWithFormat:@"%d",cell_RentType.m_user_input] forKey:@"RentType"];
    }
    
    [params setValue:_txt_Leaseamt.text forKey:@"LeaseAmt"];
    [params setValue:_txt_Feeamt.text forKey:@"FeeAmt"];
    
    [OSConst showLocalProgressHudInView:self.navigationController.view WithTitle:@"Creating..."];
    [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:NULL forHTTPHeaderField:@"Accept"];
    [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:NULL forHTTPHeaderField:@"Content-Type"];
    [[AFAppDotNetAPIClient sharedClient] POST:kPathCreditSection parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [OSConst dismissLocalHUDInView:self.navigationController.view];
        [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        NSLog(@"response create section: %@", responseObject);
        @try {
            BOOL success = [[responseObject objectForKey:@"Success"] boolValue];
            if (success) {
                [OSConst showMessageInView:self.tableView withTitle:@"Success" withMessage:@"Section has been updated successful!"];
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
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [OSConst dismissLocalHUDInView:self.navigationController.view];
        [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        NSLog(@"fail create section: %@", error.description);
        self.navigationItem.rightBarButtonItem.enabled =true;
        [OSConst showMessageInView:self.navigationController.view withTitle:@"Error" withMessage:@"Have some problems when update section. Please try again!"];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

-(void)fillData{
    if (!m_section) {
        [_txt_Bedrooms setEnabled:true];
        [_txt_Code setEnabled:true];
        [_txt_Entrance setEnabled:true];
        [_txt_Feeamt setEnabled:true];
        [_txt_Floor setEnabled:true];
        [_txt_Hno setEnabled:true];
        [_txt_Leaseamt setEnabled:true];
        [_txt_Measureno setEnabled:true];
        [_txt_Name setEnabled:true];
        [_txt_Property setEnabled:false];
        [_txt_Square setEnabled:true];
        [cell_RentType setEnable:true];
        if (![m_property.Name isKindOfClass:[NSNull class]]) {
            _txt_Property.text = m_property.Name;
        }
        return;
    }
    [_txt_Bedrooms setEnabled:false];
    [_txt_Code setEnabled:false];
    [_txt_Entrance setEnabled:false];
    [_txt_Feeamt setEnabled:false];
    [_txt_Floor setEnabled:false];
    [_txt_Hno setEnabled:false];
    [_txt_Leaseamt setEnabled:false];
    [_txt_Measureno setEnabled:false];
    [_txt_Name setEnabled:false];
    [_txt_Property setEnabled:false];
    [_txt_Square setEnabled:false];
    [cell_RentType setEnable:false];
    
    if (![m_property.Name isKindOfClass:[NSNull class]]) {
        _txt_Property.text = m_property.Name;
    }
    if (![m_section.Code isKindOfClass:[NSNull class]]) {
        _txt_Code.text = m_section.Code;
    }
    if (![m_section.Name isKindOfClass:[NSNull class]]) {
        _txt_Name.text = m_section.Name;
    }
    if (![m_section.Enterance isKindOfClass:[NSNull class]]) {
        _txt_Entrance.text = m_section.Enterance;
    }
    if (![m_section.HNumber isKindOfClass:[NSNull class]]) {
        _txt_Hno.text  = m_section.HNumber;
    }
    if (![m_section.Floor isKindOfClass:[NSNull class]]) {
        _txt_Floor.text = m_section.Floor;
    }
    if (![m_section.Square isKindOfClass:[NSNull class]]) {
        _txt_Square.text = [NSString stringWithFormat:@"%d",[m_section.Square intValue]];
    }
    if (![m_section.Bedrooms isKindOfClass:[NSNull class]]) {
        _txt_Bedrooms.text = [NSString stringWithFormat:@"%d",[m_section.Bedrooms intValue]];
    }
    if (![m_section.MeasureNo isKindOfClass:[NSNull class]]) {
        _txt_Measureno.text = m_section.MeasureNo;
    }
    if (m_section.RentType) {
        
    }
    if (![m_section.LeaseAmt isKindOfClass:[NSNull class]]) {
        _txt_Leaseamt.text = [NSString stringWithFormat:@"%d",[m_section.LeaseAmt intValue]];
    }
    if (![m_section.FeeAmt isKindOfClass:[NSNull class]]) {
        _txt_Feeamt.text = [NSString stringWithFormat:@"%d",[m_section.FeeAmt intValue]];
    }
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if ([cell isKindOfClass:[CellSectionDetailRentType class]]){
        CellSectionDetailRentType *this_cell = (CellSectionDetailRentType*)cell;
        [this_cell showPickerView];
    }
}

-(void)onSelectBack{
    m_current_index--;
    if (m_current_index<0) {
        m_current_index=0;
        return;
    }
    m_section = [listContacts objectAtIndex:m_current_index];
    [self processLoad];
}

-(void)onSelectNext{
    m_current_index++;
    if (m_current_index>[listContacts count]-1) {
        m_current_index = [listContacts count]-1;
        return;
    }
    m_section = [listContacts objectAtIndex:m_current_index];
    [self processLoad];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (m_section) {
        return 44;
    }
    return 0;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (m_section) {
        ViewHeaderList *view = (ViewHeaderList*)[OSConst loadViewFromXib:@"ViewHeader" ownew:self viewClass:[ViewHeaderList class]];
        [view.btn_back addTarget:self action:@selector(onSelectBack) forControlEvents:UIControlEventTouchUpInside];
        [view.btn_next addTarget:self action:@selector(onSelectNext) forControlEvents:UIControlEventTouchUpInside];
        return view;
    }
    return NULL;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
        return 64;
    }
    return 44;
}

@end
