//
//  CYNavigationBar.m
//  CYNavigationController
//
//  Created by apple on 2017/11/16.
//  Copyright © 2017年 cy. All rights reserved.
//

#import "CYNavigationBar.h"
#import <QuartzCore/QuartzCore.h>
@implementation CYNavigationBar
@synthesize navigationItem = _navigationItem;
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, KScreen_W, NavBarHeight)];
    if (self) {
        self.items = @[self.navigationItem];
    }
    return self;
}
+ (CYNavigationBar *)defaultNavigitionBar{
    
    CYNavigationBar *bar = [[CYNavigationBar alloc] initWithFrame:CGRectMake(0, 0, KScreen_W, NavBarHeight)];
    bar.navigationItem = [[UINavigationItem alloc] initWithTitle:@"XXXx"];
    
    bar.items = @[bar.navigationItem];
    return bar;
}
//lazy
-(void)layoutSubviews{
    [super layoutSubviews];
    // 这里为了适配iOS11，需要遍历所有的子控件，并向下移动状态栏的高度
    CGFloat systemVersion = [UIDevice currentDevice].systemVersion.floatValue;
    
    if (systemVersion >= 11.0) {
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:NSClassFromString(@"_UIBarBackground")]) {
                CGRect frame = obj.frame;
                frame.size.height = self.frame.size.height;
                obj.frame = frame;
            }else {
                
                //                CGRect statusBarFrame = [UIApplication sharedApplication].statusBarFrame;
                //                CGRect statusBarFrame = NavBarHeight - 44;
                CGRect frame   = obj.frame;
                //                frame.origin.y += statusBarFrame.size.height;
                frame.origin.y = NavBarHeight - 44;
                obj.frame      = frame;
            }
        }];
    }
}
- (UINavigationItem *)navigationItem{
    if (_navigationItem == nil) {
        _navigationItem = [[UINavigationItem alloc] initWithTitle:@"XXXx"];
    }
    return _navigationItem;
}

- (void)setNavigationItem:(UINavigationItem *)navigationItem{
    if (_navigationItem != navigationItem) {
        _navigationItem = navigationItem;
    }
}

@end
