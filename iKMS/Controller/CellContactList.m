//
//  CellContactList.m
//  iKMS
//
//  Created by Luyen Do Van on 6/8/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import "CellContactList.h"

@implementation CellContactList
@synthesize lb_name;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)loadUIWithData:(ContactObject*)object{
    lb_name.text = object.FullName;
}

@end
