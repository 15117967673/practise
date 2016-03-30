//
//  ControlViewController.m
//  smartHome
//
//  Created by  zcznx on 15/10/28.
//  Copyright © 2015年 zhichi. All rights reserved.
//

#import "ControlViewController.h"
#import "ControllerCell.h"
#import "ControlModel.h"
@interface ControlViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_myTableView;
    NSMutableArray *_dataArr;
}

@end

@implementation ControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.265 green:0.7 blue:0.45 alpha:1];
    _dataArr=[[NSMutableArray alloc]init];
    _myTableView=[[UITableView alloc]initWithFrame:self.view.frame];
    _myTableView.backgroundColor=[UIColor colorWithRed:0.265 green:0.7 blue:0.45 alpha:1];
    _myTableView.delegate=self;
    _myTableView.dataSource=self;
    
    [self.view addSubview:_myTableView];
    
    for (int i=0; i<7; i++) {
        //NSString *str=[NSString stringWithFormat:@"%d",i];
        ControlModel *model=[[ControlModel alloc]init];
        model.name=@"请绑定电器";
        model.time=@"";
        model.isOn=NO;
        [_dataArr addObject:model];
    }
    NSLog(@"%@",_dataArr);
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receivedNotif:) name:@"ControlViewController" object:nil];
}
-(void)receivedNotif:(NSNotification *)noti
{
    NSNumber *flag=noti.userInfo[@"flag"];
    if(flag.intValue==0){
      NSNumber *row=noti.userInfo[@"index.row"];
      NSLog(@"sender.tag---noti:%d",row.intValue);
    
    [_dataArr removeObjectAtIndex:row.intValue];
    ControlModel *model=[[ControlModel alloc]init];
    model.name=@"绑定电器名称";
    model.time=@"绑定时间";
    model.isOn=YES;
    [_dataArr insertObject:model atIndex:row.intValue];
    [_myTableView reloadData];
    }else{
        NSNumber *row=noti.userInfo[@"index.row"];
        NSLog(@"sender.tag---noti:%d",row.intValue);
        
        [_dataArr removeObjectAtIndex:row.intValue];
        ControlModel *model=[[ControlModel alloc]init];
        model.name=@"请绑定电器";
        model.time=@"";
        model.isOn=NO;
        [_dataArr insertObject:model atIndex:row.intValue];
       [_myTableView reloadData];

    
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 115;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ControllerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"aaa"];
    if (!cell) {
        //通过xib文件加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ControllerCell" owner:self options:nil] lastObject];
        
    }
    ControlModel *model=[_dataArr objectAtIndex:indexPath.row];
    [cell customModel:model];
    cell.isOn.tag=indexPath.row;
    cell.backgroundColor= [UIColor colorWithRed:0.265 green:0.7 blue:0.45 alpha:1];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES]    ;
        
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{//修改删除按钮上的文字
    return @"解绑";
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{//允许编辑，编辑相关按钮（删除，插入）点击时触发
    
    //判断编辑风格是插入还是删除
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //通过位置先删除对应的数据模型
        [_dataArr removeObjectAtIndex:indexPath.row];
        
        
        //然后在删除对应的cell
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationTop];
        
        }
    [_myTableView reloadData];
//    for (int i=0; i<_dataArr.count; i++) {
//        ControllerCell *cell=[tableView cellForRowAtIndexPath:indexPath];
//        cell.isOn.tag=indexPath.row;
//    }
    
    
    
    
}








@end
