//
//  GroupObject.m
//  iKMS
//
//  Created by Luyen Do Van on 6/8/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import "GroupObject.h"
//"Name": "Supplier",
//"Contingent": 0,
//"Deposit": 0,
//"Reduction": 0,
//"Desc": null,
//"EnterpriseId": 0,
//"Id": 2,
//"InsertedBy": "Doanh"
@implementation GroupObject

@synthesize Name,Contingent,Deposit,Reduction,Desc,EnterpriseId,InsertedBy,Id;

-(instancetype)initWithData:(id)data{
    self =[super init];
    if (!self) {
        return NULL;
    }
    Name = [data objectForKey:@"Name"];
    Contingent = [data objectForKey:@"Contingent"];
    Deposit= [data objectForKey:@"Deposit"];
    Reduction= [data objectForKey:@"Reduction"];
    Desc = [data objectForKey:@"Desc"];
    EnterpriseId = [data objectForKey:@"EnterpriseId"];
    Id = [data objectForKey:@"Id"];
    InsertedBy = [data objectForKey:@"InsertedBy"];
    return self;
}
@end
