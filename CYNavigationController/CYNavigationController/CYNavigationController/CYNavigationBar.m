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
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(0, 0, KScreen_W, NavBarHeight)];
    if (self) {
        
        [self addSubview:self.backBtn];
        [self addSubview:self.lineView];
        self.backgroundColor = [UIColor redColor];
        
    }
    return self;
}
//lazy

-(UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, NavBarHeight - 0.5, KScreen_W, 0.5)];
        _lineView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    }
    return _lineView;
}
- (UIButton *)backBtn{
    if (_backBtn == nil) {
        _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _backBtn.frame = CGRectMake(0, NavBarHeight - 44, 50, 44);
        [_backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    }
    return _backBtn;
}

@end
