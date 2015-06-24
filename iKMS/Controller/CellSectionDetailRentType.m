//
//  CellSectionDetailRentType.m
//  iKMS
//
//  Created by Luyen Do Van on 6/11/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import "CellSectionDetailRentType.h"
#import "ActionSheetPicker.h"

@implementation CellSectionDetailRentType
@synthesize lb_name,m_user_input,img_accessory;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)loadUIWithData:(SectionObject *)data{
    m_user_input = -1;
    lb_name.layer.borderColor = [UIColor blackColor].CGColor;
    lb_name.layer.borderWidth = 1.0;
    options = [NSMutableArray new];
    [options addObject:@"Daily"];
    [options addObject:@"Monthly"];
    if (data.RentType) {
        @try {
            m_selectedIndex = [data.RentType intValue];
            m_user_input = m_selectedIndex;
            lb_name.text = [options objectAtIndex:m_selectedIndex];
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
    
    [ActionSheetStringPicker showPickerWithTitle:@"Select Type" rows:options initialSelection:index doneBlock:done cancelBlock:cancel origin:self];
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
