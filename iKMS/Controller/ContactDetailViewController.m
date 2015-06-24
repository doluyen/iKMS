//
//  ContactDetailViewController.m
//  iKMS
//
//  Created by Luyen Do Van on 6/8/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import "ContactDetailViewController.h"
#import "AccountChildrenObject.h"
#import "GroupObject.h"
#import "PaymentTermObject.h"
#import "CellContactDetailCostAccount.h"
#import "CellContactDetailGroup.h"
#import "CellContactDetailOperatingbank.h"
#import "CellContactDetailPaymentTerm.h"
#import "CellContactDetailStatus.h"
#import "ViewHeaderList.h"

@interface ContactDetailViewController ()

@property(nonatomic,strong)NSMutableArray *list_AccountChildren;
@property(nonatomic,strong)NSMutableArray *list_Group;
@property(nonatomic,strong)NSMutableArray *list_PaymentTerm;

@property(nonatomic,strong)IBOutlet CellContactDetailCostAccount *cell_costAccount;
@property(nonatomic,strong)IBOutlet CellContactDetailGroup *cell_group;
@property(nonatomic,strong)IBOutlet CellContactDetailOperatingbank *cell_operatingBank;
@property(nonatomic,strong)IBOutlet CellContactDetailPaymentTerm *cell_paymentTerm;
@property(nonatomic,strong)IBOutlet CellContactDetailStatus *cell_status;

@property(nonatomic,strong)IBOutlet UITextField *txt_Telephone;
@property(nonatomic,strong)IBOutlet UITextField *txt_Code;
@property(nonatomic,strong)IBOutlet UITextField *txt_Address;
@property(nonatomic,strong)IBOutlet UITextField *txt_AddressNo;
@property(nonatomic,strong)IBOutlet UITextField *txt_FirstName;
@property(nonatomic,strong)IBOutlet UITextField *txt_LastName;
@property(nonatomic,strong)IBOutlet UITextField *txt_PostAddress;
@property(nonatomic,strong)IBOutlet UITextField *txt_Email;
@property(nonatomic,strong)IBOutlet UITextView *txt_Description;
@property(nonatomic,strong)IBOutlet UITextField *txt_IdNo;
@property(nonatomic,strong)IBOutlet UITextField *txt_BankAccountNo;
@property(nonatomic,strong)IBOutlet UISwitch *active;


@end

@implementation ContactDetailViewController
@synthesize list_AccountChildren,list_Group,list_PaymentTerm;
@synthesize cell_costAccount,cell_group,cell_operatingBank,cell_paymentTerm,cell_status,m_object;
@synthesize txt_Address,txt_AddressNo,txt_BankAccountNo,txt_Code,txt_Description,txt_Email,txt_FirstName,txt_IdNo,txt_LastName,txt_PostAddress,txt_Telephone,active;

@synthesize m_current_index,listContacts;


- (void)viewDidLoad {
    [super viewDidLoad];
    list_AccountChildren = [NSMutableArray new];
    list_Group = [NSMutableArray new];
    list_PaymentTerm = [NSMutableArray new];
    _firstX = -1;
    _firstY = -1;
    
    [self processLoad];
}
-(void)processLoad{
    if (m_object) {
        is_edit = false;
        [self addEditButton];
        self.navigationItem.title = m_object.FullName;
    }else{
        is_edit = true;
        txt_Description.layer.borderColor = [OSConst colorWithHexString:color_button_black].CGColor;
        txt_Description.layer.borderWidth = 1.0;
        txt_Description.layer.cornerRadius = 5.0;
        [self addCreateButton];
        self.navigationItem.title = @"Add New Contact";
    }
    
    [cell_status loadUIWithData:m_object];
    [cell_paymentTerm loadUIWithData:m_object];
    [cell_operatingBank loadUIWithData:m_object];
    [cell_group loadUIWithData:m_object];
    [cell_costAccount loadUIWithData:m_object];
    
    [self fillData];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPad) {
        switch (indexPath.row) {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 8:
            case 9:
            case 11:
            case 15:
                return 64;
                break;
            case 6:
            case 7:
            case 12:
            case 13:
            case 14:
            case 16:
                return 84;
                break;
            case 10:
                return 120;
                break;

                
            default:
                break;
        }
    }
    switch (indexPath.row) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 8:
        case 9:
        case 11:
        case 15:
            return 44;
            break;
        case 6:
        case 7:
        case 12:
        case 13:
        case 14:
        case 16:
            return 64;
            break;
        case 10:
            return 100;
            break;
            
            
        default:
            break;
    }
    return 44;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (!is_edit) {
        return;
    }
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if ([cell isKindOfClass:[CellContactDetailStatus class]]) {
        
        CellContactDetailStatus *statusCell = (CellContactDetailStatus*)cell;
        [statusCell showPickerView];
    }else if([cell isKindOfClass:[CellContactDetailGroup class]]){
        CellContactDetailGroup *groupCell = (CellContactDetailGroup*)cell;
        [groupCell showPickerView];
    }else if([cell isKindOfClass:[CellContactDetailOperatingbank class]]){
        CellContactDetailOperatingbank *groupCell = (CellContactDetailOperatingbank*)cell;
        [groupCell showPickerView];
    }
    else if([cell isKindOfClass:[CellContactDetailCostAccount class]]){
        CellContactDetailCostAccount *groupCell = (CellContactDetailCostAccount*)cell;
        [groupCell showPickerView];
    }else if([cell isKindOfClass:[CellContactDetailPaymentTerm class]]){
        CellContactDetailPaymentTerm *groupCell = (CellContactDetailPaymentTerm*)cell;
        [groupCell showPickerView];
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan");
}

