//
//  LeftViewController.m
//  Dancer
//
//  Created by qianfeng on 15/8/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "LeftViewController.h"
#import "AFNetworking.h"
#import "DanceTypeModel.h"
#import "LeftDetailViewController.h"
#import "AppDelegate.h"
#import "MyViewController.h"
#import "MyTabBarController.h"
@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableview;
    NSMutableArray *_dataArr;
    NSString *flag;
    
    NSNumber *flagSelected;
}

@end
@implementation LeftViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    _dataArr=[[NSMutableArray alloc]init];
    flagSelected=@(1000);
    _tableview=[[UITableView alloc]initWithFrame:CGRectMake(30*(SCREENW/320) , 50*(SCREENH/480), 200*(SCREENW/320), 400*(SCREENH/480))];
    _tableview.dataSource=self;
    _tableview.delegate=self;
    _tableview.backgroundColor=[UIColor clearColor];
    [self.view addSubview:_tableview];
    _tableview.showsVerticalScrollIndicator = NO;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //self.view.backgroundColor=[UIColor yellowColor];
    NSString *strUrl=@"http://client-api.dingdone.com/97AX8NW8A6/columns?module_id=6944";
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manager GET:strUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        //NSLog(@"dic:%@",dic);
        DanceTypeModel *model=[[DanceTypeModel alloc]init];
        model.name=@"我的信息";
        [_dataArr addObject:model];
        NSArray *array=[dic objectForKey:@"data"];
        for(NSDictionary *appDic in array){
            DanceTypeModel *model=[[DanceTypeModel alloc]init];
            
               model.Id=[appDic objectForKey:@"id"];
               model.name=[appDic objectForKey:@"name"];
            [_dataArr addObject:model];
        }
        for(int j=0;j<[_dataArr count];j++){
            DanceTypeModel *model=[_dataArr objectAtIndex:j];
           // NSLog(@"model.name:%@",model.name);
        }
        [_tableview reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"fail");
    }];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receivedNotif:) name:@"LeftViewController" object:nil];

}
-(void)receivedNotif:(NSNotification *)noti
{
    flagSelected=noti.userInfo[@"index"];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"qqq"];
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"qqq"];
    }
   
    cell.backgroundColor = [UIColor clearColor];
    if(indexPath.row==0){
       DanceTypeModel *model=[_dataArr objectAtIndex:indexPath.row];
       cell.textLabel.text=model.name;
       cell.textLabel.textColor = [UIColor redColor];
       cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
       //return cell;
    }else{
        DanceTypeModel *model=[_dataArr objectAtIndex:indexPath.row];
        cell.textLabel.text=model.name;
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.highlightedTextColor = [UIColor lightGrayColor];
        cell.selectedBackgroundView = [[UIView alloc] init];
        //return cell;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.row==0){
       NSDictionary *dic=[[NSDictionary alloc]initWithObjectsAndKeys:@(1),@"flag",flagSelected,@"flagslected",nil];
       // NSLog(@"我的信息");
        NSNotification *notification3 =[NSNotification notificationWithName:@"MyTabBarController" object:nil userInfo:dic];
        //通过通知中心发送通知
        [[NSNotificationCenter defaultCenter] postNotification:notification3];
        return;
    }
    DanceTypeModel *model=[_dataArr objectAtIndex:indexPath.row];

    NSDictionary *dic=[[NSDictionary alloc]initWithObjectsAndKeys:model.Id,@"modelId", model.name,@"modelName",nil];
    NSNotification *notification =[NSNotification notificationWithName:@"LeftDetailViewController" object:nil userInfo:dic];
    //通过通知中心发送通知
    [[NSNotificationCenter defaultCenter] postNotification:notification];
    
    
    NSDictionary *dic2=[[NSDictionary alloc]initWithObjectsAndKeys:@(2),@"flag",nil];
    NSNotification *notification2 =[NSNotification notificationWithName:@"MyTabBarController" object:nil userInfo:dic2];
    //通过通知中心发送通知
    [[NSNotificationCenter defaultCenter] postNotification:notification2];
}



@end
