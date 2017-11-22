//
//  UIViewController+CY.h
//  CYNavigationController
//
//  Created by apple on 2017/11/16.
//  Copyright © 2017年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYNavigationBar.h"
@interface UIViewController (navigationBar)

@property(nonatomic, strong) CYNavigationBar *navigationBar;
@property(nonatomic, assign,getter=isNavigationBar) BOOL navigationBarHidden;
@property(nonatomic, assign)BOOL leftBarHidden;
@property(nonatomic, copy) NSString *title;
@property(nonatomic, strong) UIColor *barBottomLineBackgroundColor;
@property(nonatomic, strong) UIColor *navigationBarBackgroundColor;


@end
