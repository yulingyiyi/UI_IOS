//
//  RouterNavgation.m
//  CYRouterDemo
//
//  Created by apple on 2017/11/21.
//  Copyright © 2017年 cy. All rights reserved.
//

#import "RouterNavgation.h"
//ifdef DEBUG
//#   define NSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
//#else
//#   define NSLog(...)
//#endif

@implementation RouterNavgation

SingletionM(RouterNavgation)

#pragma mark --
- (id<UIApplicationDelegate>)applicationDelegate{
   return  [UIApplication sharedApplication].delegate;
}
- (UIViewController *)currentViewController{
    UIViewController* rootViewController = self.applicationDelegate.window.rootViewController;
    return [self currentViewControllerFrom:rootViewController];
}
- (UINavigationController*)currentNavigationViewController {
    UIViewController* currentViewController = self.currentViewController;
    return currentViewController.navigationController;
}

// 通过递归拿到当前控制器
- (UIViewController*)currentViewControllerFrom:(UIViewController*)viewController {
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController *)viewController;
        return [self currentViewControllerFrom:navigationController.viewControllers.lastObject];
    } // 如果传入的控制器是导航控制器,则返回最后一个
    else if([viewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController *)viewController;
        return [self currentViewControllerFrom:tabBarController.selectedViewController];
    } // 如果传入的控制器是tabBar控制器,则返回选中的那个
    else if(viewController.presentedViewController != nil) {
        return [self currentViewControllerFrom:viewController.presentedViewController];
    } // 如果传入的控制器发生了modal,则就可以拿到modal的那个控制器
    else {
        return viewController;
    }
}
#pragma mark --
///设置为更是图
+ (void)setRootViewController:(UIViewController *)viewController{
    [[RouterNavgation sharedRouterNavgation] applicationDelegate].window.rootViewController = viewController;
}

+ (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (!viewController) {
        NSLog(@"请添加与url相匹配的控制器到plist文件中,或者协议头可能写错了!");
    }else{
        if ([viewController isKindOfClass:[UINavigationController class]]) {
            [RouterNavgation setRootViewController:viewController];
        }else{
            UINavigationController *currNav = [[RouterNavgation sharedRouterNavgation] currentNavigationViewController];
            if (currNav) { // 导航控制器存在
                 [currNav pushViewController:viewController animated:animated];
            }else{
                currNav = [[UINavigationController alloc] initWithRootViewController:viewController];
                [RouterNavgation setRootViewController:currNav];
            }
        }
    }
    
}
+ (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated replace:(BOOL)replace{
    if (!viewController) {
        NSLog(@"请添加与url相匹配的控制器到plist文件中,或者协议头可能写错了!");
    }
    if (replace) {
       
            if([viewController isKindOfClass:[UINavigationController class]]) {
                [RouterNavgation setRootViewController:viewController];
            } // 如果是导航控制器直接设置为根控制器
            else {
                UINavigationController *navigationController = [RouterNavgation sharedRouterNavgation].currentNavigationViewController;
                if (navigationController) { // 导航控制器存在
                    // In case it should replace, look for the last UIViewController on the UINavigationController, if it's of the same class, replace it with a new one.
                    if (replace && [navigationController.viewControllers.lastObject isKindOfClass:[viewController class]]) {
                        
                        NSArray *viewControllers = [navigationController.viewControllers subarrayWithRange:NSMakeRange(0, navigationController.viewControllers.count-1)];
                        [navigationController setViewControllers:[viewControllers arrayByAddingObject:viewController] animated:animated];
                    } // 切换当前导航控制器 需要把原来的子控制器都取出来重新添加
                    else {
                        [navigationController pushViewController:viewController animated:animated];
                    } // 进行push
                }
                else {
                    navigationController = [[UINavigationController alloc]initWithRootViewController:viewController];
                    [RouterNavgation sharedRouterNavgation].applicationDelegate.window.rootViewController = navigationController;
                } // 如果导航控制器不存在,就会创建一个新的,设置为根控制器
            }
        
    }else{
        [RouterNavgation pushViewController:viewController animated:YES];
    }
    
}

+ (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^)(void))completion{
    
    if (!viewController) {
        NSLog(@"请添加与url相匹配的控制器到plist文件中,或者协议头可能写错了!");
    }else{
        UIViewController *curr = [[RouterNavgation sharedRouterNavgation] currentViewController];
        
        if (curr) {
            [curr presentViewController:viewController animated:YES completion:completion];
        }else{
            [RouterNavgation setRootViewController:viewController];
        }
    }
}
+ (void)popViewControllerAnimated:(BOOL)animated{
    [RouterNavgation popViewControllerWithTimes:2 animated:animated];
}
+ (void)popViewControllerWithTimes:(NSUInteger)times animated:(BOOL)animated{
    UIViewController *currViewController = [[RouterNavgation sharedRouterNavgation] currentViewController];
    if (currViewController) {
        NSInteger count = currViewController.navigationController.viewControllers.count;
        if (count > times) {
            [currViewController.navigationController popToViewController:currViewController.navigationController.viewControllers[count - 1 - times] animated:animated];
        }else{
            NSLog(@"确定可以pop掉那么多控制器?");
        }
        
    }
}
//presentedViewController：The view controller that is presented by this view controlller(read-only)，被本视图控制器present出来的的视图控制器（只读）
//presentingViewController：The view controller that presented this view controller. (read-only)，present出来本视图控制器的视图控制器（只读）
//parentViewController：The parent view controller of the recipient(容器). (read-only)
//有ViewControllerA和ViewControllerB，在A里使用presentViewController:animated:completion: 方法present视图控制器B
+ (void)popToRootViewControllerAnimated:(BOOL)animated{
    UIViewController *currentViewController = [[RouterNavgation sharedRouterNavgation] currentViewController];
    NSUInteger count = currentViewController.navigationController.viewControllers.count;
    [RouterNavgation popViewControllerWithTimes:count-1 animated:YES];
}
+ (void)dismissViewControllerWithTimes:(NSUInteger)times animated: (BOOL)flag completion: (void (^ __nullable)(void))completion {
    UIViewController *rootVC = [[RouterNavgation sharedRouterNavgation] currentViewController];
    
    if (rootVC) {
        while (times > 0) {
            rootVC = rootVC.presentingViewController;
            times -= 1;
        }
        [rootVC dismissViewControllerAnimated:YES completion:completion];
    }
    
    if (!rootVC.presentedViewController) {
        NSLog(@"确定能dismiss掉这么多控制器?");
    }
}
+ (void)dismissToRootViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion{
    UIViewController *currViewController = [[RouterNavgation sharedRouterNavgation] currentViewController];
    UIViewController *rooter = currViewController;
    while (rooter.presentingViewController) {
        rooter = rooter.presentingViewController;
    }
    [rooter dismissViewControllerAnimated:YES completion:completion];
}






























@end
