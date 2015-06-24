//
//  PropertyObject.h
//  iKMS
//
//  Created by Luyen Do Van on 6/10/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import <Foundation/Foundation.h>

//"Code": "3",
//"Name": "Lagårdsveien 69",
//"Floors": 3,
//"Sections": 33,
//"StartYear": 2000,
//"Square": 0,
//"PurchPrice": 0,
//"Debt": 0,
//"Address": "",
//"BlockNo": "",
//"SlotNo": "",
//"EnterpriseId": 0,
//"Id": 3,
//"InsertedBy": "Doanh"

@interface PropertyObject : NSObject
@property(nonatomic,strong)NSString* Code;
@property(nonatomic,strong)NSString* Name;
@property(nonatomic,strong)NSString* Floors;
@property(nonatomic,strong)NSString* Sections;
@property(nonatomic,strong)NSString* StartYear;
@property(nonatomic,strong)NSString* Square;
@property(nonatomic,strong)NSString* PurchPrice;
@property(nonatomic,strong)NSString *Debt;
@property(nonatomic,strong)NSString *Address;
@property(nonatomic,strong)NSString *BlockNo;
@property(nonatomic,strong)NSString *SlotNo;
@property(nonatomic,strong)NSString *EnterpriseId;
@property(nonatomic,strong)NSString *Id;
@property(nonatomic,strong)NSString *InsertedBy;

-(instancetype)initWithData:(id)data;
@end
