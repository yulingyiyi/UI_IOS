//
//  ViewController.m
//  TextFieldDemo
//
//  Created by apple on 2017/10/18.
//  Copyright © 2017年 cy. All rights reserved.
//

#import "ViewController.h"
#import "CYTextTFNumber.h"
#import "CYTextTFCGFloat.h"
@interface ViewController ()
/**
 tf
 */
@property (nonatomic, strong) CYTextTFNumber * tf;
@property (nonatomic, strong) CYTextTFCGFloat * tf1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.tf = [[CYTextTFNumber alloc] initWithFrame:CGRectMake(10, 100, 200, 30)];
    self.tf.backgroundColor = [UIColor whiteColor];
    self.tf.isAllowedEmpty = YES;
    [self.view addSubview:self.tf];
    
    self.tf1 = [[CYTextTFCGFloat alloc] initWithFrame:CGRectMake(10, 200, 200, 30)];
    self.tf1.backgroundColor = [UIColor whiteColor];
    self.tf1.isAllowedEmpty = NO;
    [self.view addSubview:self.tf1];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
