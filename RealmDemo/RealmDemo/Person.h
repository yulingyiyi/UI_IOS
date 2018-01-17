//
//  Person.h
//  RealmDemo
//
//  Created by apple on 2018/1/16.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Realm/Realm.h>
#import "Dog.h"
RLM_ARRAY_TYPE(Dog)
@interface Person : RLMObject
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) RLMArray<Dog *><Dog> * dogs;

@end
