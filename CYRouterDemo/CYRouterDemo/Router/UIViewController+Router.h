//
//  UIViewController+Router.h
//  CYRouterDemo
//
//  Created by apple on 2017/11/21.
//  Copyright © 2017年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Router)

/**
 跳转后控制器能拿到的url
 */
@property (nonatomic, strong) NSURL * originUrl;
/**
 url路径
 */
@property (nonatomic, strong) NSString * path;
/**
 参数
 */
@property (nonatomic, strong) NSDictionary * params;

/**
 block 回掉
 */
@property (nonatomic, copy) void(^callBlock)(NSDictionary *callData);

+ (UIViewController *)initWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters callBlock:(void(^)(NSDictionary *callData))callBlock;

+ (BOOL)validationParameters:(NSDictionary *)parameters;

/**
 初始化参数
 */
- (void)initData;


@end
