//
//  SecViewController.m
//  BaseNavigationDemo
//
//  Created by apple on 2017/11/25.
//  Copyright © 2017年 cy. All rights reserved.
//

#import "SecViewController.h"
#import <UINavigationController+FDFullscreenPopGesture.h>
@interface SecViewController ()

@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"sec";
    self.view.backgroundColor = [UIColor whiteColor];
    self.fd_prefersNavigationBarHidden = YES;
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    
    
    [Router pushURLString:@"home://tre" animated:YES];
    //    IndexViewController *index = [[IndexViewController alloc] init];
    //    [self.tabBarController.navigationController pushViewController:index animated:YES];
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
