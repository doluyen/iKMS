//
//  CellSectionList.h
//  iKMS
//
//  Created by Luyen Do Van on 6/11/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SectionObject.h"

@interface CellSectionList : UITableViewCell

@property(nonatomic,strong)IBOutlet UILabel *lb_name;

-(void)loadUIWithData:(SectionObject*)data;
@end
