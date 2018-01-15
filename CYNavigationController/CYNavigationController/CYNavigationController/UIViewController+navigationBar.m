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
<<<<<<< HEAD
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
 
=======
//- (void)setTitle:(NSString *)title{
//    objc_setAssociatedObject(self, &title, title, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//- (NSString *)title{
//   return  objc_getAssociatedObject(self, &title);
//}

-(void)addSubView:(UIView *)view{
    if ([self.view.subviews containsObject:self.navigationBar]) {
        [self.view insertSubview:view belowSubview:self.navigationBar];
>>>>>>> 99c0ed6090c38baca4af9c9a9ade2a64f0b9b307
    }else{
        [self.view addSubview:view];
    }
<<<<<<< HEAD
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
=======
>>>>>>> 99c0ed6090c38baca4af9c9a9ade2a64f0b9b307
}



#pragma mark -- view



@end
