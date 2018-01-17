//
//  IndexViewController.m
//  ASDisplayDemo
//
//  Created by apple on 2018/1/17.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "IndexViewController.h"
#import "ViewController.h"
#import "CollectionViewViewController.h"
@interface IndexViewController ()

@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)tableClick:(UIButton *)sender {
    [self.navigationController pushViewController:[ViewController new] animated:YES];
}
- (IBAction)collectClick:(UIButton *)sender {
    [self.navigationController pushViewController:[CollectionViewViewController new] animated:YES];
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
