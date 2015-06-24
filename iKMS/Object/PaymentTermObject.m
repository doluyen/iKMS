//
//  PaymentTermObject.m
//  iKMS
//
//  Created by Luyen Do Van on 6/8/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import "PaymentTermObject.h"
//"Name": "kreditt 20 dager",
//"Days": 20,
//"NameDays": "kreditt 20 dager(20)",
//"Desc": null,
//"EnterpriseId": 0,
//"Id": 2,
//"InsertedBy": "Doanh"
@implementation PaymentTermObject
@synthesize Name,Days,NameDays,Desc,EnterpriseId,Id,InsertedBy;

-(instancetype)initWithData:(id)data{
    self =[super init];
    if (!self) {
        return NULL;
    }
    Name = [data objectForKey:@"Name"];
    Days = [data objectForKey:@"Days"];
    NameDays = [data objectForKey:@"NameDays"];
    Desc = [data objectForKey:@"Desc"];
    EnterpriseId = [data objectForKey:@"EnterpriseId"];
    Id = [data objectForKey:@"Id"];
    InsertedBy = [data objectForKey:@"InsertedBy"];
    
    return self;
}

@end
