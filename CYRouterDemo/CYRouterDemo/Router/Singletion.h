//
//  Singletion.h
//  CYRouterDemo
//
//  Created by apple on 2017/11/21.
//  Copyright © 2017年 cy. All rights reserved.
//
// .h文件
#define SingletionH(name) + (instancetype)shared##name;

// .m文件
#define SingletionM(name) \
static id instance_ = nil;\
+ (instancetype)shared##name{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
instance_ = [[self alloc] init];\
});\
return instance_;\
}\
+ (instancetype)allocWithZone:(struct _NSZone *)zone{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
instance_ = [super allocWithZone:zone];\
});\
return instance_;\
}\
- (id)copyWithZone:(NSZone *)zone{\
return instance_;\
}
