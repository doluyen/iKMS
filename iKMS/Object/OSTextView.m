//
//  OSTextView.m
//  iKMS
//
//  Created by Luyen Do Van on 6/11/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import "OSTextView.h"

@implementation OSTextView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)drawRect:(CGRect)rect{
    if (![self isEditable]) {
        self.layer.borderColor = [OSConst colorWithHexString:color_button_black].CGColor;
        self.layer.borderWidth = 0.0;
    }else{
        self.layer.borderColor = [OSConst colorWithHexString:color_button_black].CGColor;
        self.layer.cornerRadius = 5.0;
        self.layer.borderWidth = 1.0;
    }
    [super drawRect:rect];
}
@end
