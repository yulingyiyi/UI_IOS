//
//  TableCellNode.m
//  ASDisplayDemo
//
//  Created by apple on 2018/1/15.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "TableCellNode.h"
@implementation TableCellNode
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI{
    
    InfoCellNode *node0 = [[InfoCellNode alloc] init];
    node0.style.preferredSize = CGSizeMake(200, 50);
    [self addSubnode:node0];
    
    
    
    InfoCellNode *node1 = [[InfoCellNode alloc] init];
    node1.style.preferredSize = CGSizeMake(100, 50);
[   self addSubnode:node1];
    
    InfoCellNode *node2 = [[InfoCellNode alloc] init];
    node2.style.preferredSize = CGSizeMake(100, 50);
    [self addSubnode:node2];
    
    _infoCellNodes = @[node0, node1, node2];
    
    [self addSubnode:self.titleNode];
    [self addSubnode:self.descNode];
    [self addSubnode:self.rightBtn];
    
    
//    [self addSubnode:self.tableNode];
}
#pragma mark -- ASTableDelegate, ASTableDataSource
- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (ASCellNodeBlock)tableNode:(ASTableNode *)tableNode nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ASCellNode *(^cellNodeBlock)() = ^ASCellNode *() {
        ASTextCellNode *cell = [[ASTextCellNode alloc] init];
        cell.text = @"asdasmhdgaksuhgfuasjdnalkjsd";
        return cell;
    };
    
    return cellNodeBlock;
}

#pragma mark -- lazy
- (ASTextNode *)titleNode{
    if (!_titleNode) {
        _titleNode = [[ASTextNode alloc] init];
        _titleNode.attributedText = [[NSAttributedString alloc] initWithString:@"title"];
    }
    return _titleNode;
}
- (ASTextNode *)descNode{
    if (!_descNode) {
        _descNode = [[ASTextNode alloc] init];
        _descNode.attributedText = [[NSAttributedString alloc] initWithString:@"desc"];
    }
    return _descNode;
}
- (ASButtonNode *)rightBtn{
    if (!_rightBtn) {
        _rightBtn = [[ASButtonNode alloc] init];
        _rightBtn.style.spacingAfter = 20;
        [_rightBtn setTitle:@"right" withFont:[UIFont systemFontOfSize:14] withColor:[UIColor redColor] forState:UIControlStateNormal];
    }
    return _rightBtn;
}
- (ASDisplayNode *)tableNode{
    if(!_tableNode){
        _tableNode = [[ASDisplayNode alloc] init];
//        _tableNode = [[ASTableNode alloc] initWithStyle:UITableViewStylePlain];
//        _tableNode.delegate = self;
//        _tableNode.dataSource = self;
//        _tableNode.view.scrollEnabled = NO;
//        _tableNode.
        //        _tableNode.style.flexShrink = YES;
//        _tableNode.style.preferredSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 100);
    }
    return _tableNode;
}
#pragma mark --layoutSpecThatFits
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
    // 当用户名和位置信息文本太长时,收缩堆放视图来适应屏幕,而不是将所有内容向右堆放
    ASStackLayoutSpec *nameLocationStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:10 justifyContent:ASStackLayoutJustifyContentSpaceBetween alignItems:ASStackLayoutAlignItemsStart children:@[self.titleNode, self.descNode]];
    
    //水平堆放
    ASStackLayoutSpec *headerStackSpec = [ASStackLayoutSpec   stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
                                                                                   spacing:40
                                                                            justifyContent:ASStackLayoutJustifyContentStart
                                                                                alignItems:ASStackLayoutAlignItemsCenter
                                                                                  children:@[nameLocationStack, self.rightBtn]];
    
    
    ASStackLayoutSpec *cells = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:10 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsBaselineFirst children:_infoCellNodes];

    
    
    ASStackLayoutSpec *con = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:10 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[headerStackSpec,cells]];

    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 10, 10, 10)
                                                  child:con];

}

@end
