//
//  RouterNavgation.h
//  CYRouterDemo
//
//  Created by apple on 2017/11/21.
//  Copyright © 2017年 cy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Singletion.h"

NS_ASSUME_NONNULL_BEGIN
@interface RouterNavgation : NSObject
SingletionH(RouterNavgation)
- (id<UIApplicationDelegate>)applicationDelegate;
/**
 返回当前控制期
 */
- (UIViewController *)currentViewController;

/**
 返回当前的导航控制期
 */
- (UINavigationController *)currentNavigationViewController;


#pragma mark --

+ (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated
                   replace:(BOOL)replace;
+ (void)presentViewController:(UIViewController *)viewController
                     animated:(BOOL)animated
                   completion:(void(^ __nullable)(void))completion;

+ (void)popViewControllerAnimated:(BOOL)animated;
+ (void)popToViewController:(UIViewController *)viewController animated:(BOOL)animated;
+ (void)popViewControllerWithTimes:(NSUInteger)times animated:(BOOL)animated;
+ (void)popToRootViewControllerAnimated:(BOOL)animated;


+ (void)dismissViewControllerAnimated:(BOOL)animated
                           completion:(void(^ __nullable)(void))completion;
+ (void)dismissViewControllerWithTimes:(NSUInteger)times
                              animated: (BOOL)flag
                            completion: (void (^ __nullable)(void))completion;
+ (void)dismissToRootViewControllerAnimated: (BOOL)flag
                                 completion: (void (^ __nullable)(void))completion;

@end
NS_ASSUME_NONNULL_END
