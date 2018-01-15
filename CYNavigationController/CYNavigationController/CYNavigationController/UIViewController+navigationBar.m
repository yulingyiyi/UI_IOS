//
//  UIViewController+CY.m
//  CYNavigationController
//
//  Created by apple on 2017/11/16.
//  Copyright © 2017年 cy. All rights reserved.
//

#import "UIViewController+navigationBar.h"
#import <objc/runtime.h>

static char navigationBar;
//static char title;
@implementation UIViewController (navigationBar)
//static char bacButtonImageKey;

//@dynamic navigationBar;
#pragma mark -- getter setter
- (CYNavigationBar *)navigationBar{
    CYNavigationBar *nav = objc_getAssociatedObject(self, &navigationBar);
    if (!nav) {
        return [CYNavigationBar defaultNavigitionBar];
    }
    return nav;
}
- (void)setNavigationBar:(CYNavigationBar *)navigationBar{
    objc_setAssociatedObject(self, &navigationBar, navigationBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(UINavigationItem *)navigationItem{
        return self.navigationBar.navigationItem;
}
//- (void)setTitle:(NSString *)title{
//    objc_setAssociatedObject(self, &title, title, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//- (NSString *)title{
//   return  objc_getAssociatedObject(self, &title);
//}

-(void)addSubView:(UIView *)view{
    if ([self.view.subviews containsObject:self.navigationBar]) {
        [self.view insertSubview:view belowSubview:self.navigationBar];
    }else{
        [self.view addSubview:view];
    }
}



#pragma mark -- view



@end
