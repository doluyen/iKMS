//
//  LoginViewController.h
//  iKMS
//
//  Created by Luyen Do Van on 6/8/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController{
    NSString *Authorization;
}
@property(nonatomic,strong)IBOutlet UITextField *username;
@property(nonatomic,strong)IBOutlet UITextField *password;
@property(nonatomic,strong)IBOutlet UIButton *button_login;

@end
