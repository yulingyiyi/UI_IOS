//
//  TableCellNode.h
//  ASDisplayDemo
//
//  Created by apple on 2018/1/15.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "InfoCellNode.h"

@interface TableCellNode : ASCellNode<ASTableDelegate, ASTableDataSource>
{
    NSArray<InfoCellNode *> *_infoCellNodes;
}

/**
 title
 */
@property (nonatomic, strong) ASTextNode * titleNode;
/**
 desc
 */
@property (nonatomic, strong) ASTextNode * descNode;

@property (nonatomic, strong) ASButtonNode * rightBtn;

@property (nonatomic, strong) ASDisplayNode * tableNode;

@end
