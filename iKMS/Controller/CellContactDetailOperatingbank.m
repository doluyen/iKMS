//
//  CellContactDetailOperatingbank.m
//  iKMS
//
//  Created by Luyen Do Van on 6/9/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import "CellContactDetailOperatingbank.h"
#import "AccountChildrenObject.h"
#import "ActionSheetPicker.h"

@implementation CellContactDetailOperatingbank
@synthesize lb_name,lb_title,list_AccountChildren,txt_name,m_user_input,img_accessory;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)loadUIWithData:(ContactObject*)object{
    list_AccountChildren = [NSMutableArray new];
    options = [NSMutableArray new];
    [self sendRequestGetAccountChildrenAll];
    lb_name.layer.borderColor = [UIColor blackColor].CGColor;
    lb_name.layer.borderWidth = 1.0;
    paymentAccountId =  object.PaymentAccountId;
}

-(void)sendRequestGetAccountChildrenAll{
    [[AFAppDotNetAPIClient sharedClient] GET:kPathGetAccountChildrenAll parameters:NULL success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [list_AccountChildren removeAllObjects];
        [options removeAllObjects];
        NSLog(@"response GetAccountChildrenAll: %@", responseObject);
        int idx = -1;
        int index = -1;
        if (![paymentAccountId isKindOfClass:[NSNull class]]) {
            idx = [paymentAccountId intValue];
        }
        for (id data in responseObject) {
            AccountChildrenObject *object = [[AccountChildrenObject alloc] initWithData:data];
            if ([object.Id intValue]==idx) {
                index = [list_AccountChildren count];
            }
            [list_AccountChildren addObject:object];
            [options addObject:object.Name];
        }
        if (index!=-1) {
            m_selectedIndex = index;
            lb_name.text = [options objectAtIndex:m_selectedIndex];
            m_user_input = ((AccountChildrenObject*)[list_AccountChildren objectAtIndex:m_selectedIndex]).Id;
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error GetAccountChildrenAll: %@", error.description);
    }];
}

-(void)showPickerView{
    ActionStringDoneBlock done = ^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
        m_selectedIndex = selectedIndex;
        lb_name.text = [options objectAtIndex:selectedIndex];
//        txt_name.text= [options objectAtIndex:selectedIndex];
        m_user_input = ((AccountChildrenObject*)[list_AccountChildren objectAtIndex:m_selectedIndex]).Id;
    };
    ActionStringCancelBlock cancel = ^(ActionSheetStringPicker *picker) {
        
    };
    
    int index = (m_selectedIndex >= 0) ? m_selectedIndex : 0;
    
    [ActionSheetStringPicker showPickerWithTitle:@"Select Operating Bank Acc" rows:options initialSelection:index doneBlock:done cancelBlock:cancel origin:self];
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
