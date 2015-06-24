//
//  PropertyObject.m
//  iKMS
//
//  Created by Luyen Do Van on 6/10/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import "PropertyObject.h"

@implementation PropertyObject
@synthesize Address,Sections,SlotNo,Square,StartYear,BlockNo,Name,PurchPrice,InsertedBy,Id,Floors,EnterpriseId,Debt,Code;

-(instancetype)initWithData:(id)data{
    self = [super init];
    if (!self) {
        return nil;
    }
    Address = [data objectForKey:@"Address"];
    Sections = [data objectForKey:@"Sections"];
    SlotNo = [data objectForKey:@"SlotNo"];
    Square = [data objectForKey:@"Square"];
    StartYear = [data objectForKey:@"StartYear"];
    BlockNo = [data objectForKey:@"BlockNo"];
    Name = [data objectForKey:@"Name"];
    PurchPrice = [data objectForKey:@"PurchPrice"];
    InsertedBy = [data objectForKey:@"InsertedBy"];
    Id = [data objectForKey:@"Id"];
    Floors = [data objectForKey:@"Floors"];
    EnterpriseId = [data objectForKey:@"EnterpriseId"];
    Debt = [data objectForKey:@"Debt"];
    Code = [data objectForKey:@"Code"];
    
    
    return self;
}
@end
