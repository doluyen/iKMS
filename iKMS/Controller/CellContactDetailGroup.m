//
//  CellContactDetailGroup.m
//  iKMS
//
//  Created by Luyen Do Van on 6/9/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import "CellContactDetailGroup.h"
#import "ActionSheetPicker.h"

//Supplier = 0,
//Customer = 1,
//Member = 2,
//Owner = 3,
//Renter = 4,


@implementation CellContactDetailGroup
@synthesize lb_name,lb_title,list_group,txt_name,m_user_input,img_accessory;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)loadUIWithData:(ContactObject*)object{
    options = [NSMutableArray new];
    m_user_input = -1;
    [options addObject:@"Supplier"];
    [options addObject:@"Customer"];
    [options addObject:@"Member"];
    [options addObject:@"Owner"];
    [options addObject:@"Renter"];
    lb_name.layer.borderColor = [UIColor blackColor].CGColor;
    lb_name.layer.borderWidth = 1.0;
    NSString *groupId = object.ContactType;
    if (groupId!=NULL) {
        @try {
            m_selectedIndex = [groupId intValue];
            lb_name.text = [options objectAtIndex:m_selectedIndex];
            m_user_input = m_selectedIndex;
        }
        @catch (NSException *exception) {
            
        }
        @finally {
            
        }
        
    }
    
}

-(void)showPickerView{
    ActionStringDoneBlock done = ^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
        m_selectedIndex = selectedIndex;
        lb_name.text = [options objectAtIndex:selectedIndex];
//        txt_name.text= [options objectAtIndex:selectedIndex];
        m_user_input = m_selectedIndex;
        
    };
    ActionStringCancelBlock cancel = ^(ActionSheetStringPicker *picker) {
        
    };
    
    int index = (m_selectedIndex >= 0) ? m_selectedIndex : 0;
    
    [ActionSheetStringPicker showPickerWithTitle:@"Select Group" rows:options initialSelection:index doneBlock:done cancelBlock:cancel origin:self];
}

-(void)setEnable:(BOOL)enable{
    [lb_name setEnabled:enable];
    if (enable) {
        img_accessory.alpha = 1;
    }else{
        img_accessory.alpha = 0;
    }
}

@end
