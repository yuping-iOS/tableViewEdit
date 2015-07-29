//
//  BaseCell.h
//  Demo
//
//  Created by yuping on 15/5/25.
//  Copyright (c) 2015年 yuping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCell : UICollectionViewCell {

    UILabel *_label;
}

@property(nonatomic, copy)NSString *text;

@end
