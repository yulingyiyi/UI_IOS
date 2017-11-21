//
//  ViewController.m
//  CYRouterDemo
//
//  Created by apple on 2017/11/21.
//  Copyright © 2017年 cy. All rights reserved.
//

#import "ViewController.h"
#import "Router.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)click:(UIButton *)sender {
    [Router pushURLString:@"home://index" parameters:@{} animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
