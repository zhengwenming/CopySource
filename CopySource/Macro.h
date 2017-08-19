
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
#define kTopScrollerViewHight 44
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kDeviceVersion [[UIDevice currentDevice].systemVersion floatValue]
#define kNavbarHeight ((kDeviceVersion>=7.0)? 64 :44 )
#define kIOS7DELTA   ((kDeviceVersion>=7.0)? 20 :0 )
#define kTabBarHeight 49
// navigation fontSize
#define kPolicyDetailHeaderViewHeight 77.f
#define kReimbursedByThirdPartyButtonTag 500
#define kIphone5TextFont 13.f


#define TheUserDefaults [NSUserDefaults standardUserDefaults]
/// NSUserDefaults 存储的投保人信息
#define kApplicantPerson        [UserInfo sharedInfo].customerId
/// NSUserDefaults 存储的被保人信息
#define kInsuredPerson          @"insuredPerson"
/// NSUserDefaults 存储的产品信息字典
#define kProductDic          @"kProductDic"
/// NSUserDefaults 存储的推送消息数组
#define kMessageDataDic          @"kMessageDataDic"

/// 本地缓存图片的文件夹
#define kCacheUploadFiles         @"uploadFiles"


/// 产品详情URL
#define kProductDetailURL           @"http://www.aijkang.com/app/index.html"
/// 产品详情分享URL
#define kShareProductDetailURL           @"http://www.aijkang.com/wechat/index.html"


/// 邀请/分享URL
#define kInviteAcceptURL            @"http://www.aijkang.com/app/invite.html"
//#define kInviteAcceptURL            @"http://10.0.2.82/app/inviteTest.html"

/// 健康告知URL
#define kHealthInfoURL              @"http://www.aijkang.com/app/health.html"

/// 投保须知
#define kInsuranceInformationURL    @"http://www.aijkang.com/app/needTo.html"

///保险条款
#define kInsuranceClauseURL    @"http://www.aijkang.com/app/clause.html"

///理赔须知
#define kClaimsURL  @"http://www.aijkang.com/app/claims.html"







/// api-version
#define kApiVersion             @"api-version"
/// token 会话时效
#define k_Http_SessionToken     @"AISessionToken"
/// 腾讯云appid
#define kTXYAppId               @"10076082"
/// TXYUploadManager 实例对应的持久化 id，此 id 必须全局唯一，persistenceId 为 nil 时，上传任务不持久化
#define kPersistenceId          @"AIHealthPersistenceId"
/// 腾讯云   目录所属 bucket 名称
#define kBucket                 @"tongxuebao"
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)

#define kSCREEN_MAX_LENGTH (MAX(kScreenWidth, kScreenHeight))
#define kSCREEN_MIN_LENGTH (MIN(kScreenWidth, kScreenHeight))

#define IS_IPHONE4 (IS_IPHONE && kSCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE5 (IS_IPHONE && kSCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE6 (IS_IPHONE && kSCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE6P (IS_IPHONE && kSCREEN_MAX_LENGTH == 736.0)



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
