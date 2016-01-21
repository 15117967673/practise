//
//  LeftDetailViewController.m
//  Dancer
//
//  Created by qianfeng on 15/8/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "LeftDetailViewController.h"
#import "AFNetworking.h"
#import "DanceDetailCell.h"
#import "DanceDetailCellAnother.h"
#import "DanceDetailModel.h"
#import "DanceWebView.h"
#import "DanceDetailBasicCell.h"
#import "DanceVedio.h"
#import "MJRefresh.h"
#import <MediaPlayer/MediaPlayer.h>
#import "AppDelegate.h"
@interface LeftDetailViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableview;
    NSMutableArray *_dataArr;
    
    NSInteger from;
    
    NSString *videoUrl;
    
   //MPMoviePlayerViewController *_player;
    
    NSInteger flag;
    
    NSString *leftId;
    UILabel *label;
}
@end

@implementation LeftDetailViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    from=0;
    videoUrl=@"";
    flag=0;
    self.automaticallyAdjustsScrollViewInsets=NO;
    self.view.backgroundColor=[UIColor whiteColor];
    
    _dataArr=[[NSMutableArray alloc]init];
    _tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width,self.view.frame.size.height-64-49)];
    _tableview.dataSource=self;
    _tableview.delegate=self;
    
    [self.view addSubview:_tableview];
    [_tableview registerNib:[UINib nibWithNibName:@"DanceDetailCell" bundle:nil] forCellReuseIdentifier:@"aaa"];
    [_tableview registerNib:[UINib nibWithNibName:@"DanceDetailCellAnother" bundle:nil] forCellReuseIdentifier:@"bbb"];
    
//    _strUrl=[NSString stringWithFormat:@"http://client-api.dingdone.com/97AX8NW8A6/6944/listcontents?column_id=%@&from=0&size=10",_danceTypeId];
    NSLog(@"%@",_strUrl);
    //NSLog(@"str:%@",strUrl);
    _strUrl=@"http://client-api.dingdone.com/97AX8NW8A6/6944/listcontents?column_id=133949&from=0&size=10";
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    
    [self dataFinish:manager withUrl:_strUrl];
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    
    _tableview.header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(downRefersh)];
    
    _tableview.footer=[MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upRefresh)];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receivedNotif:) name:@"LeftDetailViewController" object:nil];
    
    
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
    [btn setBackgroundImage:[UIImage imageNamed:@"module_6944_press"] forState:UIControlStateNormal];
    btn.frame=CGRectMake(0, 0, 30, 30);
    [btn addTarget:self action:@selector(presentLeft) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem=leftItem;
    
    label= [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
           label.textAlignment=NSTextAlignmentCenter;
    label.text=@"基本功";
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:label];
    self.navigationItem.rightBarButtonItem=rightItem;

}
-(void)presentLeft
{
    AppDelegate *delegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate.sideMenuViewController presentLeftMenuViewController];
}


#pragma mark - notification
-(void)receivedNotif:(NSNotification *)notification {
    
    NSLog(@"notification:%@",notification.userInfo[@"modelId"]);
    leftId=notification.userInfo[@"modelId"];
    label.text=notification.userInfo[@"modelName"];
    NSString *urlStr=[NSString stringWithFormat:@"http://client-api.dingdone.com/97AX8NW8A6/6944/listcontents?column_id=%@&from=0&size=10",leftId];
    NSLog(@"downRefersh:%@",urlStr);
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.tag=1000;
    [self dataFinish:manager withUrl:urlStr];
    flag=1;
    
}
-(void)btnClick:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - refresh
-(void)downRefersh
{
    NSString *urlStr=@"";
    if(flag==0){
        urlStr=_strUrl;
       
    }else{
        urlStr=[NSString stringWithFormat:@"http://client-api.dingdone.com/97AX8NW8A6/6944/listcontents?column_id=%@&from=0&size=10",leftId];
    }
   
    NSLog(@"downRefersh:%@",urlStr);
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.tag=1000;
    
    [self dataFinish:manager withUrl:urlStr];
}
-(void)upRefresh
{
    NSString *urlStr=@"";
    if(flag==0){
        urlStr=[NSString stringWithFormat:@"http://client-api.dingdone.com/97AX8NW8A6/6944/listcontents?column_id=133949&from=%ld&size=10",from];
       
    }else{
        urlStr=[NSString stringWithFormat:@"http://client-api.dingdone.com/97AX8NW8A6/6944/listcontents?column_id=%@&from=%ld&size=10",leftId,from];
    }

    NSLog(@"upRefresh:%@",urlStr);
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.tag=1001;
    [self dataFinish:manager withUrl:urlStr];
}

