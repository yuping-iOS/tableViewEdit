//
//  RootController.m
//  EditDemo
//
//  Created by yuping on 15/5/20.
//  Copyright (c) 2015年 yuping. All rights reserved.
//

#import "RootController.h"
#import "MyCell.h"
#import "Item.h"
#import "UIViewExt.h"
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
static NSString *iden = @"iden";
@interface RootController ()<UITableViewDataSource,UITableViewDelegate> {
    NSMutableArray *_dataList;
    UITableView *_tableView;
    BOOL _isquanxuan;
}

@end

@implementation RootController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tableView.rowHeight = 50;
    _isquanxuan = YES;
    [self updateButtonsToMatchTableState];
    _dataList = [NSMutableArray arrayWithCapacity:0];
    for (int i=0; i<50; i++) {
        Item *item = [[Item alloc] init];
        item.title = [NSString stringWithFormat:@"item%d",i];
        item.isChecked = NO;
        [_dataList addObject:item];
    }
    [self initView];
    
}
- (void)initView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth,kScreenHeight) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    //注册单元格
    [_tableView registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellReuseIdentifier:iden];
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight-60, kScreenWidth, 60)];
    footView.backgroundColor = [UIColor lightGrayColor];
    //删除Lable
    UILabel *deleteLab = [[UILabel alloc] init];
    deleteLab.text = @"删除";
   
    [deleteLab sizeToFit];
     deleteLab.frame = CGRectMake(kScreenWidth -deleteLab.frame.size.width -20, 20, deleteLab.frame.size.width, deleteLab.frame.size.height);
    NSLog(@"%f",deleteLab.frame.size.width);
    [footView addSubview:deleteLab];

    UIControl *deleteCtr = [[UIControl alloc] initWithFrame:CGRectMake(deleteLab.left-10, deleteLab.top-10 ,deleteLab.bounds.size.width + 80, deleteLab.bounds.size.height+40)];
    deleteCtr.backgroundColor = [UIColor clearColor];
    [deleteCtr addTarget:self action:@selector(deleteXianSou) forControlEvents:UIControlEventTouchUpInside];
    [footView insertSubview:deleteCtr belowSubview:deleteLab];
    //批量转成线索lable
    UILabel *lable = [[UILabel alloc] init];
    lable.text = @"批量转成线索";
    [lable sizeToFit];
    lable.frame = CGRectMake(10, 20, lable.frame.size.width, lable.frame.size.height);
    NSLog(@"%f",lable.frame.size.width);
    [footView addSubview:lable];
    
    UIControl *control = [[UIControl alloc] initWithFrame:CGRectMake(0, lable.top-10 ,lable.bounds.size.width + 30, lable.bounds.size.height+40)];
    control.backgroundColor = [UIColor clearColor];
    [control addTarget:self action:@selector(TransferLeads) forControlEvents:UIControlEventTouchUpInside];
    [footView insertSubview:control belowSubview:lable];
    [self.view addSubview:footView];
    
}
- (void) setEditing:(BOOL)editting animated:(BOOL)animated
{
    [super setEditing:editting animated:animated];
    _tableView.allowsSelectionDuringEditing = YES;
    [_tableView setEditing:_tableView.editing animated:YES];
    [_tableView performSelector:@selector(reloadData) withObject:nil afterDelay:0.3];
}
#pragma mark - TableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:iden forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.lable.textColor = [UIColor blackColor];
    
    Item* item = [_dataList objectAtIndex:indexPath.row];
    cell.lable.text = item.title;
    [cell setChecked:item.isChecked];
    
    return cell;;

}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_tableView.editing) {
        Item *item = _dataList[indexPath.row];
        if (_tableView.editing) {
            MyCell *cell = (MyCell *)[tableView cellForRowAtIndexPath:indexPath];
            item.isChecked = !item.isChecked;
            [cell setChecked:item.isChecked];
        }
    }else {
        NSLog(@"真实的");
    }
}


- (void)updateButtonsToMatchTableState
{
    _tableView.allowsSelectionDuringEditing = YES;
    if (_tableView.editing)
    {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(quxiaoEdit)];
        if (_isquanxuan) {
            self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"全选" style:UIBarButtonItemStyleDone target:self action:@selector(isQuanxuan)];
        }else {
            self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消全选 " style:UIBarButtonItemStyleDone target:self action:@selector(isQuanxuan)];
        }
    }
    else
    {
         self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"back" style:UIBarButtonItemStyleDone target:self action:@selector(backPop)];
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"管理" style:UIBarButtonItemStyleDone target:self action:@selector(edit)];
    }
}

- (void)backPop {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)edit {
    [_tableView setEditing:YES animated:YES];
    [self updateButtonsToMatchTableState];
}
- (void)quxiaoEdit {
    [_tableView setEditing:NO animated:YES];
    [self updateButtonsToMatchTableState];
}

- (void)isQuanxuan {
    _isquanxuan = !_isquanxuan;
    [self updateButtonsToMatchTableState];
    NSMutableArray *array = [NSMutableArray array];
    for (Item *item in _dataList) {
        if (_isquanxuan) {
            item.isChecked = NO;
        }else {
            item.isChecked = YES;
        }
        
        [array addObject:item];
    }
    _dataList = array;
    [_tableView reloadData];
}


- (void)deleteXianSou {
    NSLog(@"delete");
    NSInteger countOfRowsToInsert = [_dataList count];
    NSMutableArray *indexPathsToInsert = [[NSMutableArray alloc] init];
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = 0; i < countOfRowsToInsert; i++) {
        Item *item = _dataList[i];
        if (item.isChecked) {
             [indexPathsToInsert addObject:[NSIndexPath indexPathForRow:i inSection:0]];
            
        }else {
           [array addObject:item];
        }
    }
    
    // 先移出数据，再动画，否则报错
    
    [_tableView beginUpdates];
    
    [_tableView deleteRowsAtIndexPaths:indexPathsToInsert withRowAnimation:UITableViewRowAnimationLeft];
    _dataList = array;
    [_tableView endUpdates];
    
}

- (void)TransferLeads{
    NSLog(@"批量转成线索");
}


@end