-(void)addEditButton{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(onSelectEditButton)];
    self.navigationItem.rightBarButtonItem = item;
}
-(void)onSelectEditButton{
    is_edit = true;
    [self addDoneButton];
    
    [txt_Address setEnabled:true];
    [txt_AddressNo setEnabled:true];
    [txt_BankAccountNo setEnabled:true];
    [txt_Code setEnabled:true];
    [txt_Description setEditable:true];
    txt_Description.layer.borderColor = [OSConst colorWithHexString:color_button_black].CGColor;
    txt_Description.layer.borderWidth = 1.0;
    txt_Description.layer.cornerRadius = 5.0;
    [txt_Email setEnabled:true];
    [txt_FirstName setEnabled:true];
    [txt_IdNo setEnabled:true];
    [txt_LastName setEnabled:true];
    [txt_PostAddress setEnabled: true];
    [txt_Telephone setEnabled:true];
    
    [cell_costAccount setEnable:true];
    [cell_group setEnable:true];
    [cell_operatingBank setEnable:true];
    [cell_paymentTerm setEnable:true];
    [cell_status setEnable:true];
    [active setEnabled:true];
}
-(void)addDoneButton{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onSelectDoneButton)];
    self.navigationItem.rightBarButtonItem = item;
}
-(void)onSelectDoneButton{
    
    [txt_Address setEnabled:false];
    [txt_AddressNo setEnabled:false];
    [txt_BankAccountNo setEnabled:false];
    [txt_Code setEnabled:false];
    [txt_Description setEditable:false];
    txt_Description.layer.borderColor = [UIColor blackColor].CGColor;
    txt_Description.layer.borderWidth = 0.0;
    [txt_Email setEnabled:false];
    [txt_FirstName setEnabled:false];
    [txt_IdNo setEnabled:false];
    [txt_LastName setEnabled:false];
    [txt_PostAddress setEnabled: false];
    [txt_Telephone setEnabled:false];
    [cell_costAccount setEnable:false];
    [cell_group setEnable:false];
    [cell_operatingBank setEnable:false];
    [cell_paymentTerm setEnable:false];
    [cell_status setEnable:false];
    [active setEnabled:false];
    self.navigationItem.rightBarButtonItem.enabled =false;
    if (m_object) {
        [self updateContact];
    }
}
-(void)addCreateButton{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Submit" style:UIBarButtonItemStyleDone target:self action:@selector(onSelectCreateButton)];
    self.navigationItem.rightBarButtonItem = item;
}
-(void)onSelectCreateButton{
    [self createContact];
}

