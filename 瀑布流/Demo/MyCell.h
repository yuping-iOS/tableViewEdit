//
//  MyCell.h
//  Demo
//
//  Created by yuping on 15/5/19.
//  Copyright (c) 2015年 yuping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell : UICollectionViewCell

@property(nonatomic, assign)BOOL isShow;

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end
