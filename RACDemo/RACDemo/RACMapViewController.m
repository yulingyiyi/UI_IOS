
//
//  RACMapViewController.m
//  RACDemo
//
//  Created by yuling on 2018/5/3.
//  Copyright © 2018年 yuling. All rights reserved.
//

#import "RACMapViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>
@interface RACMapViewController ()

@end

@implementation RACMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self map];
    [self flatMap];
    // Do any additional setup after loading the view.
}
- (void)map{
    RACSubject *subject = [RACSubject subject];
    
    RACSignal *bindSignal = [subject map:^id _Nullable(id  _Nullable value) {
        return [NSString stringWithFormat:@"ws:%@",value];
    }];
    [bindSignal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    [subject sendNext:@"123"];
}
- (void)flatMap {
    
    // 创建信号
//    RACSubject *subject = [RACSubject subject];
//    // 绑定信号
//    RACSignal *bindSignal = [subject flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
//        return [RACReplaySubject return:value];
//    }];
//    // flattenMap中返回的是什么信号，订阅的就是什么信号(那么，x的值等于value的值，如果我们操纵value的值那么x也会随之而变)
//    // 订阅信号
//    [bindSignal subscribeNext:^(id x) {
//        NSLog(@"%@", x);
//    }];
//
//    // 发送数据
//    [subject sendNext:@"123"];
    
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
