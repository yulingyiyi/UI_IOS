//
//  ViewController.m
//  UIActivityIndicatorViewDemo
//
//  Created by apple on 2017/11/21.
//  Copyright © 2017年 cy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/**
 UIActivityIndicatorView
 */
@property (nonatomic, strong) UIActivityIndicatorView * activityIndicatorView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.activityIndicatorView];
    [self.activityIndicatorView startAnimating];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)click:(UIButton *)sender {
    if (self.activityIndicatorView.animating) {
        [self.activityIndicatorView stopAnimating];
    }else{
        [self.activityIndicatorView startAnimating];
    }
}
#pragma mark -- lazy
- (UIActivityIndicatorView *)activityIndicatorView{
    if (_activityIndicatorView == nil) {
        _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _activityIndicatorView.frame = CGRectMake(0, 0, 100, 100);
        _activityIndicatorView.center = self.view.center;
        _activityIndicatorView.hidesWhenStopped = YES;
    }
    return _activityIndicatorView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
