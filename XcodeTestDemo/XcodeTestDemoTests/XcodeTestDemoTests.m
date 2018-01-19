//
//  XcodeTestDemoTests.m
//  XcodeTestDemoTests
//
//  Created by apple on 2018/1/19.
//  Copyright © 2018年 apple. All rights reserved.
//
/**
   参考 https://www.jianshu.com/p/009844a0b9ed
 **/

#import <XCTest/XCTest.h>
#import "ViewController.h"


@interface XcodeTestDemoTests : XCTestCase
@property (nonatomic,strong) ViewController *vc;

@end

@implementation XcodeTestDemoTests

- (void)setUp {
    [super setUp];
    // 实例化需要测试的类
    self.vc = [[ViewController alloc] init];

    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    _vc = nil;
    [super tearDown];
}

- (void)testExample {
    
    // 调用需要测试的方法，
    int result = [self.vc getNum];
    // 如果不相等则会提示@“测试不通过”
    XCTAssertEqual(result, 100,@"测试不通过");
    
    
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        for (int i = 0; i<100; i++) {
            
            NSLog(@"dd");
        }
        // Put the code you want to measure the time of here.
    }];
}

@end
