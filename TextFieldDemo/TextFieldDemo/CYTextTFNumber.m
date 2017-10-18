//
//  CYTF.m
//  Demo
//
//  Created by apple on 2017/10/12.
//  Copyright © 2017年 cy. All rights reserved.
//

#import "CYTextTFNumber.h"

@implementation CYTextTFNumber

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.max = 9999999;
        self.isAllowedEmpty = YES;
        if (self.isAllowedEmpty) {
            self.text = @"";
        }else{
            self.text = self.isPositive ? @"1" : @"0";
        }
        self.keyboardType = UIKeyboardTypeNumberPad;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChangeNotification:) name:UITextFieldTextDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidEndEditingNotification:) name:UITextFieldTextDidEndEditingNotification object:nil];
         [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidBeginEditingNotification:) name:UITextFieldTextDidChangeNotification object:nil];
    }
    return self;
}
- (void)setIsPositive:(BOOL)isPositive{
    _isPositive = isPositive;
     self.text = self.isPositive ? @"1" : @"0";
}
- (void)textDidEndEditingNotification:(NSNotification *)notifition{
    if (self.text.length == 0) {
        if (self.isAllowedEmpty) {
            self.text = @"";
        }else{
            self.text = self.isPositive ? @"1" : @"0";
        }
        
    }
}
-(void)textDidChangeNotification:(NSNotification *)notifition{
    if (self.text.length > 0) {
        if (self.text.integerValue > self.max) {
            self.text = [self.text substringWithRange:NSMakeRange(0, self.text.length - 1)];
        }else if (self.text.length == 2) {
            NSString *left = [self.text substringWithRange:NSMakeRange(0, 1)];
            if ([left isEqualToString:@"0"]) {
                self.text = [self.text substringWithRange:NSMakeRange(1, 1)];
            }
        }
    }
}
-(void)textDidBeginEditingNotification:(NSNotification *)notifition{
   
}
- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
- (void)drawTextInRect:(CGRect)rect{
    [super drawTextInRect:rect];
}

@end
