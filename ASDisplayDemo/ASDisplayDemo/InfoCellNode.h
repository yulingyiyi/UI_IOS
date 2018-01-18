//
//  InfoCellNode.h
//  ASDisplayDemo
//
//  Created by apple on 2018/1/18.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface InfoCellNode : ASDisplayNode

/**
 title
 */
@property (nonatomic, strong) ASTextNode * titleNode;
/**
 desc
 */
@property (nonatomic, strong) ASTextNode * descNode;

@end
