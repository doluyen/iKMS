//
//  CellContactDetailGroup.h
//  iKMS
//
//  Created by Luyen Do Van on 6/9/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactObject.h"
#import <QuartzCore/QuartzCore.h>

@interface CellContactDetailGroup : UITableViewCell{
    int m_selectedIndex;
    NSMutableArray *options;
}
@property(nonatomic,strong)IBOutlet UILabel *lb_title;
@property(nonatomic,strong)IBOutlet UILabel *lb_name;
@property(nonatomic,strong)IBOutlet UIImageView *img_accessory;
@property(nonatomic,strong)IBOutlet UITextField *txt_name;
@property(nonatomic)int m_user_input;

@property(nonatomic,strong)NSMutableArray *list_group;

-(void)loadUIWithData:(ContactObject*)object;
-(void)showPickerView;
-(void)setEnable:(BOOL)enable;
@end
