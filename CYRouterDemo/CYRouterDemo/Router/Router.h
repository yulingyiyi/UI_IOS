//
//  Router.h
//  CYRouterDemo
//
//  Created by apple on 2017/11/21.
//  Copyright © 2017年 cy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Singletion.h"
NS_ASSUME_NONNULL_BEGIN
@interface Router : NSObject

SingletionH(Router)
/** 存储读取的plist文件数据 */
@property(nonatomic,strong) NSDictionary *config;

+ (void )loadConfig;

/** *******************获取当前控制器 ************************/
+ (UIViewController *)currentViewControler;



#pragma mark --------  拿到导航控制器 和当前控制器 --------

/** 返回当前控制器 */
- (UIViewController*)currentViewController;

/** 返回当前控制器的导航控制器 */
- (UINavigationController*)currentNavigationViewController;

#pragma mark --------  push控制器 --------
/**
 *  push控制器 同系统的
 *
 *  @param viewController 目标控制器
 */
+ (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

/**
 *  push控制器 类似系统的
 *
 *  @param viewController 目标控制器
 *  @param replace        如果当前控制器和要push的控制器是同一个,可以将replace设置为Yes,进行替换.同一个才能替换哦!
 */
+ (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated replace:(BOOL)replace;

/**
 *  push控制器
 *
 *  @param urlString 自定义的URL,可以拼接参数
 */
+ (void)pushURLString:(NSString *)urlString animated:(BOOL)animated;

/**
 *  push控制器
 *
 *  @param urlString 自定义URL,也可以拼接参数,但会被下面的parameters替换掉
 *  @param parameters     存放参数
 */
+ (void)pushURLString:(NSString *)urlString parameters:(NSDictionary *)parameters animated:(BOOL)animated;

/**
 *  push控制器
 *
 *  @param urlString 自定义的URL,可以拼接参数
 *  @param replace   如果当前控制器和要push的控制器是同一个,可以将replace设置为Yes,进行替换.同一个才能替换哦!
 */
+ (void)pushURLString:(NSString *)urlString  animated:(BOOL)animated replace:(BOOL)replace;

/**
 *  push控制器
 *
 *  @param urlString 自定义URL,也可以拼接参数,但会被下面的parameters替换掉
 *  @param parameters     存放参数
 *  @param replace   如果当前控制器和要push的控制器是同一个,可以将replace设置为Yes,进行替换.同一个才能替换哦!
 */
+ (void)pushURLString:(NSString *)urlString parameters:( NSDictionary *)parameters animated:(BOOL)animated replace:(BOOL)replace;
/**
 *  push控制器
 *
 *  @param urlString 自定义URL,也可以拼接参数,但会被下面的parameters替换掉
 *  @param parameters     存放参数
 *  @param replace   如果当前控制器和要push的控制器是同一个,可以将replace设置为Yes,进行替换.同一个才能替换哦!
 *  @param callBlock  返回的数据
 */
+ (void)pushURLString:(NSString *)urlString parameters:(NSDictionary *)parameters animated:(BOOL)animated replace:(BOOL)replace callBlock:(void(^ __nullable)(NSDictionary *callData))callBlock;


#pragma mark --------  pop控制器 --------

/** pop掉一层控制器 */
+ (void)popViewControllerAnimated:(BOOL)animated;
/** pop掉两层控制器 */
+ (void)popTwiceViewControllerAnimated:(BOOL)animated;
/** pop掉times层控制器 */
+ (void)popViewControllerWithTimes:(NSUInteger)times animated:(BOOL)animated;
/** pop到根层控制器 */
+ (void)popToRootViewControllerAnimated:(BOOL)animated;

#pragma mark --------  modal控制器 --------

/**
 *  modal控制器
 *
 *  @param viewControllerToPresent 目标控制器
 */
+ (void)presentViewController:(UIViewController *)viewControllerToPresent
                     animated: (BOOL)animated
                   completion:(void (^ __nullable)(void))completion;

/**
 *  modal控制器
 *
 *  @param urlString 自定义的URL,可以拼接参数
 */
+ (void)presentURLString:(NSString *)urlString
                animated:(BOOL)animated
              completion:(void (^ __nullable)(void))completion;

/**
 *  modal控制器
 *
 *  @param urlString 自定义的URL,可以拼接参数
 */
+ (void)presentURLString:(NSString *)urlString
                animated:(BOOL)animated
               callBlock:(void(^ __nullable)(NSDictionary *callData))callBlock
              completion:(void (^ __nullable)(void))completion;


/**
 *  modal控制器
 *
 *  @param urlString 自定义URL,也可以拼接参数,但会被下面的parameters替换掉
 *  @param parameters     存放参数
 */
+ (void)presentURLString:(NSString *)urlString
              parameters:(NSDictionary *)parameters
                animated:(BOOL)animated
               callBlock:(void(^ __nullable)(NSDictionary *callData))callBlock
              completion:(void (^ __nullable)(void))completion;

/**
 *  modal控制器,并且给modal出来的控制器添加一个导航控制器
 *
 *  @param urlString 自定义的URL,可以拼接参数
 *  @param classType 需要添加的导航控制器 eg.[UINavigationController class]
 */
+ (void)presentURLString:(NSString *)urlString
                animated:(BOOL)animated
     withNavigationClass:(Class)classType
               callBlock:(void(^ __nullable)(NSDictionary *callData))callBlock
              completion:(void (^ __nullable)(void))completion;

/**
 *  modal控制器,并且给modal出来的控制器添加一个导航控制器
 *
 *  @param urlString 自定义URL,也可以拼接参数,但会被下面的parameters替换掉
 *  @param parameters     存放参数
 *  @param clazz     需要添加的导航控制器 eg.[UINavigationController class]
 */
+ (void)presentURLString:(NSString *)urlString
              parameters:(NSDictionary *)parameters
                animated:(BOOL)animated
     withNavigationClass:(Class)clazz
               callBlock:(void(^ __nullable)(NSDictionary *callData))callBlock
              completion:(void (^ __nullable)(void))completion;

#pragma mark --------  dismiss控制器 --------
/** dismiss掉1层控制器 */
+ (void)dismissViewControllerAnimated: (BOOL)animated completion: (void (^ __nullable)(void))completion;
/** dismiss掉2层控制器 */
+ (void)dismissTwiceViewControllerAnimated: (BOOL)animated completion: (void (^ __nullable)(void))completion;
/** dismiss掉times层控制器 */
+ (void)dismissViewControllerWithTimes:(NSUInteger)times animated: (BOOL)flag completion: (void (^ __nullable)(void))completion;
/** dismiss到根层控制器 */
+ (void)dismissToRootViewControllerAnimated: (BOOL)animated completion: (void (^ __nullable)(void))completion;

NS_ASSUME_NONNULL_END
@end

