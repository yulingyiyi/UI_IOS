//
//  UIViewController+CY.m
//  CYNavigationController
//
//  Created by apple on 2017/11/16.
//  Copyright © 2017年 cy. All rights reserved.
//

#import "UIViewController+navigationBar.h"
#import <objc/runtime.h>

@implementation UIViewController (navigationBar)
//static char bacButtonImageKey;

@dynamic navigationBar;
@dynamic navigationBarHidden;
@dynamic title;
@dynamic leftBarHidden;
@dynamic navigationBarBackgroundColor;
@dynamic barBottomLineBackgroundColor;
- (CYNavigationBar *)navigationBar{
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setNavigationBar:(CYNavigationBar *)navigationBar{
    objc_setAssociatedObject(self, @selector(navigationBar), navigationBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)isNavigationBar{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}
- (void)setNavigationBarHidden:(BOOL)navigationBarHidden{
    objc_setAssociatedObject(self, @selector(isNavigationBar), @(navigationBarHidden), OBJC_ASSOCIATION_ASSIGN);
}
- (void)addSubView:(UIView *)view{
    if (self.navigationBar && [self.self.view.subviews containsObject:self.navigationBar]) {
        [self.view insertSubview:view belowSubview:self.navigationBar];
    }else{
        [self.view addSubview:view];
    }
}
- (void)setLeftBarHidden:(BOOL)leftBarHidden{
    if (leftBarHidden) {
        self.navigationBar.leftBtn.hidden = YES;
        CGRect rect = self.navigationBar.backBtn.frame;
        
        self.navigationBar.backBtn.frame = CGRectMake(20, rect.origin.y, 75, rect.size.height);
        [self.navigationBar.backBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [self.navigationBar.backBtn setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
 
    }else{
        self.navigationBar.leftBtn.hidden = NO;
        CGRect rect = self.navigationBar.backBtn.frame;
        
        self.navigationBar.backBtn.frame = CGRectMake(0, rect.origin.y, 52, rect.size.height);
        [self.navigationBar.backBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
        [self.navigationBar.backBtn setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    }
    objc_setAssociatedObject(self, @selector(leftBarHidden), @(leftBarHidden), OBJC_ASSOCIATION_ASSIGN);
    
}
- (BOOL)leftBarHidden{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}
-(NSString *)title{
    return objc_getAssociatedObject(self, _cmd);
}
-(void)setTitle:(NSString *)title{
    objc_setAssociatedObject(self, @selector(title), title, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.navigationBar.topItem.title = title;
}
-(UIColor *)navigationBarBackgroundColor{
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setNavigationBarBackgroundColor:(UIColor *)navigationBarBackgroundColor{
    objc_setAssociatedObject(self,@selector(navigationBarBackgroundColor), navigationBarBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.navigationBar.backgroundColor = navigationBarBackgroundColor;
}
- (UIColor *)barBottomLineBackgroundColor{
    return objc_getAssociatedObject(self, _cmd);
}
- (void)setBarBottomLineBackgroundColor:(UIColor *)barBottomLineBackgroundColor{
    objc_setAssociatedObject(self, @selector(barBottomLineBackgroundColor), barBottomLineBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end
