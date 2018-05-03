//
//  ViewController.m
//  RACDemo
//
//  Created by yuling on 2018/5/3.
//  Copyright © 2018年 yuling. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "RACCommandViewController.h"
#import "RACMapViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self reg];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)reg{
    
    [[self.textField rac_signalForControlEvents:UIControlEventEditingChanged] subscribeNext:^(__kindof UIControl * _Nullable x) {
        
    }];
    @weakify(self);
    [[self.btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"alert" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        [self presentViewController:alert animated:YES completion:nil];
        
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    [[tap rac_gestureSignal] subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
        NSLog(@"tap");
       
        
    }];
    [self.view addGestureRecognizer:tap];
    
    
    
    
}
- (IBAction)command:(UIButton *)sender {
    
    RACCommandViewController *viewc = [[RACCommandViewController alloc] init];
    
    [self.navigationController pushViewController:viewc animated:YES];
}
- (IBAction)map:(id)sender {
    
    RACMapViewController *viewc = [[RACMapViewController alloc] init];
    
    [self.navigationController pushViewController:viewc animated:YES];
}
#pragma mark 定时器
- (void)scheduler{
    [[RACSignal interval:1 onScheduler:[RACScheduler mainThreadScheduler]] subscribeNext:^(NSDate * _Nullable x) {
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
