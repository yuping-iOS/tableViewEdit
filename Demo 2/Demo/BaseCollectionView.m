//
//  BaseCollectionView.m
//  Demo
//
//  Created by yuping on 15/5/25.
//  Copyright (c) 2015年 yuping. All rights reserved.
//

#import "BaseCollectionView.h"

@implementation BaseCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    
    //创建布局对象
    UICollectionViewFlowLayout *flowLayOut = [[UICollectionViewFlowLayout alloc] init];
    flowLayOut.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayOut.minimumLineSpacing = 0;
    
    self = [super initWithFrame:frame collectionViewLayout:flowLayOut];
    
    if (self) {
        
        //设置代理
        self.dataSource = self;
        self.delegate = self;
        //设置减速方式
        self.decelerationRate = UIScrollViewDecelerationRateFast;
    }
    return self;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _data.count;
}

//子类复写
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    return nil;
    
}

//设置单元格的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize size = CGSizeMake(_pageWidth, _pageHeight);
    return size;
}


@end
