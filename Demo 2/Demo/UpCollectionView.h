//
//  UpCollectionView.h
//  Demo
//
//  Created by yuping on 15/5/25.
//  Copyright (c) 2015年 yuping. All rights reserved.
//

#import "BaseCollectionView.h"

@interface UpCollectionView : BaseCollectionView

@property(nonatomic, assign)NSInteger selectIndex;  //选中的下标

//滑动到指定的单元格
- (void)scrollToCell:(NSIndexPath *)indexPath;

@end
