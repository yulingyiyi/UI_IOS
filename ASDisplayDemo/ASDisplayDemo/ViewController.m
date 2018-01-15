//
//  ViewController.m
//  ASDisplayDemo
//
//  Created by apple on 2018/1/15.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import <AsyncDisplayKit.h>
#import "TableCellNode.h"
@interface ViewController ()<ASTableDelegate, ASTableDataSource>

@property (nonatomic, strong) ASTableNode * tableNode;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableNode = [[ASTableNode alloc] initWithStyle:UITableViewStylePlain];
    _tableNode.delegate = self;
    _tableNode.dataSource = self;
    _tableNode.view.frame = self.view.bounds;
    [self.view addSubnode:_tableNode];
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark --ASTableDelegate, ASTableDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

- (ASCellNodeBlock)tableView:(ASTableView *)tableView nodeBlockForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    BOOL haiTaoStyle = indexPath.row % 2 ? YES : NO;
    
     ASCellNode *(^cellNodeBlock)() = ^ASCellNode *() {
        
        TableCellNode *cellNode = [[TableCellNode alloc] init];
//        cellNode.text = @"ughfusekbdfgyuswegfklsdughfal.degwfahwef";
        return cellNode;
    };
    
    return cellNodeBlock;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
