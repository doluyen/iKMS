//
//  GroupObject.h
//  iKMS
//
//  Created by Luyen Do Van on 6/8/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GroupObject : NSObject
@property(nonatomic,strong)NSString *Name;
@property(nonatomic,strong)NSString *Contingent;
@property(nonatomic,strong)NSString *Deposit;
@property(nonatomic,strong)NSString *Reduction;
@property(nonatomic,strong)NSString *Desc;
@property(nonatomic,strong)NSString *EnterpriseId;
@property(nonatomic,strong)NSString *Id;
@property(nonatomic,strong)NSString *InsertedBy;

-(instancetype)initWithData:(id)data;
@end
