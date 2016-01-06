//
//  MyViewController.m
//  Dancer
//
//  Created by qianfeng on 15/9/10.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    
    NSMutableArray *_dataArr;
}

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArr=[[NSMutableArray alloc]init];
    [self createData];
    [self createUI];
    
}
-(void)createData
{
    NSArray *arr1=@[@"我的消息",@"我的资料",@"我的通讯录",@"我的粉丝",@"黑名单"];
    NSArray *arr2=@[@"我的帖子",@"我的评论",@"我赞过的",@"我的收藏",@"我的投稿"];
    NSArray *arr3=@[@"设置"];
    [_dataArr addObject:arr1];
    [_dataArr addObject:arr2];
    [_dataArr addObject:arr3];
}
-(void)createUI
{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, SCREENH)];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    [self.view addSubview:_tableView];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  [_dataArr count];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[_dataArr objectAtIndex:section]count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"qqq"];
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:0 reuseIdentifier:@"qqq"];
    }
    cell.textLabel.text=[[_dataArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, 10)];
    
    view.backgroundColor=[UIColor whiteColor];
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

@end
