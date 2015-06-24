//
//  SectionObject.m
//  iKMS
//
//  Created by Luyen Do Van on 6/10/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import "SectionObject.h"

@implementation SectionObject
@synthesize Code,EnterpriseId,Id,InsertedBy,Name,Square,RentType,PropertyId,Property,MeasureNo,LeaseAmt,HNumber,Enterance,FeeAmt,Floor,DepartmentId,Department,Bedrooms;

-(instancetype)initWithData:(id)data{
    self = [super init];
    if (!self) {
        return nil;
    }
    Code = [data objectForKey:@"Code"];
    EnterpriseId = [data objectForKey:@"EnterpriseId"];
    Id = [data objectForKey:@"Id"];
    InsertedBy = [data objectForKey:@"InsertedBy"];
    Name = [data objectForKey:@"Name"];
    Square = [data objectForKey:@"Square"];
    RentType = [data objectForKey:@"RentType"];
    PropertyId = [data objectForKey:@"PropertyId"];
    Property = [data objectForKey:@"Property"];
    MeasureNo = [data objectForKey:@"MeasureNo"];
    LeaseAmt = [data objectForKey:@"LeaseAmt"];
    HNumber = [data objectForKey:@"HNumber"];
    Enterance = [data objectForKey:@"Enterance"];
    FeeAmt = [data objectForKey:@"FeeAmt"];
    Floor = [data objectForKey:@"Floor"];
    DepartmentId = [data objectForKey:@"DepartmentId"];
    Department = [data objectForKey:@"Department"];
    Bedrooms = [data objectForKey:@"Bedrooms"];
    
    return self;
}

-(instancetype)initWithName:(NSString*)name{
    self = [super init];
    if (!self) {
        return nil;
    }
    Name = name;
    return self;
}

@end
