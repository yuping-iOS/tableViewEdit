//
//  MyCell.m
//  Demo
//
//  Created by yuping on 15/5/19.
//  Copyright (c) 2015年 yuping. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

- (void)setIsShow:(BOOL)isShow {

    _isShow = isShow;
    
    UIImage *img = nil;
    if (_isShow) {
        img = [UIImage imageNamed:@"quxiao"];
    }else {
        img = [UIImage imageNamed:@"quanxuan"];
    }
    _imgView.image = img;
}


@end
