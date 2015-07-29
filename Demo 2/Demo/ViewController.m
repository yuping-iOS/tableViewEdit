//
//  ViewController.m
//  Demo
//
//  Created by yuping on 15/5/25.
//  Copyright (c) 2015年 yuping. All rights reserved.
//

#import "ViewController.h"


#define KScreenWidth    [UIScreen mainScreen].bounds.size.width
#define KScreenHeight   [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //创建上面滑动的视图
    [self _initUpView];
    
    //创建下面的滑动视图
    [self _initDownView];
    
    //接收通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeAction:) name:@"didScrollChange1" object:nil];

    //接收通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeAction:) name:@"didScrollChange2" object:nil];

}

//接收到通知后响应方法
- (void)changeAction:(NSNotification *)notif {
    
    if ([notif.name isEqualToString:@"didScrollChange1"]) {
        NSDictionary *dic = notif.object;
        
        NSInteger page = [[dic objectForKey:@"currentPage"] integerValue]/KScreenWidth;
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:page inSection:0];
        
        [_upView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    }else if ([notif.name isEqualToString:@"didScrollChange2"]) {
        NSDictionary *dic = notif.object;
        
        NSInteger item = [[dic objectForKey:@"currentPage"] integerValue];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:item inSection:0];
        
        [_downView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    }
    
    
}

//创建上册滑动的视图
- (void)_initUpView {

    _upView = [[UpCollectionView alloc] initWithFrame:CGRectMake(0, 20, KScreenWidth, 40)];
    _upView.backgroundColor = [UIColor grayColor];
    
    _upView.pageWidth = 50;
    _upView.pageHeight = 40;
    
    _upView.data = @[@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1"];    //11个元素
    
    [self.view addSubview:_upView];
    
}

//创建下面的滑动视图
- (void)_initDownView {

    _downView = [[DownCollectionView alloc] initWithFrame:CGRectMake(0, 70, KScreenWidth, KScreenHeight-20-40-10)];
    _downView.backgroundColor = [UIColor whiteColor];
    
    //设置分页效果
    _downView.pagingEnabled = YES;
    
    _downView.data = @[@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1"];    //22个元素
    
    _downView.pageWidth = KScreenWidth;
    _downView.pageHeight = CGRectGetHeight(_downView.frame);
    
    [self.view addSubview:_downView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
