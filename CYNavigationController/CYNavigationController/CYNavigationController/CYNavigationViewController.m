//
//  CYNavigationViewController.m
//  CYNavigationController
//
//  Created by apple on 2017/11/16.
//  Copyright © 2017年 cy. All rights reserved.
//

#import "CYNavigationViewController.h"
#import "CYViewController.h"
@interface CYNavigationViewController ()

@end

@implementation CYNavigationViewController

- (void)loadView{
    [super loadView];
    [self creatBarView];
    [self popGesture];
    
    
    
}
- (void)creatBarView{
    
    self.navigationBarHidden = YES;
//    self.barView = [CYNavigationBar defaultNavigitionBar];
//    [self.topViewController.view addSubview:self.barView];
//    self.barView.navigationItem.title = self.topViewController.title;
}
- (void)popGesture{
    
    self.interactivePopGestureRecognizer.enabled = NO;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] init];
    pan.delegate = self;
    
    pan.maximumNumberOfTouches = 1;
    [self.view addGestureRecognizer:pan];
    NSMutableArray * _targets = [self.interactivePopGestureRecognizer valueForKey:@"_targets"];
    id _tra = [[_targets firstObject] valueForKey:@"_target"];
    
    SEL popAction = NSSelectorFromString(@"handleNavigationTransition:");
    [pan addTarget:_tra action:popAction];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    CYNavigationBar *bar = [[CYNavigationBar alloc] initWithFrame:CGRectMake(0, 0, KScreen_W, NavBarHeight)];
    [viewController.view addSubview:bar];
//    [bar.backBtn addTarget:self action:@selector(popViewControllerAnimated:) forControlEvents:UIControlEventTouchUpInside];
    
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        bar.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStyleDone target:self action:@selector(popViewControllerAnimated:)];;
    }
    viewController.navigationBar.navigationItem.title = viewController.title;
    viewController.navigationBar = bar;
    [super pushViewController:viewController animated:animated];
}
-(UIViewController *)popViewControllerAnimated:(BOOL)animated{
    return [super popViewControllerAnimated:YES];
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return self.viewControllers.count != 1 && ![[self valueForKey:@"_isTransitioning"] boolValue];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
