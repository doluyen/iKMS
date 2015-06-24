//
//  AccountChildrenObject.h
//  iKMS
//
//  Created by Luyen Do Van on 6/8/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccountChildrenObject : NSObject
@property(nonatomic,strong)NSString *ParentId;
@property(nonatomic,strong)NSString *Code;
@property(nonatomic,strong)NSString *Name;
@property(nonatomic,strong)NSString *CodeName;
@property(nonatomic,strong)NSString *LastAmt;
@property(nonatomic,strong)NSString *CurrentAmt;
@property(nonatomic,strong)NSString *AccountType;
@property(nonatomic,strong)NSString *ViewType;
@property(nonatomic,strong)NSString *AccountLevel;
@property(nonatomic)BOOL IsTotal;
@property(nonatomic,strong)NSString *Desc;
@property(nonatomic)BOOL IsVariable;
@property(nonatomic)BOOL IsActive;
@property(nonatomic,strong)NSString *Used;
@property(nonatomic,strong)NSString *Source;
@property(nonatomic,strong)NSString *Parent;
@property(nonatomic,strong)NSString *AccountDepartmentShares;
@property(nonatomic,strong)NSString *EnterpriseId;
@property(nonatomic,strong)NSString *Id;
@property(nonatomic,strong)NSString *InsertedBy;

-(instancetype)initWithData:(id)data;
@end
