//
//  ContactObject.h
//  iKMS
//
//  Created by Luyen Do Van on 6/8/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ContactObject : NSObject

@property(nonatomic,strong)NSString* DepartmentId;
@property(nonatomic,strong)NSString* PaymentAccountId;
@property(nonatomic,strong)NSString* CostAccountId;
@property(nonatomic,strong)NSString* PaymentTermId;
@property(nonatomic,strong)NSString* GroupId;
@property(nonatomic,strong)NSString* ContactType;
@property(nonatomic,strong)NSString* Code;
@property(nonatomic,strong)NSString* FirstName;
@property(nonatomic,strong)NSString *LastName;
@property(nonatomic,strong)NSString *FullName;
@property(nonatomic,strong)NSString *ContactPerson;
@property(nonatomic,strong)NSString *Phone;
@property(nonatomic,strong)NSString *Email;
@property(nonatomic,strong)NSString *StreetAddress;
@property(nonatomic,strong)NSString *PostAddressNumber;
@property(nonatomic,strong)NSString *PostAddress;
@property(nonatomic,strong)NSString *PostFullAddress;
@property(nonatomic,strong)NSString *IDNumber;
@property(nonatomic,strong)NSString *BankName;
@property(nonatomic,strong)NSString *BankAccountNumber;
@property(nonatomic,strong)NSString *Desc;
@property(nonatomic)BOOL IsActive;
@property(nonatomic,strong)NSString *LoanAmt;
@property(nonatomic,strong)NSString *DepositAmt;
@property(nonatomic,strong)NSString *BalanceAmt;
@property(nonatomic,strong)NSString *Skills;

@property(nonatomic,strong)NSString *Group;
@property(nonatomic,strong)NSString *PaymentTerm;
@property(nonatomic,strong)NSString *PaymentAccount;
@property(nonatomic,strong)NSString *CostAccount;
@property(nonatomic,strong)NSString *EnterpriseId;
@property(nonatomic,strong)NSString *Id;
@property(nonatomic,strong)NSString *InsertedBy;

-(instancetype)initWithData:(id)data;

@end
