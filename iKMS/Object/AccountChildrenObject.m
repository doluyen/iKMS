//
//  AccountChildrenObject.m
//  iKMS
//
//  Created by Luyen Do Van on 6/8/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import "AccountChildrenObject.h"
//"ParentId": null,
//"Code": "1100",
//"Name": "Forretningsbygg, eiendommer",
//"CodeName": "1100  Forretningsbygg, eiendommer",
//"LastAmt": 0,
//"CurrentAmt": 0,
//"AccountType": 0,
//"ViewType": 0,
//"AccountLevel": 0,
//"IsTotal": false,
//"Desc": null,
//"IsVariable": false,
//"IsActive": false,
//"Used": null,
//"Source": null,
//"Parent": null,
//"AccountDepartmentShares": null,
//"EnterpriseId": 0,
//"Id": 3,
//"InsertedBy": "Doanh"
@implementation AccountChildrenObject
@synthesize ParentId,Code,CodeName,Name,LastAmt,CurrentAmt,AccountType,ViewType,AccountLevel,IsTotal,Desc,IsVariable,IsActive,Used,Source,Parent,AccountDepartmentShares,EnterpriseId,Id,InsertedBy;

-(instancetype)initWithData:(id)data{
    self = [super init];
    if (!self) {
        return NULL;
    }
    ParentId = [data objectForKey:@"ParentId"];
    Code = [data objectForKey:@"Code"];
    Name = [data objectForKey:@"Name"];
    CodeName = [data objectForKey:@"CodeName"];
    LastAmt = [data objectForKey:@"LastAmt"];
    CurrentAmt = [data objectForKey:@"CurrentAmt"];
    AccountType = [data objectForKey:@"AccountType"];
    ViewType = [data objectForKey:@"ViewType"];
    AccountLevel = [data objectForKey:@"AccountLevel"];
    IsTotal = [[data objectForKey:@"IsTotal"] boolValue];
    Desc = [data objectForKey:@"Desc"];
    IsVariable = [[data objectForKey:@"IsVariable"] boolValue];
    IsActive = [[data objectForKey:@"IsActive"] boolValue];
    Used = [data objectForKey:@"Used"];
    Source = [data objectForKey:@"Source"];
    Parent = [data objectForKey:@"Parent"];
    AccountDepartmentShares = [data objectForKey:@"AccountDepartmentShares"];
    EnterpriseId = [data objectForKey:@"EnterpriseId"];
    Id = [data objectForKey:@"Id"];
    InsertedBy = [data objectForKey:@"InsertedBy"];
    
    
    return self;
}
@end
