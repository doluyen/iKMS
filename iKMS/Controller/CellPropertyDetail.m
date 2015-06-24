//
//  CellPropertyDetail.m
//  iKMS
//
//  Created by Luyen Do Van on 6/11/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import "CellPropertyDetail.h"

@implementation CellPropertyDetail
@synthesize txt_name;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setEnable:(BOOL)enable{
    [txt_name setEnabled:enable];
}

@end
