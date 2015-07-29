//
//  TestViewController.m
//  EditDemo
//
//  Created by yuping on 15/5/20.
//  Copyright (c) 2015年 yuping. All rights reserved.
//

#import "TestViewController.h"
#import "RootController.h"
@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(90, 90, 90, 90);
    [button setTitle:@"push" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
- (void)click {
    RootController *rootVC = [[RootController alloc] init];
    [self.navigationController pushViewController:rootVC animated:YES];
}


@end
