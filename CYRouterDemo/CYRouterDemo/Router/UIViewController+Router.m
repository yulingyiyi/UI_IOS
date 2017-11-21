//
//  UIViewController+Router.m
//  CYRouterDemo
//
//  Created by apple on 2017/11/21.
//  Copyright © 2017年 cy. All rights reserved.
//

#import "UIViewController+Router.h"
#import <objc/runtime.h>
#import "Router.h"
static char URLOriginUrl;
static char URLPath;
static char URLParams;
static char dataCallBack;


@implementation UIViewController (Router)

- (void)dealloc{
   self.callBlock = nil;
}
- (void)initData{
    
}

+ (UIViewController *)initWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters callBlock:(void (^)(NSDictionary *))callBlock{
    NSString *en = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    return [UIViewController initWithUrl:[NSURL URLWithString:en] parameters:parameters callBlock:callBlock];
}

+ (UIViewController *)initWithUrl:(NSURL *)url parameters:(NSDictionary *)parameters callBlock:(void (^)(NSDictionary *))callBlock{
    UIViewController *viewController = nil;
    NSString *home = nil;
    
    if (url.path == nil) {
        home = [NSString stringWithFormat:@"%@://%@", url.scheme, url.host];
    }else{
        home = [NSString stringWithFormat:@"%@://%@%@", url.scheme,url.host,url.path];
    }
    NSDictionary *config = [Router sharedRouter].config;
    if ([config.allKeys containsObject:url.scheme]) {
        id conf = [config objectForKey:url.scheme];
        Class class = nil;
        if ([conf isKindOfClass:[NSString class]]) {
            class = NSClassFromString(conf);
        }else if ([conf isKindOfClass:[NSDictionary class]]){
            NSDictionary *dict = (NSDictionary *)conf;
            if ([dict.allKeys containsObject:home]) {
                class = NSClassFromString([dict objectForKey:home]);
                if (class == nil) { // 兼容swift,字符串转类名的时候前面加上命名空间
                    NSString *spaceName = [NSBundle mainBundle].infoDictionary[@"CFBundleExecutable"];
                    class =  NSClassFromString([NSString stringWithFormat:@"%@.%@",spaceName,[dict objectForKey:home]]);
                }
            }
        }
        
        if (class != nil && [class validationParameters:parameters]) {
            viewController = [[class alloc] init];
            viewController.params = parameters;
            viewController.callBlock = callBlock;
        }
        if ([url.scheme isEqualToString:@"http"] || [url.scheme isEqualToString:@"https"]) {
//            class = NSClassFromString([config objectForKey:url.scheme]);
            viewController.params = @{@"url": [url absoluteString]};
        }
        if (viewController && [viewController respondsToSelector:@selector(initData)]) {
            [viewController initData];
        }
    }
    return viewController;
}

+ (BOOL)validationParameters:(NSDictionary *)parameters{
    return YES;
}
#pragma mark -- get set
- (void)setOriginUrl:(NSURL *)originUrl{
    objc_setAssociatedObject(self, &URLOriginUrl, originUrl, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSURL *)originUrl{
    return objc_getAssociatedObject(self, &URLOriginUrl);
}

- (NSString *)path{
    return objc_getAssociatedObject(self, &URLPath);
}
- (void)setPath:(NSString *)path{
    objc_setAssociatedObject(self, &path, path, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSDictionary *)params{
    return objc_getAssociatedObject(self, &URLParams);
    
}
- (void)setParams:(NSDictionary *)params{
    objc_setAssociatedObject(self, &URLParams, self, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void (^)(NSDictionary *))callBlock{
    return objc_getAssociatedObject(self, &dataCallBack);
}
- (void)setCallBlock:(void (^)(NSDictionary *))callBlock{
    objc_setAssociatedObject(self, &dataCallBack, callBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark --









































@end
