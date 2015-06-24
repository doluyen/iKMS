//
//  OSLabel.m
//  iKMS
//
//  Created by Luyen Do Van on 6/9/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import "OSLabel.h"

@implementation OSLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawTextInRect:(CGRect)rect {
    
    UIEdgeInsets insets = {0, 5, 0, 5};
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
    if (![self isEnabled]) {
        self.layer.borderColor = [OSConst colorWithHexString:color_button_black].CGColor;
        self.layer.borderWidth = 0.0;
    }else{
        self.layer.borderColor = [OSConst colorWithHexString:color_button_black].CGColor;
        self.layer.cornerRadius = 5.0;
        self.layer.borderWidth = 1.0;
    }
}

-(void)drawRect:(CGRect)rect{
    if (![self isEnabled]) {
        self.layer.borderColor = [OSConst colorWithHexString:color_button_black].CGColor;
        self.layer.borderWidth = 0.0;
    }else{
        self.layer.borderColor = [OSConst colorWithHexString:color_button_black].CGColor;
        self.layer.cornerRadius = 5.0;
        self.layer.borderWidth = 1.0;
    }
    [super drawRect:rect];
}
-(void)layoutSubviews{
    if (![self isEnabled]) {
        self.layer.borderColor = [OSConst colorWithHexString:color_button_black].CGColor;
        self.layer.borderWidth = 0.0;
    }else{
        self.layer.borderColor = [OSConst colorWithHexString:color_button_black].CGColor;
        self.layer.cornerRadius = 5.0;
        self.layer.borderWidth = 1.0;
    }
    [super layoutSubviews];
}

@end
