//
//  CellSectionDetailRentType.h
//  iKMS
//
//  Created by Luyen Do Van on 6/11/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SectionObject.h"

@interface CellSectionDetailRentType : UITableViewCell{
    int m_selectedIndex;
    NSMutableArray *options;
}
@property(nonatomic,strong)IBOutlet UILabel *lb_name;
@property(nonatomic,strong)IBOutlet UIImageView *img_accessory;
@property(nonatomic)int m_user_input;

-(void)loadUIWithData:(SectionObject*)data;
-(void)showPickerView;
-(void)setEnable:(BOOL)enable;

@end
