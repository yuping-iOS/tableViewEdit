//
//  ViewController.m
//  Demo2
//
//  Created by liyoubing on 15/5/25.
//  Copyright (c) 2015年 liyoubing. All rights reserved.
//

#import "ViewController.h"
#import "MXPullDownMenu.h"

@interface ViewController ()<MXPullDownMenuDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MXPullDownMenu *downMenu = [[MXPullDownMenu alloc] initWithArray:@[@[@"电影",@"新闻",@"综艺"],@[@"电影1",@"新闻1",@"综艺1"],@[@"电影2",@"新闻2",@"综艺2"]] selectedColor:nil];
    downMenu.backgroundColor = [UIColor darkGrayColor];
    downMenu.delegate = self;
    
    downMenu.frame = CGRectMake(0, 20, 375, 40);
    
    [self.view addSubview:downMenu];
    
}


- (void)PullDownMenu:(MXPullDownMenu *)pullDownMenu didSelectRowAtColumn:(NSInteger)column row:(NSInteger)row {

    if (column == 0) {
        switch (row) {
            case 0:
                NSLog(@"电影");
                break;
            case 1:
                NSLog(@"新闻");
                break;
            case 2:
                NSLog(@"综艺");
                break;
        }
    }
    
}

@end
