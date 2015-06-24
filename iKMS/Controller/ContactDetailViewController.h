//
//  ContactDetailViewController.h
//  iKMS
//
//  Created by Luyen Do Van on 6/8/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactObject.h"


@interface ContactDetailViewController : UITableViewController{
    CGFloat _firstX;
    CGFloat _firstY;
    BOOL is_edit;
}
@property(nonatomic,strong)ContactObject *m_object;
@property(nonatomic)int m_current_index;
@property(nonatomic,assign)NSMutableArray *listContacts;
@end