-(void)fillData{
    if (!m_object) {
        [txt_Address setEnabled:true];
        [txt_AddressNo setEnabled:true];
        [txt_BankAccountNo setEnabled:true];
        [txt_Code setEnabled:true];
        [txt_Description setEditable:true];
        txt_Description.layer.borderColor = [UIColor blackColor].CGColor;
        txt_Description.layer.borderWidth = 1.0;
        [txt_Email setEnabled:true];
        [txt_FirstName setEnabled:true];
        [txt_IdNo setEnabled:true];
        [txt_LastName setEnabled:true];
        [txt_PostAddress setEnabled: true];
        [txt_Telephone setEnabled:true];
        
        [cell_costAccount setEnable:true];
        [cell_group setEnable:true];
        [cell_operatingBank setEnable:true];
        [cell_paymentTerm setEnable:true];
        [cell_status setEnable:true];
        [active setEnabled:true];
        return;
    }
    [txt_Address setEnabled:false];
    [txt_AddressNo setEnabled:false];
    [txt_BankAccountNo setEnabled:false];
    [txt_Code setEnabled:false];
    [txt_Description setEditable:false];
    txt_Description.layer.borderColor = [UIColor blackColor].CGColor;
    txt_Description.layer.borderWidth = 0.0;
    [txt_Email setEnabled:false];
    [txt_FirstName setEnabled:false];
    [txt_IdNo setEnabled:false];
    [txt_LastName setEnabled:false];
    [txt_PostAddress setEnabled: false];
    [txt_Telephone setEnabled:false];
    [cell_costAccount setEnable:false];
    [cell_group setEnable:false];
    [cell_operatingBank setEnable:false];
    [cell_paymentTerm setEnable:false];
    [cell_status setEnable:false];
    [active setEnabled:false];
    if (![m_object.Phone isKindOfClass:[NSNull class]]) {
        txt_Telephone.text = m_object.Phone;
    }
    if (![m_object.PostAddress isKindOfClass:[NSNull class]]) {
        txt_Address.text = m_object.PostAddress;
    }
    if (![m_object.PostAddressNumber isKindOfClass:[NSNull class]]) {
        txt_AddressNo.text = m_object.PostAddressNumber;
    }
    if (![m_object.BankAccountNumber isKindOfClass:[NSNull class]]) {
        txt_BankAccountNo.text = m_object.BankAccountNumber;
    }
    if (![m_object.Code isKindOfClass:[NSNull class]]) {
        txt_Code.text = m_object.Code;
    }
    if (![m_object.Desc isKindOfClass:[NSNull class]]) {
        txt_Description.text = m_object.Desc;
    }
    if (![m_object.Email isKindOfClass:[NSNull class]]) {
        txt_Email.text = m_object.Email;
    }
    
    if (![m_object.FirstName isKindOfClass:[NSNull class]]) {
        txt_FirstName.text = m_object.FirstName;
    }
    if (![m_object.LastName isKindOfClass:[NSNull class]]) {
        txt_LastName.text = m_object.LastName;
    }
    if (![m_object.IDNumber isKindOfClass:[NSNull class]]) {
        txt_IdNo.text = m_object.IDNumber;
    }
    if (m_object.IsActive) {
        [active setOn:m_object.IsActive];
    }else{
        [active setOn:false];
    }
    
        
}

