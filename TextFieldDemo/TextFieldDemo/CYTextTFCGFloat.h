//
//  CYTextTFCGFloat.h
//  Demo
//
//  Created by apple on 2017/10/13.
//  Copyright © 2017年 cy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYTextTFCGFloat : UITextField

/**
 限制最大限制
 */
@property (nonatomic, assign) NSInteger max;

/**
 是否是允为空
 */
@property (nonatomic, assign) BOOL isAllowedEmpty;
/**
 小树长度
 */
@property (nonatomic, assign) NSInteger lengthFloat;
@end
