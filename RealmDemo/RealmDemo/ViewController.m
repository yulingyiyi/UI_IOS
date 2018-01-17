//
//  ViewController.m
//  RealmDemo
//
//  Created by apple on 2018/1/16.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Dog.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSFileManager defaultManager]removeItemAtURL:[RLMRealmConfiguration defaultConfiguration].fileURL error:nil];
    
    

    // Do any additional setup after loading the view, typically from a nib.
}
- (void)simple{
    Dog *mydog = [[Dog alloc] init];
    
    mydog.name = @"Rxex";
    mydog.age = 9;
    NSLog(@"name of mydog : %@", mydog.name);
    
    RLMRealm *reaml = [RLMRealm defaultRealm];
    
    NSLog(@"url : %@",reaml.configuration.fileURL);
    
    ///insert
    [reaml beginWriteTransaction];
    [reaml addObject:mydog];
    [reaml commitWriteTransaction];
    
    ///query
    RLMResults *results = [Dog objectsInRealm:reaml where:@"name contains 'x'"];
    
    RLMResults *results2 = [results objectsWhere:@"age > 2"];
    
    Dog *dog = results2.firstObject;
    
    NSLog(@"Number od dogs: %li",(unsigned long)results2.count);
    NSLog(@"name of dogs: %@",dog.name);
    
    
    Person *person = [[Person alloc] init];
    person.name = @"Tim";
    [person.dogs addObject:mydog];
    
//    [reaml transactionWithBlock:^{
//
//    }];
    
    [reaml beginWriteTransaction];
    [reaml addObject:person];
    [reaml commitWriteTransaction];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        @autoreleasepool {
            RLMRealm *otherRealm  = [RLMRealm defaultRealm];
            RLMResults *otherResults = [Dog objectsInRealm:otherRealm where:@"name contains 'Rxe'"];
            Dog *otherdog = otherResults.firstObject;
            NSLog(@"name of otherdog: %@",otherdog.name);
        }
        
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
