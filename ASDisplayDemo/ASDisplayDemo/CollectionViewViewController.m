//
//  CollectionViewViewController.m
//  ASDisplayDemo
//
//  Created by apple on 2018/1/17.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "CollectionViewViewController.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "CollectiontionCellNode.h"
@interface CollectionViewViewController ()<ASCollectionDelegate,ASCollectionDataSource,ASCollectionDelegateFlowLayout>
/**
 
 */
@property (nonatomic, strong) ASCollectionNode * collectionNode;
@end

@implementation CollectionViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubnode:self.collectionNode];
    // Do any additional setup after loading the view.
}
#pragma mark -- ASCollectionDelegate,ASCollectionDataSource,ASCollectionDelegateFlowLayout

- (NSInteger)numberOfSectionsInCollectionNode:(ASCollectionNode *)collectionNode{
    return 1;
}
- (NSInteger)collectionNode:(ASCollectionNode *)collectionNode numberOfItemsInSection:(NSInteger)section{
    return 100;
}
- (ASCellNode *)collectionNode:(ASCollectionNode *)collectionNode nodeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CollectiontionCellNode *item = [[CollectiontionCellNode alloc] init];
    item.titleNode.attributedText = [[NSAttributedString alloc] initWithString: @"nfjakbnsedfuhasdfguhbawdsu;iohas;osuidfiou;adhsf;iouahdf;uhsdfuvh"];
    return item;
    
}

#pragma mark -- lazy
- (ASCollectionNode *)collectionNode{
    if(!_collectionNode){
        _collectionNode = [[ASCollectionNode alloc] initWithFrame:self.view.bounds collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionNode.delegate = self;
        _collectionNode.dataSource = self;
    }
    return _collectionNode;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
