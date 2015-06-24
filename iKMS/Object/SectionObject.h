//
//  SectionObject.h
//  iKMS
//
//  Created by Luyen Do Van on 6/10/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import <Foundation/Foundation.h>

//"DepartmentId": 0,
//"PropertyId": 3,
//"Code": "11",
//"Name": "LAG69-0101,10",
//"Enterance": "A",
//"Floor": "",
//"Square": 10,
//"Bedrooms": 1,
//"Livingrooms": 0,
//"Bathrooms": 0,
//"MeasureNo": "",
//"LeaseAmt": 150,
//"FeeAmt": 0,
//"HNumber": "",
//"RentType": 0,
//"Department": null,
//"Property": null,
//"EnterpriseId": 0,
//"Id": 11,
//"InsertedBy": "Doanh"
@interface SectionObject : NSObject
@property(nonatomic,strong)NSString* DepartmentId;
@property(nonatomic,strong)NSString* PropertyId;
@property(nonatomic,strong)NSString* Code;
@property(nonatomic,strong)NSString* Name;
@property(nonatomic,strong)NSString* Enterance;
@property(nonatomic,strong)NSString* Floor;
@property(nonatomic,strong)NSString* Square;
@property(nonatomic,strong)NSString *Bedrooms;
@property(nonatomic,strong)NSString *MeasureNo;
@property(nonatomic,strong)NSString *LeaseAmt;
@property(nonatomic,strong)NSString *FeeAmt;
@property(nonatomic,strong)NSString *HNumber;
@property(nonatomic,strong)NSString *RentType;
@property(nonatomic,strong)NSString *Department;
@property(nonatomic,strong)NSString *Property;
@property(nonatomic,strong)NSString *EnterpriseId;
@property(nonatomic,strong)NSString *Id;
@property(nonatomic,strong)NSString *InsertedBy;

-(instancetype)initWithData:(id)data;

-(instancetype)initWithName:(NSString*)name;
@end
