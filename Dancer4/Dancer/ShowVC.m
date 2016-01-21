//
//  ShowVC.m
//  Dancer
//
//  Created by qianfeng on 15/8/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ShowVC.h"
#import "AFNetworking.h"
#import "ShowModel.h"
#import "DanceVedio.h"
#import "DanceWebView.h"
#import "ShowCell.h"
#import "MJRefresh.h"
#import "NSString+Frame.h"
#import "AppDelegate.h"
@interface ShowVC ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableview;
    NSMutableArray *_dataArr;
    
    NSInteger from;
}

@end

@implementation ShowVC

- (void)viewDidLoad {
    from=0;
    self.view.backgroundColor=[UIColor whiteColor];
    _dataArr=[[NSMutableArray alloc]init];
    _tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENW, SCREENH)];
    _tableview.dataSource=self;
    _tableview.delegate=self;
    
    [self.view addSubview:_tableview];
    [_tableview registerNib:[UINib nibWithNibName:@"ShowCell" bundle:nil] forCellReuseIdentifier:@"aaa"];
    
    NSString *strUrl=[NSString stringWithFormat:@"http://client-api.dingdone.com/97AX8NW8A6/99341/listcontents?column_id=123020&from=0&size=10"];
    NSLog(@"%@",strUrl);

    
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [self dataFinish:manager withUrl:strUrl];
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    
    _tableview.header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(downRefersh)];
    
    _tableview.footer=[MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upRefresh)];

    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
    [btn setBackgroundImage:[UIImage imageNamed:@"module_6944_press"] forState:UIControlStateNormal];
    btn.frame=CGRectMake(0, 0, 30, 30);
    [btn addTarget:self action:@selector(presentLeft) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem=[[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem=leftItem;
}
-(void)presentLeft
{
    AppDelegate *delegate=(AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate.sideMenuViewController presentLeftMenuViewController];
}

-(void)downRefersh
{
    NSString *urlStr=[NSString stringWithFormat:@"http://client-api.dingdone.com/97AX8NW8A6/99341/listcontents?column_id=123020&from=0&size=10"];
    NSLog(@"downRefersh:%@",urlStr);
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.tag=1000;
    [self dataFinish:manager withUrl:urlStr];
}
-(void)upRefresh
{
    NSString *urlStr=  [NSString stringWithFormat:@"http://client-api.dingdone.com/97AX8NW8A6/99341/listcontents?column_id=123020&from=%d&size=10",from];
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
        }
        [self configData:responseObject];
    
        
        [_tableview.header endRefreshing];
        [_tableview.footer endRefreshing];
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
        ShowModel *model=[[ShowModel alloc]init];
        model.Id=[appDic objectForKey:@"id"];
        model.title=[appDic objectForKey:@"title"];
        model.childsData=[appDic objectForKey:@"childsData"];
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
        // NSLog(@"element:%@",model.childsData);
    }

}
-(void)btnClick:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark -tablexiew
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShowModel *model=[_dataArr objectAtIndex:indexPath.row];
    float contentWidth=SCREENW;
    float imageHeight=contentWidth/2;
    float contentHeight=[model.title heightWithFont:[UIFont systemFontOfSize:13] withinWidth:contentWidth];
    return contentHeight+imageHeight+10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShowModel *model=[_dataArr objectAtIndex:indexPath.row];
    
    ShowCell *cell = [tableView dequeueReusableCellWithIdentifier:@"aaa" forIndexPath:indexPath];
    
    // Configure the cell...
    [cell customModel:model];
    
    return cell;
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_tableview deselectRowAtIndexPath:indexPath animated:YES];
    ShowModel *model=[_dataArr objectAtIndex:indexPath.row];
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