-(void)updateContact{
    NSMutableDictionary *params = [NSMutableDictionary new];
    [params setValue:m_object.Id forKey:@"Id"];
    if (cell_group.m_user_input!=-1) {
        [params setValue:[NSString stringWithFormat:@"%d",cell_group.m_user_input] forKey:@"ContactType"];
    }
    
    [params setValue:txt_Code.text forKey:@"Code"];
    [params setValue:txt_FirstName.text forKey:@"FirstName"];
    [params setValue:txt_LastName.text forKey:@"LastName"];
    [params setValue:txt_Telephone.text forKey:@"Phone"];
    [params setValue:txt_Address.text forKey:@"StreetAddress"];
    [params setValue:txt_AddressNo.text forKey:@"PostAddressNumber"];
    [params setValue:txt_Address.text forKey:@"PostAddress"];
    [params setValue:[NSString stringWithFormat:@"%d",active.isOn] forKey:@"IsActive"];
    [params setValue:txt_Description.text forKey:@"Desc"];
    [params setValue:txt_IdNo.text forKey:@"IDNumber"];
    
    if (cell_costAccount.m_user_input) {
        [params setValue:cell_costAccount.m_user_input forKey:@"CostAccountId"];
    }
    if (cell_operatingBank.m_user_input) {
        [params setValue:cell_operatingBank.m_user_input forKey:@"PaymentAccountId"];
    }
    [params setValue:txt_BankAccountNo.text forKey:@"BankAccountNumber"];
    if (cell_status.m_user_input) {
        [params setValue:cell_status.m_user_input forKey:@"GroupId"];
    }
    if (cell_paymentTerm.m_user_input) {
        [params setValue:cell_paymentTerm.m_user_input forKey:@"PaymentTermId"];
    }
    NSLog(@"params: %@", params);
    [OSConst showLocalProgressHudInView:self.navigationController.view WithTitle:@"Updating..."];
    [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:NULL forHTTPHeaderField:@"Accept"];
    [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:NULL forHTTPHeaderField:@"Content-Type"];
    [[AFAppDotNetAPIClient sharedClient] POST:kPathCreditContact parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [OSConst dismissLocalHUDInView:self.navigationController.view];
        [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
        NSLog(@"response update contact: %@", responseObject);
        @try {
            BOOL success = [[responseObject objectForKey:@"Success"] boolValue];
            if (success) {
                [OSConst showMessageInView:self.navigationController.view withTitle:@"Success" withMessage:@"Contact has been updated successful!"];
                [self.navigationController popViewControllerAnimated:YES];
            }else{
                [OSConst showMessageInView:self.navigationController.view withTitle:@"Error" withMessage:[responseObject objectForKey:@"Msg"]];
            }
        }
        @catch (NSException *exception) {
            
        }
        @finally {
            
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [OSConst dismissLocalHUDInView:self.navigationController.view];
        NSLog(@"fail update contact: %@", error.description);
        self.navigationItem.rightBarButtonItem.enabled =true;
        [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [OSConst showMessageInView:self.navigationController.view withTitle:@"Error" withMessage:@"Have some problems when update contact. Please try again!"];
    }];


}

-(void)createContact{
    NSMutableDictionary *params = [NSMutableDictionary new];
    if (cell_group.m_user_input!=-1) {
        [params setValue:[NSString stringWithFormat:@"%d",cell_group.m_user_input] forKey:@"ContactType"];
    }
    
    [params setValue:txt_Code.text forKey:@"Code"];
    [params setValue:txt_FirstName.text forKey:@"FirstName"];
    [params setValue:txt_LastName.text forKey:@"LastName"];
    [params setValue:txt_Telephone.text forKey:@"Phone"];
    [params setValue:txt_Address.text forKey:@"StreetAddress"];
    [params setValue:txt_AddressNo.text forKey:@"PostAddressNumber"];
    [params setValue:txt_Address.text forKey:@"PostAddress"];
    [params setValue:[NSString stringWithFormat:@"%d",active.isOn] forKey:@"IsActive"];
    [params setValue:txt_Description.text forKey:@"Desc"];
    [params setValue:txt_IdNo.text forKey:@"IDNumber"];
    
    if (cell_costAccount.m_user_input) {
        [params setValue:cell_costAccount.m_user_input forKey:@"CostAccountId"];
    }
    if (cell_operatingBank.m_user_input) {
        [params setValue:cell_operatingBank.m_user_input forKey:@"PaymentAccountId"];
    }
    [params setValue:txt_BankAccountNo.text forKey:@"BankAccountNumber"];
    if (cell_status.m_user_input) {
        [params setValue:cell_status.m_user_input forKey:@"GroupId"];
    }
    if (cell_paymentTerm.m_user_input) {
        [params setValue:cell_paymentTerm.m_user_input forKey:@"PaymentTermId"];
    }
    NSLog(@"params: %@", params);
    [OSConst showLocalProgressHudInView:self.navigationController.view WithTitle:@"Creating..."];
    [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:NULL forHTTPHeaderField:@"Accept"];
    [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:NULL forHTTPHeaderField:@"Content-Type"];
    [[AFAppDotNetAPIClient sharedClient] POST:kPathCreditContact parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [OSConst dismissLocalHUDInView:self.navigationController.view];
        NSLog(@"response update contact: %@", responseObject);
        
        @try {
            BOOL success = [[responseObject objectForKey:@"Success"] boolValue];
            if (success) {
                [OSConst showMessageInView:self.tableView withTitle:@"Success" withMessage:@"Contact has been updated successful!"];
                [self.navigationController popViewControllerAnimated:YES];
            }else{
                [OSConst showMessageInView:self.navigationController.view withTitle:@"Error" withMessage:[responseObject objectForKey:@"Msg"]];
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
        [OSConst dismissLocalHUDInView:self.navigationController.view];
        NSLog(@"fail update contact: %@", error.description);
        self.navigationItem.rightBarButtonItem.enabled =true;
        [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [OSConst showMessageInView:self.navigationController.view withTitle:@"Error" withMessage:@"Have some problems when update contact. Please try again!"];
    }];
}

-(void)onSelectBack{
    m_current_index--;
    if (m_current_index<0) {
        m_current_index=0;
        return;
    }
    m_object = [listContacts objectAtIndex:m_current_index];
    [self processLoad];
}

-(void)onSelectNext{
    m_current_index++;
    if (m_current_index>[listContacts count]-1) {
        m_current_index = [listContacts count]-1;
        return;
    }
    m_object = [listContacts objectAtIndex:m_current_index];
    [self processLoad];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (m_object) {
        return 44;
    }
    return 0;
}
-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (m_object) {
        ViewHeaderList *view = (ViewHeaderList*)[OSConst loadViewFromXib:@"ViewHeader" ownew:self viewClass:[ViewHeaderList class]];
        [view.btn_back addTarget:self action:@selector(onSelectBack) forControlEvents:UIControlEventTouchUpInside];
        [view.btn_next addTarget:self action:@selector(onSelectNext) forControlEvents:UIControlEventTouchUpInside];
        return view;
    }
    return NULL;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
