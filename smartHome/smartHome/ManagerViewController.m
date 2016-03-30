//
//  ManagerViewController.m
//  smartHome
//
//  Created by  wy on 15/10/28.
//  Copyright © 2015年 zhichi. All rights reserved.
//

#import "ManagerViewController.h"
#import "ManagerFirstCell.h"
#import "ManagerLastCell.h"
@interface ManagerViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_myTableView;
    NSMutableArray *_dataArr;
}

@end

@implementation ManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.265 green:0.7 blue:0.45 alpha:1];
    _dataArr=[[NSMutableArray alloc]initWithCapacity:10];
    _myTableView=[[UITableView alloc]initWithFrame:self.view.frame];
    _myTableView.backgroundColor=[UIColor colorWithRed:0.265 green:0.7 blue:0.45 alpha:1];
    _myTableView.delegate=self;
    _myTableView.dataSource=self;
    [self.view addSubview:_myTableView];
    
    for (int i=0; i<4; i++) {
        NSString *str=[NSString stringWithFormat:@"%d",i];
        [_dataArr addObject:str];
    }
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==_dataArr.count-1){
        ManagerLastCell *cell=[tableView dequeueReusableCellWithIdentifier:@"aaa"];
        if (!cell) {
            //通过xib文件加载cell
            cell = [[[NSBundle mainBundle] loadNibNamed:@"ManagerLastCell" owner:self options:nil] lastObject];
            cell.backgroundColor= [UIColor colorWithRed:0.265 green:0.7 blue:0.45 alpha:1];
            return cell;
        }
    }
    
        ManagerFirstCell *cell=[tableView dequeueReusableCellWithIdentifier:@"bbb"];
        if (!cell) {
            //通过xib文件加载cell
            cell = [[[NSBundle mainBundle] loadNibNamed:@"ManagerFirstCell" owner:self options:nil] lastObject];
            cell.backgroundColor= [UIColor colorWithRed:0.265 green:0.7 blue:0.45 alpha:1];
            return cell;
        }
    return nil;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if(indexPath.row==_dataArr.count-1){
        [_dataArr insertObject:@"aaaaa" atIndex:indexPath.row];
        
        [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationTop];
    }

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
    
}










@end
