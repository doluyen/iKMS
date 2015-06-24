//
//  CellContactList.h
//  iKMS
//
//  Created by Luyen Do Van on 6/8/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactObject.h"

@interface CellContactList : UITableViewCell
@property(nonatomic,strong)IBOutlet UILabel *lb_name;

-(void)loadUIWithData:(ContactObject*)object;
@end
