//
//  CellContactDetailStatus.h
//  iKMS
//
//  Created by Luyen Do Van on 6/9/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactObject.h"

@interface CellContactDetailStatus : UITableViewCell{
    int m_selectedIndex;
    NSMutableArray *options;
    NSString *groupId;
}
@property(nonatomic,strong)IBOutlet UILabel *lb_title;
@property(nonatomic,strong)IBOutlet UILabel *lb_name;
@property(nonatomic,strong)IBOutlet UIImageView *img_accessory;
@property(nonatomic,strong)IBOutlet UITextField *txt_name;
@property(nonatomic,strong)NSMutableArray *list_Group;
@property(nonatomic,strong)NSString* m_user_input;

-(void)loadUIWithData:(ContactObject*)object;
-(void)showPickerView;
-(void)setEnable:(BOOL)enable;

@end
