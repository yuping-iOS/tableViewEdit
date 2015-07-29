//
//  NavigationController.m
//  EditDemo
//
//  Created by yuping on 15/5/20.
//  Copyright (c) 2015年 yuping. All rights reserved.
//

#import "NavigationController.h"
#import "RootController.h"
#import "TestViewController.h"
@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    RootController *rootVC = [[RootController alloc] init];
    TestViewController *testVC = [[TestViewController alloc] init];
    self.viewControllers = @[testVC,rootVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
