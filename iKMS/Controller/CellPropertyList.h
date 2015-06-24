//
//  CellPropertyList.h
//  iKMS
//
//  Created by Luyen Do Van on 6/10/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PropertyObject.h"

@interface CellPropertyList : UITableViewCell
@property(nonatomic,strong)IBOutlet UILabel *lb_name;

-(void)loadUIWithData:(PropertyObject*)data;
@end
