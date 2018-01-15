//
//  ViewController1.m
//  CYNavigationController
//
//  Created by yuling on 2017/11/16.
//  Copyright © 2017年 cy. All rights reserved.
//

#import "ViewController1.h"
#import "UIViewController+navigationBar.h"
@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBarBackgroundColor = [UIColor blueColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = CGRectMake(10, 100, 50, 50);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(dddd) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor redColor];
    self.title = @"firstVC";
    self.navigationItem
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)dddd{
    self.navigationBarBackgroundColor = [UIColor colorWithRed:round(255) / 255.0 green:round(255) / 255.0 blue:round(255) / 255.0 alpha:1];
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
