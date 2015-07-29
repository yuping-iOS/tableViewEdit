//
//  MyCell.h
//  EditDemo
//
//  Created by yuping on 15/5/20.
//  Copyright (c) 2015年 yuping. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lable;
@property (nonatomic,strong) UIImageView *m_checkImageView;
@property (nonatomic,assign) BOOL m_check;

- (void) setChecked:(BOOL)checked;

@end
