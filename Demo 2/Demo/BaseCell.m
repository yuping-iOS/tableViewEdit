//
//  BaseCell.m
//  Demo
//
//  Created by yuping on 15/5/25.
//  Copyright (c) 2015年 yuping. All rights reserved.
//

#import "BaseCell.h"

@implementation BaseCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame)-30, CGRectGetWidth(self.frame), 30)];
        _label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label];
        
    }
    return self;
}

- (void)setText:(NSString *)text {

    _text = text;
    
    _label.text = text;
    
}


@end
