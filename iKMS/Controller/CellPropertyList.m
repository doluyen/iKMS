//
//  CellPropertyList.m
//  iKMS
//
//  Created by Luyen Do Van on 6/10/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import "CellPropertyList.h"

@implementation CellPropertyList
@synthesize lb_name;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)loadUIWithData:(PropertyObject*)data{
    lb_name.text = data.Name;
}

@end
