//
//  CommonHeader.h
//  AutoScroll
//
//  Created by hxl on 16/9/2.
//  Copyright © 2016年 hxl. All rights reserved.
//

#ifndef CommonHeader_h
#define CommonHeader_h

//
//  EFSDefines.h
//  EFSMobile
//
//  Created by BaHCy on 16/6/12.
//  Copyright © 2016年 Elephants Financial Service. All rights reserved.
//

//APP使用的的通用MACRO
#define NavigationAndStatusHeight 64.f // 导航栏高度
#define kLoginNavHeadViewHeight (self.view.bounds.size.width * 454 / 750) // 登录页面自定义Nav高度
#define kDefaultPreloadConfigKey @"kDefaultPreloadConfigKey"

#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kCOLOR(ColorName)           [UIColor ColorName]
#define kRGBCOLOR(r,g,b)            [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define kRGBACOLOR(r,g,b,a)         [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define kIMAGE(ImageName)           [UIImage imageNamed:ImageName]
#define kFONT(FontSize)             [UIFont systemFontOfSize:FontSize]
#define kBOLDFONT(FontSize)         [UIFont boldSystemFontOfSize:FontSize]
#define kSEL(SELName)               @selector(SELName)
#define kPoint(x,y)                 CGPointMake(x,y)
#define kFrame(x,y,width,height)    CGRectMake(x, y, width, height)
#define kSize(width,height)         CGSizeMake(width,height)
#define kBOUNDS                     self.view.bounds

#define EFS_ERROR_MESSAGE_KEY  @"message" /**<错误信息 在NSError userInfo 中的 key*/

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


#define objectOrNull(obj) ((obj) ? (obj) : [NSNull null])
#define objectOrEmptyStr(obj) ((obj != nil) ? (obj) : @"")

#define KEYWINDOW          [[UIApplication sharedApplication] keyWindow]
#define NOTIFICATION_CENTER [NSNotificationCenter defaultCenter]

#define RADIANS_TO_DEGREES(x) ((x)/M_PI*180.0)
#define DEGREES_TO_RADIANS(x) ((x)/180.0*M_PI)

#define fequal(a,b) (fabs((a) - (b)) < DBL_EPSILON)
#define fequalzero(a) (fabs(a) < FLT_EPSILON)
#define flessthan(a,b) (fabs(a) < fabs(b)+FLT_EPSILON)

// 转成字符串
#define STRINGIFY(S) #S
// 需要解两次才解开的宏
#define DEFER_STRINGIFY(S) STRINGIFY(S)
#define PRAGMA_MESSAGE(MSG) _Pragma(STRINGIFY(message(MSG)))
// 为warning增加更多信息
#define FORMATTED_MESSAGE(MSG) "[TODO-" DEFER_STRINGIFY(__COUNTER__) "] " MSG " \n line " DEFER_STRINGIFY(__LINE__)
// 使宏前面可以加@
#define KEYWORDIFY try {} @catch (...) {}
// 最终使用的宏
#define TODO(MSG) KEYWORDIFY PRAGMA_MESSAGE(FORMATTED_MESSAGE(MSG))


/** 配置信息域名 */
#define GLOBALSETTING @"globalSetting"
#define CONFIGURL @"efs_config_url"

#endif /* CommonHeader_h */
