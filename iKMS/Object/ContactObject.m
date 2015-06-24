//
//  ContactObject.m
//  iKMS
//
//  Created by Luyen Do Van on 6/8/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import "ContactObject.h"
//"DepartmentId": 0,
//"PaymentAccountId": null,
//"CostAccountId": null,
//"PaymentTermId": null,
//"GroupId": 1,
//"ContactType": 2,
//"Code": "MM00012",
//"FirstName": "Feng Cheng",
//"LastName": "Ye",
//"FullName": "Feng Cheng Ye",
//"ContactPerson": null,
//"Phone": "",
//"Email": "ye@utleie.no",
//"StreetAddress": "",
//"PostAddressNumber": "",
//"PostAddress": "",
//"PostFullAddress": " ",
//"IDNumber": "MM00012",
//"BankName": null,
//"BankAccountNumber": "",
//"Desc": "",
//"IsActive": true,
//"LoanAmt": 0,
//"DepositAmt": 0,
//"BalanceAmt": 0,
//"Skills": null,
//"Group": null,
//"PaymentTerm": null,
//"PaymentAccount": null,
//"CostAccount": null,
//"EnterpriseId": 0,
//"Id": 12,
//"InsertedBy": "Doanh"
@implementation ContactObject
@synthesize DepartmentId,PaymentAccountId,CostAccountId,PaymentTermId,GroupId,ContactType,Code,FirstName,LastName,FullName,ContactPerson,Phone,Email,StreetAddress,PostAddressNumber,PostAddress,PostFullAddress,IDNumber,BankName,BankAccountNumber,Desc,IsActive,LoanAmt,DepositAmt,BalanceAmt,Skills,Group,PaymentTerm,PaymentAccount,CostAccount,EnterpriseId,Id,InsertedBy;

-(instancetype)initWithData:(id)data{
    self = [super init];
    if(!self){
        return NULL;
    }
    DepartmentId = [data objectForKey:@"DepartmentId"];
    PaymentAccountId = [data objectForKey:@"PaymentAccountId"];
    CostAccountId = [data objectForKey:@"CostAccountId"];
    PaymentTermId = [data objectForKey:@"PaymentTermId"];
    GroupId = [data objectForKey:@"GroupId"];
    ContactType = [data objectForKey:@"ContactType"];
    Code = [data objectForKey:@"Code"];
    FirstName = [data objectForKey:@"FirstName"];
    LastName = [data objectForKey:@"LastName"];
    FullName = [data objectForKey:@"FullName"];
    ContactPerson = [data objectForKey:@"ContactPerson"];
    Phone = [data objectForKey:@"Phone"];
    Email = [data objectForKey:@"Email"];
    StreetAddress = [data objectForKey:@"StreetAddress"];
    PostAddressNumber = [data objectForKey:@"PostAddressNumber"];
    PostAddress = [data objectForKey:@"PostAddress"];
    PostFullAddress = [data objectForKey:@"PostFullAddress"];
    IDNumber = [data objectForKey:@"IDNumber"];
    BankName = [data objectForKey:@"BankName"];
    BankAccountNumber = [data objectForKey:@"BankAccountNumber"];
    Desc = [data objectForKey:@"Desc"];
    IsActive = [[data objectForKey:@"IsActive"] boolValue];
    LoanAmt = [data objectForKey:@"LoanAmt"];
    DepositAmt = [data objectForKey:@"DepositAmt"];
    BalanceAmt = [data objectForKey:@"BalanceAmt"];
    Skills = [data objectForKey:@"Skills"];
    Group = [data objectForKey:@"Group"];
    PaymentTerm = [data objectForKey:@"PaymentTerm"];
    PaymentAccount = [data objectForKey:@"PaymentAccount"];
    CostAccount = [data objectForKey:@"CostAccount"];
    EnterpriseId = [data objectForKey:@"EnterpriseId"];
    Id = [data objectForKey:@"Id"];
    InsertedBy = [data objectForKey:@"InsertedBy"];
    
    return self;
}

@end