-(void)dataFinish:(AFHTTPRequestOperationManager *)manager withUrl:(NSString *)urlStr
{
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        if(manager.tag==1000){
            [_dataArr removeAllObjects];
            from=10;
            //把数据写入文件
            //[self writeToLocalWithData:responseObject];
        }else{
            from+=10;
            NSLog(@"manager1001 for=%ld",from);
        }
        [self configData:responseObject];
        
        [_tableview.header endRefreshing];
        [_tableview.footer endRefreshing];
        //[_tableview reloadData];

        [_tableview reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"fail");
    }];

}
-(void)configData:(NSData *)data
{
    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSDictionary *dataDic=[dic objectForKey:@"data"];
    NSArray *array=[dataDic objectForKey:@"listData"];
    for(NSDictionary *appDic in array){
        DanceDetailModel *model=[[DanceDetailModel alloc]init];
        model.Id=[appDic objectForKey:@"id"];
        model.childsData=[appDic objectForKey:@"childsData"];
       // NSLog(@"id:%d",model.Id.intValue);
        model.title=[appDic objectForKey:@"title"];
        
        model.styleType=[appDic objectForKey:@"styleType"];
        NSDictionary *imageUrl=[appDic objectForKey:@"indexPic"];
        model.dir=[imageUrl objectForKey:@"dir"];
        model.filename=[imageUrl objectForKey:@"filename"];
        model.filepath=[imageUrl objectForKey:@"filepath"];
        model.host=[imageUrl objectForKey:@"host"];
        model.height=[imageUrl objectForKey:@"height"];
        model.width=[imageUrl objectForKey:@"width"];
        NSDictionary *click=[appDic objectForKey:@"extendValues"];
        model.clickNum=[click objectForKey:@"clickNum"];
        model.keywords=[click objectForKey:@"keywords"];
        model.contentUrl=[appDic objectForKey:@"contentUrl"];
        [_dataArr addObject:model];
    }
}
#pragma mark - tableview
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DanceDetailModel *model=[_dataArr objectAtIndex:indexPath.row];
    CGFloat height=model.styleType.intValue==6 ? 200:100;
    AppDelegate *delegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    
    CGFloat heightScale=delegate.window.frame.size.width/320;
    return height*heightScale;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DanceDetailModel *model=[_dataArr objectAtIndex:indexPath.row];
    NSString * cellID = model.styleType.intValue==6 ? @"aaa" : @"bbb";
    DanceDetailBasicCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    // Configure the cell...
    [cell customModel:model];
    return cell;

  
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_tableview deselectRowAtIndexPath:indexPath animated:YES];
    DanceDetailModel *model=[_dataArr objectAtIndex:indexPath.row];
    if(model.childsData.count!=0){
       //推出新界面 contenturl
        
        DanceWebView *webView=[[DanceWebView alloc]init];
        webView.strUrl=model.contentUrl;
        NSLog(@"webview:%@",webView.strUrl);
        webView.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:webView animated:YES];

    }else{
       //推出新界面
        NSLog(@"非基本功");
        DanceVedio *dv=[[DanceVedio alloc]init];
        dv.strUrl=[NSString stringWithFormat:@"http://client-api.dingdone.com/97AX8NW8A6/content/%@",model.Id];
        dv.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:dv animated:YES];
        
    }
    
}

@end
