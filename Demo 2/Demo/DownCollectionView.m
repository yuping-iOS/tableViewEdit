//
//  DownCollectionView.m
//  Demo
//
//  Created by yuping on 15/5/25.
//  Copyright (c) 2015年 yuping. All rights reserved.
//

#import "DownCollectionView.h"
#import "BaseCell.h"

@implementation DownCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //注册单元格
        [self registerClass:[BaseCell class] forCellWithReuseIdentifier:@"Down_cell"];
        
    }
    return self;
}

//子类复写
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    BaseCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Down_cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(10)*.1 green:arc4random_uniform(10)*.1 blue:arc4random_uniform(10)*.1 alpha:1];
    
    cell.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    return cell;
}

//手指结束拖拽的时候调用的代理方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    //判断当前所在的页数
    CGFloat page = scrollView.contentOffset.x;
    
    NSDictionary *dic = @{
                          @"currentPage":@(page)
                          };
    
    //发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"didScrollChange1" object:dic];
}





@end
