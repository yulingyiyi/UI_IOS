//
//  CYTextTFCGFloat.m
//  Demo
//
//  Created by apple on 2017/10/13.
//  Copyright © 2017年 cy. All rights reserved.
//

#import "CYTextTFCGFloat.h"

@interface CYTextTFCGFloat()
/**
 
 */
@property (nonatomic, strong) NSMutableString  * atring;
@end


@implementation CYTextTFCGFloat


-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.max = 999999;
        self.isAllowedEmpty = YES;
        self.lengthFloat = 2;
        if (self.isAllowedEmpty) {
            self.text = @"";
        }else{
            self.text = @"0";
        }
        self.keyboardType = UIKeyboardTypeDecimalPad;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChangeNotification:) name:UITextFieldTextDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidEndEditingNotification:) name:UITextFieldTextDidEndEditingNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidBeginEditingNotification:) name:UITextFieldTextDidChangeNotification object:nil];
    }
    return self;
}

- (void)textDidEndEditingNotification:(NSNotification *)notifition{
    if (self.text.length == 0) {
        if (self.isAllowedEmpty) {
            self.text = @"";
        }else{
            self.text = @"0";
        }
    }
}
-(void)textDidChangeNotification:(NSNotification *)notifition{
    
    if (self.text.length > 0) {
        if (self.text.floatValue > self.max) {
            self.text = [self.text substringWithRange:NSMakeRange(0, self.text.length - 1)];
        }else if (self.text.length == 2) {
            NSString *left = [self.text substringWithRange:NSMakeRange(0, 1)];
             NSString *right = [self.text substringWithRange:NSMakeRange(1, 1)];
            if ([left isEqualToString:@"0"]) {
                if (![right isEqualToString:@"."]) {
                    self.text = [self.text substringWithRange:NSMakeRange(1, 1)];
                }
            }
        }else if (self.text.length == 1) {
            if ([self.text isEqualToString:@"."]) {
                self.text = @"";
            }
        }
        if ([self.text containsString:@"."]) {
            NSArray *arr = [self.text componentsSeparatedByString:@"."];
            NSInteger loc =  [self.text rangeOfString:@"."].location;
            if (arr.count > 2 && self.text.length - 1 > loc) {
                self.text =  [self.text stringByReplacingOccurrencesOfString:@"." withString:@""];
                _atring = [[NSMutableString alloc] initWithString:self.text];
                 [_atring insertString:@"." atIndex:loc];
                self.text = _atring;
                if (self.text.length  - loc  - 1 > self.lengthFloat) {
                    self.text = [self.text substringToIndex:loc];
                }else{
                }
            }else{
                NSInteger loc =  [self.text rangeOfString:@"."].location;
                if (self.text.length  - loc  - 1 > self.lengthFloat) {
                    self.text = [self.text substringToIndex:loc + self.lengthFloat + 1];
                }
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
