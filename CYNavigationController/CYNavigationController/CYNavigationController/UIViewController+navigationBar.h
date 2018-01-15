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

- (void)addSubView:(UIView *)view;
/**
 title
 */
//@property (nonatomic, strong) NSString * title;

@end
