//
//  PaymentTermObject.h
//  iKMS
//
//  Created by Luyen Do Van on 6/8/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PaymentTermObject : NSObject
@property(nonatomic,strong)NSString *Name;
@property(nonatomic,strong)NSString *Days;
@property(nonatomic,strong)NSString *NameDays;
@property(nonatomic,strong)NSString *Desc;
@property(nonatomic,strong)NSString *EnterpriseId;
@property(nonatomic,strong)NSString *Id;
@property(nonatomic,strong)NSString *InsertedBy;


-(instancetype)initWithData:(id)data;
@end
