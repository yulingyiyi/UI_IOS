//
//  Router.m
//  CYRouterDemo
//
//  Created by apple on 2017/11/21.
//  Copyright © 2017年 cy. All rights reserved.
//

#import "Router.h"
#import "RouterNavgation.h"
#import "UIViewController+Router.h"
#define RouterPath @"Router.plist"

@implementation Router

SingletionM(Router)

+ (void )loadConfig{
    NSString *path = [[NSBundle mainBundle] pathForResource:RouterPath ofType:nil];
    NSDictionary *configDict = [NSDictionary dictionaryWithContentsOfFile:path];
    if (configDict) {
        [Router sharedRouter].config = configDict;
    }else{
        NSLog(@"请按照说明添加对应的plist文件");
    }
    return ;
}
#pragma mark -- push
+ (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [RouterNavgation pushViewController:viewController animated:animated replace:NO];
}
+ (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated replace:(BOOL)replace{
    [RouterNavgation pushViewController:viewController animated:animated replace:replace];
}

+ (void)pushURLString:(NSString *)urlString animated:(BOOL)animated{
    [Router pushURLString:urlString parameters:@{} animated:animated replace:NO callBlock:nil];
}
+ (void)pushURLString:(NSString *)urlString animated:(BOOL)animated replace:(BOOL)replace{
    [Router pushURLString:urlString parameters:@{} animated:animated replace:replace callBlock:nil];
}
+ (void)pushURLString:(NSString *)urlString parameters:(NSDictionary *)parameters animated:(BOOL)animated replace:(BOOL)replace{
    [Router pushURLString:urlString parameters:parameters animated:animated replace:replace callBlock:nil];
}
+ (void)pushURLString:(NSString *)urlString parameters:(NSDictionary *)parameters animated:(BOOL)animated{
    [Router pushURLString:urlString parameters:parameters animated:animated replace:NO callBlock:nil];
}
+ (void)pushURLString:(NSString *)urlString parameters:(NSDictionary *)parameters animated:(BOOL)animated replace:(BOOL)replace callBlock:(void (^)(NSDictionary * _Nonnull))callBlock{
    UIViewController *viewController = [UIViewController initWithUrlString:urlString parameters:parameters callBlock:callBlock];
    
    [RouterNavgation pushViewController:viewController animated:animated replace:NO];
}
 #pragma mark -- model


+ (void)presentViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)flag completion:(void (^ __nullable)(void))completion {
    [RouterNavgation presentViewController:viewControllerToPresent animated:flag completion:completion];
}
+ (void)presentURLString:(NSString *)urlString animated:(BOOL)animated completion:(void (^ __nullable)(void))completion{
    UIViewController *viewController = [UIViewController initWithUrlString:urlString parameters:@{} callBlock:nil];
    [RouterNavgation presentViewController:viewController animated:animated completion:completion];
}


+ (void)presentURLString:(NSString *)urlString parameters:(NSDictionary *)parameters animated:(BOOL)animated callBlock:(void (^ _Nullable)(NSDictionary * _Nonnull))callBlock completion:(void (^ _Nullable)(void))completion{
    UIViewController *viewController = [UIViewController initWithUrlString:urlString parameters:parameters callBlock:callBlock];
    [RouterNavgation presentViewController:viewController animated:animated completion:completion];
}

+ (void)presentURLString:(NSString *)urlString animated:(BOOL)animated withNavigationClass:(Class)classType completion:(void (^ __nullable)(void))completion{

    UIViewController *viewController = [UIViewController initWithUrlString:urlString parameters:@{} callBlock:nil];
    if ([classType isSubclassOfClass:[UINavigationController class]]) {
        UINavigationController *nav =  [[classType alloc]initWithRootViewController:viewController];
        [RouterNavgation presentViewController:nav animated:animated completion:completion];
    }
}

+ (void)presentURLString:(NSString *)urlString animated:(BOOL)animated withNavigationClass:(nonnull Class)classType callBlock:(void (^ _Nullable)(NSDictionary * _Nonnull))callBlock completion:(void (^ _Nullable)(void))completion{
    UIViewController *viewController = [UIViewController initWithUrlString:urlString parameters:@{} callBlock:callBlock];
    if ([classType isSubclassOfClass:[UINavigationController class]]) {
        UINavigationController *nav =  [[classType alloc]initWithRootViewController:viewController];
        [RouterNavgation presentViewController:nav animated:animated completion:completion];
    }
}
+ (void)presentURLString:(NSString *)urlString parameters:(NSDictionary *)parameters animated:(BOOL)animated withNavigationClass:(Class)clazz callBlock:(void (^)(NSDictionary * _Nonnull))callBlock completion:(void (^)(void))completion{
    UIViewController *viewController = [UIViewController initWithUrlString:urlString parameters:parameters callBlock:callBlock];
    if ([clazz isSubclassOfClass:[UINavigationController class]]) {
        UINavigationController *nav =  [[clazz alloc]initWithRootViewController:viewController];
        [RouterNavgation presentViewController:nav animated:animated completion:completion];
    }
}


+ (void)popViewControllerAnimated:(BOOL)animated {
    [RouterNavgation popViewControllerWithTimes:1 animated:animated];
}
+ (void)popViewControllerWithTimes:(NSUInteger)times animated:(BOOL)animated {
    [RouterNavgation popViewControllerWithTimes:times animated:animated];
}
+ (void)popToRootViewControllerAnimated:(BOOL)animated {
    [RouterNavgation popToRootViewControllerAnimated:animated];
}


+ (void)dismissViewControllerAnimated: (BOOL)animated completion: (void (^ __nullable)(void))completion {
    [RouterNavgation dismissViewControllerWithTimes:1 animated:animated completion:completion];
}

+ (void)dismissViewControllerWithTimes:(NSUInteger)times animated: (BOOL)animated completion: (void (^ __nullable)(void))completion {
    [RouterNavgation dismissViewControllerWithTimes:times animated:animated completion:completion];
}

+ (void)dismissToRootViewControllerAnimated: (BOOL)animated completion: (void (^ __nullable)(void))completion {
    [RouterNavgation dismissToRootViewControllerAnimated:animated completion:completion];
}


#pragma mark --
+ (UIViewController *)currentViewControler{
    return [[RouterNavgation sharedRouterNavgation] currentViewController];
}
+ (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
     return [[RouterNavgation sharedRouterNavgation] currentNavigationViewController];
}

@end
