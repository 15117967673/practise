//
//  PSSpecialController.m
//  Dancer
//
//  Created by qianfeng on 15/8/31.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "PSSpecialController.h"
#import "AFNetworking.h"
#import "SpecialModel.h"
#import "PSCollectionView.h"
#import "PSSpecialCell.h"
#import "DanceWebView.h"
#import "MJRefresh.h"
#import "Video.h"
static BOOL isDeviceIPad() {
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 30200
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return YES;
    }
#endif
    return NO;
}

@interface PSSpecialController ()<PSCollectionViewDelegate, PSCollectionViewDataSource>

{
    PSCollectionView *_collectionView;
    
    NSInteger from;
}
@end

@implementation PSSpecialController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor whiteColor];
    from=0;
    _dataArr=[[NSMutableArray alloc]init];
    _collectionView = [[PSCollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREENW, SCREENH)];
    _collectionView.collectionViewDelegate = self;
    _collectionView.collectionViewDataSource = self;
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_collectionView];
    
    
    if (isDeviceIPad()) {
        _collectionView.numColsPortrait = 4;
        _collectionView.numColsLandscape = 5;
    } else {
        _collectionView.numColsPortrait = 2;
        _collectionView.numColsLandscape = 3;
    }
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [self dataFinish:manager withUrl:[NSString stringWithFormat:self.strUrl,0]];
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    
    _collectionView.header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(downRefersh)];
    _collectionView.footer=[MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upRefresh)];
}
-(void)downRefersh
{
    NSString *urlStr=[NSString stringWithFormat:self.strUrl,0];
    NSLog(@"downRefersh:%@",urlStr);
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.tag=1000;
    [self dataFinish:manager withUrl:urlStr];
}
-(void)upRefresh
{
    NSString *urlStr=  [NSString stringWithFormat:self.strUrl,from];
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
       
        [_collectionView.header endRefreshing];
        [_collectionView.footer endRefreshing];
        [_collectionView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

}
-(void)configData:(NSData *)data
{
    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSArray *array=[[dic objectForKey:@"data"]objectForKey:@"listData"];
    for(NSDictionary *appDic in array){
        SpecialModel *model=[[SpecialModel alloc]init];
        model.title=[appDic objectForKey:@"title"];
        model.Id=[appDic objectForKey:@"id"];
        NSLog(@"model.id!!!!!!!!:%d",model.Id.intValue);
        model.childsData=[appDic objectForKey:@"childsData"];
        model.contentUrl=[appDic objectForKey:@"contentUrl"];
        NSDictionary *imageUrl=[appDic objectForKey:@"indexPic"];
        model.dir=[imageUrl objectForKey:@"dir"];
        model.filename=[imageUrl objectForKey:@"filename"];
        model.filepath=[imageUrl objectForKey:@"filepath"];
        model.host=[imageUrl objectForKey:@"host"];
        model.height=[imageUrl objectForKey:@"height"];
        model.width=[imageUrl objectForKey:@"width"];
        [_dataArr addObject:model];
    }

}
#pragma mark - PSCollectionViewDelegate and DataSource

- (NSInteger)numberOfViewsInCollectionView:(PSCollectionView *)collectionView
{
    return [_dataArr count];
}
- (PSCollectionViewCell *)collectionView:(PSCollectionView *)collectionView viewAtIndex:(NSInteger)index
{
    SpecialModel *model = [_dataArr objectAtIndex:index];
    PSSpecialCell *v = (PSSpecialCell *)[_collectionView dequeueReusableView];
    if (!v) {
        v = [[PSSpecialCell alloc] initWithFrame:CGRectZero];
    }
    //填充cell内容
    [v fillViewWithObject:model];
    return v;
}
- (CGFloat)heightForViewAtIndex:(NSInteger)index{
    SpecialModel *model = [_dataArr objectAtIndex:index];
    //cell大小
    return [PSSpecialCell heightForViewWithObject:model inColumnWidth:_collectionView.colWidth];
}

- (void)collectionView:(PSCollectionView *)collectionView didSelectView:(PSCollectionViewCell *)view atIndex:(NSInteger)index
{
    SpecialModel *model=[_dataArr objectAtIndex:index];
//    if(model.childsData.count!=0){
//        //推出新界面 contenturl
//        
//        DanceWebView *webView=[[DanceWebView alloc]init];
//        webView.strUrl=model.contentUrl;
//        NSLog(@"webview:%@",webView.strUrl);
//        [self presentViewController:webView animated:YES completion:nil];
//        
//    }
//    else{
//        //推出新界面
//        NSLog(@"非基本功");
//        Video *dv=[[Video alloc]init];
//        dv.strUrl=[NSString stringWithFormat:@"http://client-api.dingdone.com/97AX8NW8A6/content/%@",model.Id];
//        [self presentViewController:dv animated:YES completion:nil];
//    }
    [self.delegate modelValue:model];
    
}
@end
