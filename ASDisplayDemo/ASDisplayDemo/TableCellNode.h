//
//  TableCellNode.h
//  ASDisplayDemo
//
//  Created by apple on 2018/1/15.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ASCellNode.h"
#import <AsyncDisplayKit.h>
@interface TableCellNode : ASCellNode

/**
 title
 */
@property (nonatomic, strong) ASTextNode * titleNode;
/**
 desc
 */
@property (nonatomic, strong) ASTextNode * descNode;

@property (nonatomic, strong) ASButtonNode * rightBtn;
@end
