//
//  CYNavigationBar.h
//  CYNavigationController
//
//  Created by apple on 2017/11/16.
//  Copyright © 2017年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>
#define KScreen_W [UIScreen mainScreen].bounds.size.width
#define KScreen_H [UIScreen mainScreen].bounds.size.height
#define NavBarHeight ((KScreen_H >= 812) ? 88 : 64)

@interface CYNavigationBar : UINavigationBar
+ (CYNavigationBar *)defaultNavigitionBar;

@property (strong) UINavigationItem *navigationItem;

@end
