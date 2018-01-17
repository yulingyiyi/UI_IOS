//
//  CollectiontionCellNode.h
//  ASDisplayDemo
//
//  Created by apple on 2018/1/17.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface CollectiontionCellNode : ASCellNode
/**
 title
 */
@property (nonatomic, strong) ASTextNode * titleNode;
/**
 icon
 */
@property (nonatomic, strong) ASImageNode *iconNode;
@end
