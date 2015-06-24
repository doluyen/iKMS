//
//  CellContactDetailStatus.m
//  iKMS
//
//  Created by Luyen Do Van on 6/9/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import "CellContactDetailStatus.h"
#import "GroupObject.h"
#import "ActionSheetPicker.h"

@implementation CellContactDetailStatus
@synthesize lb_name,lb_title,list_Group,txt_name,m_user_input,img_accessory;
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)loadUIWithData:(ContactObject*)object{
    list_Group = [NSMutableArray new];
    options  =[NSMutableArray new];
    [self sendRequestGetGroupAll];
    lb_name.layer.borderColor = [UIColor blackColor].CGColor;
    lb_name.layer.borderWidth = 1.0;
    groupId = object.GroupId;
    
    
}

-(void)sendRequestGetGroupAll{
    [[AFAppDotNetAPIClient sharedClient] GET:kPathGetGroupAll parameters:NULL success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"response GetGroupAll: %@", responseObject);
        [list_Group removeAllObjects];
        [options removeAllObjects];
        int idx = -1;
        int index = -1;
        if (![groupId isKindOfClass:[NSNull class]]) {
            idx = [groupId intValue];
        }
        for (id data in responseObject) {
            GroupObject *object = [[GroupObject alloc] initWithData:data];
            if ([object.Id intValue]==idx) {
                index = [list_Group count];
            }
            [list_Group addObject:object];
            [options addObject:object.Name];
        }
        if (index !=-1) {
            m_selectedIndex = index;
            lb_name.text = [options objectAtIndex:m_selectedIndex];
            m_user_input = ((GroupObject*)[list_Group objectAtIndex:m_selectedIndex]).Id;
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error GetGroupAll: %@", error.description);
        
    }];
}
-(void)showPickerView{
    ActionStringDoneBlock done = ^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue) {
        m_selectedIndex = selectedIndex;
        lb_name.text = [options objectAtIndex:selectedIndex];
//        txt_name.text= [options objectAtIndex:selectedIndex];
        m_user_input = ((GroupObject*)[list_Group objectAtIndex:m_selectedIndex]).Id;
    };
    ActionStringCancelBlock cancel = ^(ActionSheetStringPicker *picker) {
        
    };
    
    int index = (m_selectedIndex >= 0) ? m_selectedIndex : 0;
    
    [ActionSheetStringPicker showPickerWithTitle:@"Select Status" rows:options initialSelection:index doneBlock:done cancelBlock:cancel origin:self];
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
