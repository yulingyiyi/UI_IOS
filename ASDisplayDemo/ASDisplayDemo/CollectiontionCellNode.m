//
//  CollectiontionCellNode.m
//  ASDisplayDemo
//
//  Created by apple on 2018/1/17.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "CollectiontionCellNode.h"

@implementation CollectiontionCellNode
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
    [self addSubnode:self.iconNode];
}

#pragma mark -- lazy
- (ASTextNode *)titleNode{
    if (!_titleNode) {
        _titleNode = [[ASTextNode alloc] init];
        _titleNode.attributedText = [[NSAttributedString alloc] initWithString:@"title"];
    }
    return _titleNode;
}
- (ASImageNode *)iconNode{
    if (!_iconNode) {
        _iconNode = [[ASImageNode alloc] init];
        _iconNode.image = [UIImage imageNamed:@"icon"];
        _iconNode.style.preferredSize = CGSizeMake(100, 100);
        _iconNode.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _iconNode;
}
#pragma mark --layoutSpecThatFits
- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize{
    // 当用户名和位置信息文本太长时,收缩堆放视图来适应屏幕,而不是将所有内容向右堆放
    ASStackLayoutSpec *nameLocationStack = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical spacing:10 justifyContent:ASStackLayoutJustifyContentStart alignItems:ASStackLayoutAlignItemsStart children:@[self.titleNode, self.iconNode]];
    nameLocationStack.style.flexShrink = 1.0;
    nameLocationStack.style.flexGrow = 1.0;
    //    //如果从服务器获取位置信息,并检查位置信息是否可用
    //        nameLocationStack.children = @[self.titleNode, self.descNode];
    //插入堆放
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 10, 10, 10)
                                                  child:nameLocationStack];
    
}
@end
