//
//  Dog.h
//  RealmDemo
//
//  Created by apple on 2018/1/16.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Realm/Realm.h>

@interface Dog : RLMObject
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger age;

@end
