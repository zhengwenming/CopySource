
//
//  Macro.h
//  TongXueBao
//
//  Created by 郑文明 on 16/9/22.
//  Copyright © 2016年 郑文明. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

///颜色相关
//主题色
//#define kThemeColor ([UIColor colorWithRed:97.0/255.0 green:194.0/255.0 blue:67.0/255.0 alpha:1.0])

#define kThemeColor ([UIColor colorWithRed:252.0/255.0 green:252.0/255.0 blue:252.0/255.0 alpha:1.0])

//#define kTintColor ([UIColor colorWithRed:67.0/255.0 green:194.0/255.0 blue:71.0/255.0 alpha:1.0])
#define kTintColor [UIColor redColor]





///适配相关
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width

#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

#define kDeviceVersion [[UIDevice currentDevice].systemVersion floatValue]

#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height

#define kSystemNavHeight 44.0

#define kNavbarHeight (kStatusBarHeight+kSystemNavHeight)

#define kTabBarHeight (iPhoneX?(49.f+34.f):(49.f))

#define kBottomSafeHeight ((IS_IPHONEX)?(34):(0))

#define TheUserDefaults [NSUserDefaults standardUserDefaults]


#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define kSCREEN_MAX_LENGTH (MAX(kScreenWidth, kScreenHeight))
#define kSCREEN_MIN_LENGTH (MIN(kScreenWidth, kScreenHeight))

#define IS_IPHONE4 (IS_IPHONE && kSCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE5 (IS_IPHONE && kSCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE6 (IS_IPHONE && kSCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE6P (IS_IPHONE && kSCREEN_MAX_LENGTH == 736.0)
#define iPhoneX (kScreenWidth == 375.0f) && (kScreenHeight == 812.0f) && IS_IPHONE

#define kBottomSafeHeight ((iPhoneX)?(34):(0))


#define kSafeString(__X__)        [__X__ isKindOfClass:[NSNull class]] ? @"" : [NSString stringWithFormat:@"%@", (__X__)]





/** 弱引用 */
#define WEAKSELF __weak typeof(self) weakSelf = self

#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self;

/** 避免self的提前释放 */
#define STRONGSELF __weak typeof(weakSelf) strongSelf = weakSelf
/** 设置图片 */
#define kGetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]
/** 修改Log,debug：WMLog，执行NSLog，release，自动忽略 */
#ifdef DEBUG
#define WMLog(...) NSLog(__VA_ARGS__)
#else
#define WMLog(...)
#endif

#endif /* Macro_h */
