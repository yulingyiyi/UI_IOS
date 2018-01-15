//
//  BaseTabBarViewController.m
//  BaseNavigationDemo
//
//  Created by apple on 2017/11/25.
//  Copyright © 2017年 cy. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "IndexViewController.h"
#import <RTRootNavigationController.h>
@interface BaseTabBarViewController ()

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    IndexViewController *vc0 = [[IndexViewController alloc] init];
    vc0.title = @"vc0";
    UINavigationController *nav0 = [[UINavigationController alloc] initWithRootViewController:vc0];
    nav0.tabBarItem.title = @"vc0";
    
    IndexViewController *vc1 = [[IndexViewController alloc] init];
    vc1.title = @"vc1";
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    nav1.tabBarItem.title = @"vc1";
    IndexViewController *vc2 = [[IndexViewController alloc] init];
    vc2.title = @"vc2";
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    nav2.tabBarItem.title = @"vc2";
    self.viewControllers = @[nav0,nav1,nav2];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
