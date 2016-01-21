//
//  RecommendVC.m
//  Dancer
//
//  Created by qianfeng on 15/8/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "RecommendVC.h"
#import "AFNetworking.h"
#import "RecommendCell.h"
#import "RecommendModel.h"
#import "DanceVedio.h"
#import "DanceWebView.h"
#import "NSString+Frame.h"
#import "AppDelegate.h"
@interface RecommendVC ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableview;
    NSMutableArray *_dataArr;
}
@end

@implementation RecommendVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.view.backgroundColor=[UIColor redColor];
    self.view.backgroundColor=[UIColor whiteColor];
    _dataArr=[[NSMutableArray alloc]init];
    _tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _tableview.dataSource=self;
    _tableview.delegate=self;
    [self.view addSubview:_tableview];
    [_tableview registerNib:[UINib nibWithNibName:@"RecommendCell" bundle:nil] forCellReuseIdentifier:@"aaa"];

    NSString *strUrl=@"http://client-api.dingdone.com/97AX8NW8A6/97AX8NW8A6/99340/listcontents";
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manager GET:strUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSDictionary *appDic=[[dic objectForKey:@"data"]objectForKey:@"compData"];
        NSArray *arr1=[appDic objectForKey:@"20546"];
        for(NSDictionary *appDic11 in arr1){
            RecommendModel *model=[[RecommendModel alloc]init];
            model.title=[appDic11 objectForKey:@"title"];
            model.Id=[appDic11 objectForKey:@"id"];
            NSLog(@"model.idcommmmmm%d",model.Id.intValue);
            model.childsData=[appDic11 objectForKey:@"childsData"];
            NSDictionary *imageUrl=[appDic11 objectForKey:@"indexPic"];
            model.dir=[imageUrl objectForKey:@"dir"];
            model.filename=[imageUrl objectForKey:@"filename"];
            model.filepath=[imageUrl objectForKey:@"filepath"];
            model.host=[imageUrl objectForKey:@"host"];
            NSDictionary *click=[appDic11 objectForKey:@"extendValues"];
            model.clickNum=[click objectForKey:@"clickNum"];
            model.contentUrl=[appDic objectForKey:@"contentUrl"];
            [_dataArr addObject:model];
        }
        NSArray *arr2=[appDic objectForKey:@"20570"];
        for(NSDictionary *appDic12 in arr2){
            RecommendModel *model=[[RecommendModel alloc]init];
            model.title=[appDic12 objectForKey:@"title"];
            model.Id=[appDic12 objectForKey:@"id"];
            model.childsData=[appDic12 objectForKey:@"childsData"];
            NSDictionary *imageUrl=[appDic12 objectForKey:@"indexPic"];
            model.dir=[imageUrl objectForKey:@"dir"];
            model.filename=[imageUrl objectForKey:@"filename"];
            model.filepath=[imageUrl objectForKey:@"filepath"];
            model.host=[imageUrl objectForKey:@"host"];
            NSDictionary *click=[appDic12 objectForKey:@"extendValues"];
            model.clickNum=[click objectForKey:@"clickNum"];
            model.contentUrl=[appDic objectForKey:@"contentUrl"];
            [_dataArr addObject:model];
        }
      [_tableview reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"fail");
    }];
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
     RecommendModel *model=[_dataArr objectAtIndex:indexPath.row];
    float contentWidth=SCREENW-20;
    float imageHeight=contentWidth/2;
    float contentHeight=[model.title heightWithFont:[UIFont systemFontOfSize:15] withinWidth:contentWidth];
    return 220-36+contentHeight-150+imageHeight;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecommendCell *cell=[tableView dequeueReusableCellWithIdentifier:@"aaa" forIndexPath:indexPath];
    RecommendModel *model=[_dataArr objectAtIndex:indexPath.row];
    [cell customModel:model];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_tableview deselectRowAtIndexPath:indexPath animated:YES];
    RecommendModel *model=[_dataArr objectAtIndex:indexPath.row];
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
