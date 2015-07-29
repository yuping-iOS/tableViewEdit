//
//  UpCollectionView.m
//  Demo
//
//  Created by yuping on 15/5/25.
//  Copyright (c) 2015年 yuping. All rights reserved.
//

#import "UpCollectionView.h"
#import "BaseCell.h"
#define KScreenWidth    [UIScreen mainScreen].bounds.size.width
#define KScreenHeight   [UIScreen mainScreen].bounds.size.height
@implementation UpCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //注册单元格
        [self registerClass:[BaseCell class] forCellWithReuseIdentifier:@"Up_cell"];
        
    }
    return self;
}

//子类复写
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    BaseCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Up_cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(10)*.1 green:arc4random_uniform(10)*.1 blue:arc4random_uniform(10)*.1 alpha:1];
    cell.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    return cell;
}

//点击单元格调用的代理方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
    NSInteger item = indexPath.row;
    
    NSDictionary *dic = @{
                          @"currentPage":@(item)
                          };
    
    //发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"didScrollChange2" object:dic];
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    UIEdgeInsets edge = UIEdgeInsetsMake(0, 0, 0,KScreenWidth-self.pageWidth);
    return edge;
}




@end
