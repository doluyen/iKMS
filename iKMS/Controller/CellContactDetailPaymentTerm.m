//
//  CellContactDetailPaymentTerm.m
//  iKMS
//
//  Created by Luyen Do Van on 6/9/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import "CellContactDetailPaymentTerm.h"
#import "PaymentTermObject.h"
#import "ActionSheetPicker.h"

@implementation CellContactDetailPaymentTerm
@synthesize lb_name,lb_title,list_PaymentTerm,txt_name,m_user_input,img_accessory;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)loadUIWithData:(ContactObject*)object{
    list_PaymentTerm = [NSMutableArray new];
    options = [NSMutableArray new];
    [self sendRequestGetPaymentTermAll];
    lb_name.layer.borderColor = [UIColor blackColor].CGColor;
    lb_name.layer.borderWidth = 1.0;
    paymentTermId = object.PaymentTermId;
}

-(void)sendRequestGetPaymentTermAll{
    [[AFAppDotNetAPIClient sharedClient] GET:kPathGetPaymentTermAll parameters:NULL success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"response GetPaymentTermAll: %@", responseObject);
        [list_PaymentTerm removeAllObjects];
        [options removeAllObjects];
        int idx = -1;
        int index = -1;
        if (![paymentTermId isKindOfClass:[NSNull class]]) {
            idx = [paymentTermId intValue];
        }
        for (id data in responseObject) {
            PaymentTermObject *object= [[PaymentTermObject alloc] initWithData:data];
            if ([object.Id intValue]==idx) {
                index = [list_PaymentTerm count];
            }
            [list_PaymentTerm addObject:object];
            [options addObject:object.Name];
        }
        if (index!=-1) {
            m_selectedIndex = index;
            lb_name.text = [options objectAtIndex:m_selectedIndex];
            m_user_input = ((PaymentTermObject*)[list_PaymentTerm objectAtIndex:m_selectedIndex]).Id;
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error GetPaymentTermAll: %@", error.description);
    }];
}

-(void)showPickerView{
    ActionStringDoneBlock done = ^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
        m_selectedIndex = selectedIndex;
        lb_name.text = [options objectAtIndex:selectedIndex];
//        txt_name.text= [options objectAtIndex:selectedIndex];
        m_user_input = ((PaymentTermObject*)[list_PaymentTerm objectAtIndex:m_selectedIndex]).Id;
    };
    ActionStringCancelBlock cancel = ^(ActionSheetStringPicker *picker) {
        
    };
    
    int index = (m_selectedIndex >= 0) ? m_selectedIndex : 0;
    
    [ActionSheetStringPicker showPickerWithTitle:@"Select Payment Term" rows:options initialSelection:index doneBlock:done cancelBlock:cancel origin:self];
}

-(void)setEnable:(BOOL)enable{
    [lb_name setEnabled:enable];
    [lb_name layoutSubviews];
    if (enable) {
        img_accessory.alpha = 1;
    }else{
        img_accessory.alpha = 0;
    }
}

@end
