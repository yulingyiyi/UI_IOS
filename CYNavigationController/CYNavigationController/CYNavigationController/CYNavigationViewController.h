//
//  CYNavigationViewController.h
//  CYNavigationController
//
//  Created by apple on 2017/11/16.
//  Copyright © 2017年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CYNavigationBar.h"
#import "UIViewController+navigationBar.h"
@interface CYNavigationViewController : UINavigationController<UIGestureRecognizerDelegate>

@property(nonatomic, strong) CYNavigationBar *barView;
@end
