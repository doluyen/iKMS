//
//  CellPropertyDetail.h
//  iKMS
//
//  Created by Luyen Do Van on 6/11/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PropertyObject.h"
#import "OSTextField.h"

@interface CellPropertyDetail : UITableViewCell
@property(nonatomic,strong)IBOutlet OSTextField *txt_name;

-(void)setEnable:(BOOL)enable;
@end
