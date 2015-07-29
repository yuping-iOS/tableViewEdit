//
//  BaseCollectionView.h
//  Demo
//
//  Created by yuping on 15/5/25.
//  Copyright (c) 2015年 yuping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic, assign)CGFloat pageWidth;  //每一个单元格的宽度
@property(nonatomic, assign)CGFloat pageHeight;  //每一个单元格的高度
@property(nonatomic, strong)NSArray *data;

@end
