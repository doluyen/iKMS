//
//  OSConst.m
//  AllGoEasy
//
//  Created by Luyen Do Van on 5/5/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import "OSConst.h"

static OSConst * C;
@implementation OSConst
@synthesize user_id,username,session_key;

+(OSConst*)loadConsts{
    if(!C){
        C = [[OSConst alloc] init];
    }
    return C;
    
}

-(id)init{
    self = [super init];
    if (self) {
        username = @"";
        session_key = @"";
        user_id = -1;
    }
    return self;
}

+(NSString*)processSlashes:(NSString*)src{
    NSString *res = nil;
    @try {
        res = [src stringByReplacingOccurrencesOfString:@"<!slash!>" withString:@"/"];
        res = [res stringByReplacingOccurrencesOfString:@"<!backslash!>" withString:@"\\"];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
    return res;
}

+(UIView*)loadViewFromXib: (NSString*)xibName ownew:(id)owner viewClass:(Class)viewClass
{
    UIView* view;
    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:xibName owner:owner options:nil];
    for (id currentObject in topLevelObjects){
        if ([currentObject isKindOfClass:viewClass]){
            view =  currentObject;
            break;
        }
    }
    return view;
}

+(NSString*)getFilterName:(int)filter{
    switch (filter) {
        case 0: return @"nearby";
        case 1: return @"toprated";
        case 2: return @"mostviewed";
        case 3: return @"newplaces";
        case 4: return @"recentlyreviewed";
        case 5: return @"categories";
        case 6: return @"search";
        default: return @"";
    }
    return @"";
}

+ (UIColor *) colorWithHexString: (NSString *) hexString {
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 1];
            green = [self colorComponentFrom: colorString start: 1 length: 1];
            blue  = [self colorComponentFrom: colorString start: 2 length: 1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom: colorString start: 0 length: 1];
            red   = [self colorComponentFrom: colorString start: 1 length: 1];
            green = [self colorComponentFrom: colorString start: 2 length: 1];
            blue  = [self colorComponentFrom: colorString start: 3 length: 1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 2];
            green = [self colorComponentFrom: colorString start: 2 length: 2];
            blue  = [self colorComponentFrom: colorString start: 4 length: 2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom: colorString start: 0 length: 2];
            red   = [self colorComponentFrom: colorString start: 2 length: 2];
            green = [self colorComponentFrom: colorString start: 4 length: 2];
            blue  = [self colorComponentFrom: colorString start: 6 length: 2];
            break;
        default:
            [NSException raise:@"Invalid color value" format: @"Color value %@ is invalid.  It should be a hex value of the form #RBG, #ARGB, #RRGGBB, or #AARRGGBB", hexString];
            break;
    }
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
}

+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}

+(AFHTTPRequestOperationManager*)shareClient{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    return manager;
}

+ (void)dismissLocalHUDInView:(UIView*)view
{
    [view setUserInteractionEnabled:YES];
    [MBProgressHUD hideHUDForView:view animated:YES];
}

+ (void)showLocalProgressHudInView:(UIView*) view WithTitle:(NSString *)title // change text if exist
{
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
//    hud.labelText = (title) ? title: @"";
//    return;
    
    [view setUserInteractionEnabled:NO];
    
    MBProgressHUD* currentHud = [MBProgressHUD HUDForView:view];
    if (currentHud != nil)
    {
        //[currentHud setLabelText:title];
        currentHud.labelText  = (title) ? title: @"";
    }
    else
    {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
        hud.labelText  = (title) ? title: @"";
    }
}
+(void)showMessageInView:(UIView*)view withTitle:(NSString*)title withMessage:(NSString*)message{
    OLGhostAlertView *alertView = [[OLGhostAlertView alloc] initWithTitle:title message:message timeout:5 dismissible:true];
    
    alertView.position = OLGhostAlertViewPositionBottom;
    alertView.bottomContentMargin = 20;
    alertView.style = OLGhostAlertViewStyleDark;
    [alertView showInView:view];
}


@end
