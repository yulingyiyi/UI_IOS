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
<<<<<<< HEAD

@property(nonatomic, strong) UINavigationItem *navigationItem;
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, copy) NSString *title;



@property(nonatomic, strong) UIButton *backBtn;
@property(nonatomic, strong) UIButton *leftBtn;
@property(nonatomic, strong) UIButton *rightBtn;
@property(nonatomic, strong) UIView   *lineView;


@property(nonatomic, strong) UIView *titleView;
=======
+ (CYNavigationBar *)defaultNavigitionBar;

@property (strong) UINavigationItem *navigationItem;
>>>>>>> 99c0ed6090c38baca4af9c9a9ade2a64f0b9b307

@end
