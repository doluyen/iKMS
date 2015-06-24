//
//  OSConst.h
//  AllGoEasy
//
//  Created by Luyen Do Van on 5/5/15.
//  Copyright (c) 2015 Luyen Do Van. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"


#define C_COLOR_HEADER_TITLE_4A4A4A [UIColor colorWithRed:(float)74/255 green:(float)74/255 blue:(float)74/255 alpha:1]//4A4A4A
#define C_COLOR_GRAY_878787 [UIColor colorWithRed:(float)135/255 green:(float)135/255 blue:(float)135/255 alpha:1]//878787
#define C_COLOR_WHITE_FFFFFF [UIColor colorWithRed:(float)255/255 green:(float)255/255 blue:(float)255/255 alpha:1]//FFFFFF
#define C_COLOR_BLUE_30B4B3 [UIColor colorWithRed:(float)48/255 green:(float)180/255 blue:(float)179/255 alpha:1]//30B4B3


#define C_COLOR_CATEGORY1 [UIColor colorWithRed:(float)190/255 green:(float)57/255 blue:(float)82/255 alpha:1]
#define C_COLOR_CATEGORY2 [UIColor colorWithRed:(float)214/255 green:(float)77/255 blue:(float)102/255 alpha:1]

#define C_COLOR_NEARBY1 [UIColor colorWithRed:(float)218/255 green:(float)177/255 blue:(float)26/255 alpha:1]
#define C_COLOR_NEARBY2 [UIColor colorWithRed:(float)237/255 green:(float)199/255 blue:(float)62/255 alpha:1]


static NSString * const home_bg_top_rate=@"#4e3954";
static NSString * const home_bg_top_rate_select= @"#904e3954";
static NSString * const home_bg_categories= @"#c03f57";
static NSString * const home_bg_categories_select= @"#90c03f57";
static NSString * const home_bg_nearby= @"#30b4b3";
static NSString * const home_bg_nearby_select= @"#9030b4b3";
static NSString * const home_bg_recently_added= @"#edc73e";
static NSString * const home_bg_recently_added_select= @"#90edc73e";

static NSString * const cell_places_bg_categories1= @"#BE3952";
static NSString * const cell_places_bg_categories1_select= @"#90BE3952";
static NSString * const cell_places_bg_categories2= @"#D64D66";
static NSString * const cell_places_bg_categories2_select= @"#90D64D66";
static NSString * const cell_places_bg_nearby1= @"#DAB11A";
static NSString * const cell_places_bg_nearby1_select= @"#70DAB11A";
static NSString * const cell_places_bg_nearby2= @"#EDC73E";
static NSString * const cell_places_bg_nearby2_select= @"#70EDC73E";

static NSString * const category_bg_icon= @"#797979";
static NSString * const category_bg_icon_select= @"#90797979";

static NSString * const color_button_place_detail_selected= @"#30b4b3";
static NSString * const color_button_place_detail= @"#4A4A4A";

static NSString * const color_button_blue_selected= @"#90007AFF";
static NSString * const color_button_blue= @"#007AFF";

static NSString * const color_button_black_selected= @"#90797971";
static NSString * const color_button_black= @"#878787";

static NSString * const color_header_bg= @"#f6f5f3";
static NSString * const color_header_title= @"#4A4A4A";

static NSString * const color_more_fragment_text= @"#4A4A4A";
static NSString * const color_more_fragment_bg_logo= @"#D8D8D8";

static NSString * const color_bg_edit_text= @"#F3F3F3";
static NSString * const color_gray_text_view= @"#878787";
static NSString * const color_line= @"#604A4A4A";

#define  FONT_REGULAR   @"Lato Regular"
#define  FONT_LIGHT   @"Lato Light"
#define  FONT_BOLD   @"Lato Bold"

static NSString * const C_URL_SERVER = @"http://api.kvernhirden.com";
static NSString * const C_URL_SERVER_IP = @"http://api.kvernhirden.com/";

static NSString * const   kPathUserLogin  =@"Token";
static NSString * const   kPathGetAllAccount =@"api/Register/GetAccountAll";

static NSString * const   kPathGetContactAll  =@"api/Register/GetContactAll";
static NSString * const   kPathGetAccountChildrenAll  =@"api/Register/GetAccountChildrenAll";
static NSString * const   kPathGetGroupAll  =@"api/Register/GetGroupAll";
static NSString * const   kPathGetPaymentTermAll  =@"api/Register/GetPaymentTermAll";
static NSString * const   kPathCreditContact  =@"api/Register/CreditContact";
static NSString * const   kPathCreditProperty  =@"api/Register/CreditProperty";
static NSString * const   kPathCreditSection  =@"api/Register/CreditSection";

static NSString * const   kPathGetPropertyAll  =@"api/Register/GetPropertyAll";
static NSString * const   kPathGetSectionAll  =@"api/Register/GetSectionAll";


static NSString * const   kPathGetAccessibility  =@"getaccessibility_new.php";
static NSString * const   kPathGetPlaces   =@"getplaces.php";
static NSString * const   kPathGetPlaceInfo  =@"getplaceinfo.php";
static NSString * const   kPathGetPlaceFromDB  =@"getplacefromdb.php";
static NSString * const   kPathViewed =@"viewed.php";
static NSString * const   kPathGetReviews  =@"getreviews.php";

static NSString * const   kPathGetReviewUser  =@"getreviews_user.php";
static NSString * const   kPathWriteReviewForPlace  =@"writereview.php";
static NSString * const   kPathRequestReviewForPlace  =@"requestreview.php";

static NSString * const   kPathGetRequests  =@"getrequests.php";
static NSString * const   kPathReportAbuse  =@"reportabuse.php";
static NSString * const   kPathGetDealInfo  =@"getdealinfo.php";
static NSString * const   kPathGetDeals  =@"getdeals.php";
static NSString * const   kPathGetFeatureDeals  =@"getfeatured_selection.php";
static NSString * const   kPathGetFeaturePlace  =@"getfeatured_selection.php";
static NSString * const   kPathGetDescriptionsItems  =@"getaccessibilitydescription_items.php";
static NSString * const   kPathgetDescriptions =@"getaccessibilitydescription.php";


typedef enum {
    kTypeRequestNormal,
    kTypeRequestRefresh,
    kTypeRequestLoadmore,
    kTypeRequestNone
}kTypeRequest;

typedef void (^CVCompleteBlock)(BOOL isSucess);


@interface OSConst : NSObject

@property(nonatomic,assign)NSInteger user_id;
@property(nonatomic,strong)NSString *session_key;
@property(nonatomic,strong)NSString *username;

+(OSConst*)loadConsts;

+(NSString*)processSlashes:(NSString*)src;
+(UIView*)loadViewFromXib: (NSString*)xibName ownew:(id)owner viewClass:(Class)viewClass;
+(NSString*)getFilterName:(int)filter;

+ (UIColor *) colorWithHexString: (NSString *) hexString;
+(AFHTTPRequestOperationManager*)shareClient;

+ (void)dismissLocalHUDInView:(UIView*)view;
+ (void)showLocalProgressHudInView:(UIView*) view WithTitle:(NSString *)title;
+(void)showMessageInView:(UIView*)view withTitle:(NSString*)title withMessage:(NSString*)message;


@end
