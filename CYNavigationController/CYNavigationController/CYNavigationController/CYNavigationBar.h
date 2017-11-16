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

@interface CYNavigationBar : UIView

//@property (nonatomic, strong) CACradein/e

@property(nonatomic,strong) UILabel *titleLabel;
@property(nonatomic, copy) NSString *title;



@property(nonatomic, strong) UIButton *backBtn;
@property(nonatomic, strong) UIButton *leftBtn;
@property(nonatomic, strong) UIButton *rightBtn;
@property(nonatomic, strong) UIView   *lineView;


@property(nonatomic, strong) UIView *titleView;

@end
