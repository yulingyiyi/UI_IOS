//
//  RACCommandViewController.m
//  RACDemo
//
//  Created by yuling on 2018/5/3.
//  Copyright © 2018年 yuling. All rights reserved.
//

#import "RACCommandViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface RACCommandViewController ()

@end

@implementation RACCommandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self test1];
//    [self test2];
//        [self test3];
    [self test4];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)test1{
    
    RACCommand *command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        NSLog(@"%@",input);
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            [subscriber sendNext:@"执行命令产生的数据"];
            return nil;
        }];
    }];
    RACSignal *signal = [command execute:@2];
    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
}
- (void)test2{
    RACCommand *command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        NSLog(@"%@",input);
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
             [subscriber sendNext:@"执行命令产生的数据"];
            return nil;
        }];
    }];
    
    [command.executionSignals subscribeNext:^(id  _Nullable x) {
         NSLog(@"%@",x);
        [x subscribeNext:^(id  _Nullable x) {
            NSLog(@"%@",x);
        }];
    }];
    [command execute:@2];
    
}
- (void)test3{
    RACCommand *command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        NSLog(@"%@",input);
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            [subscriber sendNext:@"执行命令产生的数据"];
            return nil;
        }];
    }];
    
    [command.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    [command execute:@2];
}


// switchToLatest
- (void)test4 {
    // 创建信号中信号
    RACSubject *signalofsignals = [RACSubject subject];
    RACSubject *signalA = [RACSubject subject];
    // 订阅信号
    //    [signalofsignals subscribeNext:^(RACSignal *x) {
    //        [x subscribeNext:^(id x) {
    //            NSLog(@"%@", x);
    //        }];
    //    }];
    // switchToLatest: 获取信号中信号发送的最新信号
    [signalofsignals.switchToLatest subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
    // 发送信号
    [signalofsignals sendNext:signalA];
    [signalA sendNext:@4];
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
