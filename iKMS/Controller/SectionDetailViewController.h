//
//  SectionDetailViewController.h
//  iKMS
//
//  Created by Luyen Do Van on 6/10/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SectionObject.h"
#import "PropertyObject.h"

@interface SectionDetailViewController : UITableViewController{
     BOOL is_edit;
}
@property(nonatomic,strong)SectionObject *m_section;
@property(nonatomic,strong)PropertyObject *m_property;

@property(nonatomic)int m_current_index;
@property(nonatomic,assign)NSMutableArray *listContacts;

@end
