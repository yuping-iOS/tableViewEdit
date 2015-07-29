//
//  MyCell.m
//  EditDemo
//
//  Created by yuping on 15/5/20.
//  Copyright (c) 2015年 yuping. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

   
}

- (void) setCheckImageViewCenter:(CGPoint)pt alpha:(CGFloat)alpha animated:(BOOL)animated
{
    if (animated)
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDuration:0.3];
        
        _m_checkImageView.center = pt;
        _m_checkImageView.alpha = alpha;
        
        [UIView commitAnimations];
    }
    else
    {
        _m_checkImageView.center = pt;
        _m_checkImageView.alpha = alpha;
    }
}

- (void) setEditing:(BOOL)editting animated:(BOOL)animated
{
    if (self.editing == editting)
    {
        return;
    }
    
    [super setEditing:editting animated:animated];
    
    if (editting)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundView = [[UIView alloc] init];
//        self.backgroundView.backgroundColor = [UIColor whiteColor];
        self.backgroundView.userInteractionEnabled = YES;
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.detailTextLabel.backgroundColor = [UIColor clearColor];
        
        if (_m_checkImageView == nil)
        {
            _m_checkImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Unselected.png"]];
            _m_checkImageView.frame = CGRectMake(0,0,20,20);
            _m_checkImageView.userInteractionEnabled = YES;
            [self addSubview:_m_checkImageView];
        }
        
        [self setChecked:_m_check];
        _m_checkImageView.center = CGPointMake(-CGRectGetWidth(_m_checkImageView.frame) * 0.5,
                                              CGRectGetHeight(self.bounds) * 0.5);
        _m_checkImageView.alpha = 0.0;
        [self setCheckImageViewCenter:CGPointMake(20.5, CGRectGetHeight(self.bounds) * 0.5)
                                alpha:1.0 animated:animated];
    }
    else
    {
        //取消编辑的时候
        _m_check = NO;
        self.selectionStyle = UITableViewCellSelectionStyleBlue;
        self.backgroundView = nil;
        
        if (_m_checkImageView)
        {
            [self setCheckImageViewCenter:CGPointMake(-CGRectGetWidth(_m_checkImageView.frame) * 0.5,
                                                      CGRectGetHeight(self.bounds) * 0.5)
                                    alpha:0.0 
                                 animated:animated];
        }
    }
}


- (void) setChecked:(BOOL)checked
{
    if (checked)
    {
        _m_checkImageView.image = [UIImage imageNamed:@"Selected"];
        self.backgroundView.backgroundColor = [UIColor colorWithRed:223.0/255.0 green:230.0/255.0 blue:250.0/255.0 alpha:1.0];
    }
    else
    {
        _m_checkImageView.image = [UIImage imageNamed:@"USelected"];
        self.backgroundView.backgroundColor = [UIColor whiteColor];
    }
    _m_check = checked;
}

@end
