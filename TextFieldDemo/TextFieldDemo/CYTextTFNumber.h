//
//  CYTF.h
//  Demo
//
//  Created by apple on 2017/10/12.
//  Copyright © 2017年 cy. All rights reserved.
//   正/整数 输入


#import <UIKit/UIKit.h>

@interface CYTextTFNumber : UITextField

/**
 限制最大限制
 */
@property (nonatomic, assign) NSInteger max;
/**
 是否是正整数
 */
@property (nonatomic, assign) BOOL isPositive;
/**
 是否是允为空
 */
@property (nonatomic, assign) BOOL isAllowedEmpty;
@end
