//
//  LoginViewController.m
//  iKMS
//
//  Created by Luyen Do Van on 6/8/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize username,password,button_login;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    button_login.layer.borderColor = [OSConst colorWithHexString: color_button_blue].CGColor;
    button_login.layer.borderWidth = 1.0;
    button_login.layer.cornerRadius = 5.0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)btnLogin:(id)sender{
    if ([self checkInvalidate]) {
        [OSConst showLocalProgressHudInView:self.navigationController.view WithTitle:@"Loading..."];
        NSMutableDictionary *params = [NSMutableDictionary new];
        [params setValue:username.text forKey:@"username"];
        [params setValue:password.text forKey:@"password"];
        [params setValue:@"password" forKey:@"grant_type"];
        [[AFAppDotNetAPIClient sharedClient] POST:kPathUserLogin parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            [OSConst dismissLocalHUDInView:self.navigationController.view];
            NSLog(@"response login: %@", responseObject);
            NSString *access_token = [responseObject objectForKey:@"access_token"];
            NSString *token_type = [responseObject objectForKey:@"token_type"];
            if (access_token!=NULL&&token_type!=NULL) {
                Authorization = [NSString stringWithFormat:@"%@ %@",token_type,access_token];
                [[AFAppDotNetAPIClient sharedClient].requestSerializer setValue:Authorization forHTTPHeaderField:@"Authorization"];
            }
            
            UIViewController *rootViewControler=[self.storyboard instantiateViewControllerWithIdentifier:@"NavigationMainViewController"];
            AppDelegate *_delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
            [UIView  transitionWithView:_delegate.window
                               duration:0.1
                                options:UIViewAnimationOptionCurveEaseOut
                             animations:^{
                                 [_delegate.window setRootViewController:rootViewControler];
                             }
                             completion:^(BOOL finished) {
                                 
                             }];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [OSConst dismissLocalHUDInView:self.navigationController.view];
            NSLog(@"error login: %@", error.description);
            [OSConst showMessageInView:self.view withTitle:@"Error" withMessage:@"Have some problems when login. Please try again!"];
        }];
        
    }
}
-(BOOL)checkInvalidate{
//    username.text = @"test";
//    password.text = @"123456";

    if (username.text.length==0) {
        [OSConst showMessageInView:self.view withTitle:@"Error" withMessage:@"Please input username!"];
        return false;
    }
    if (password.text.length==0) {
        [OSConst showMessageInView:self.view withTitle:@"Error" withMessage:@"Please input password!"];
        return false;
    }
    return true;
}
-(IBAction)btnGetAllAccount:(id)sender{

    [[AFAppDotNetAPIClient sharedClient] GET:kPathGetAllAccount parameters:NULL success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"response getAllAccount: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error getAllAccount: %@", error.description);
    }];
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
////    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [manager.requestSerializer setValue:Authorization forHTTPHeaderField:@"Authorization"];
//    NSLog(@"header request %@", manager.requestSerializer);
//    [manager GET:kPathGetAllAccount parameters:NULL success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"response getAllAccount: %@", responseObject);
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"error getAllAccount: %@", error.description);
//    }];
}

@end
