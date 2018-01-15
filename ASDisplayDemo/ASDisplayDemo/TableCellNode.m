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
    [self addSubnode:self.titleNode];
    [self addSubnode:self.descNode];
    [self addSubnode:self.rightBtn];
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
        [_rightBtn setTitle:@"right" withFont:[UIFont systemFontOfSize:14] withColor:[UIColor redColor] forState:UIControlStateNormal];
    }
    return _rightBtn;
}
#pragma mark --layoutSpecThatFits
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
    // 当用户名和位置信息文本太长时,收缩堆放视图来适应屏幕,而不是将所有内容向右堆放
    ASStackLayoutSpec *nameLocationStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:10 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[self.titleNode, self.descNode]];
    nameLocationStack.style.flexShrink = 1.0;
    nameLocationStack.style.flexGrow = 1.0;
    
//    //如果从服务器获取位置信息,并检查位置信息是否可用
//        nameLocationStack.children = @[self.titleNode, self.descNode];
   
    
    //水平堆放
    ASStackLayoutSpec *headerStackSpec = [ASStackLayoutSpec   stackLayoutSpecWithDirection:ASStackLayoutDirectionHorizontal
                                                                                   spacing:40
                                                                            justifyContent:ASStackLayoutJustifyContentStart
                                                                                alignItems:ASStackLayoutAlignItemsCenter
                                                                                  children:@[nameLocationStack, self.rightBtn]];
    
    //插入堆放
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 10, 10, 10)
                                                  child:headerStackSpec];

}

@end
