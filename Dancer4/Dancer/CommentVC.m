//
//  CommentVC.m
//  Dancer
//
//  Created by qianfeng on 15/8/29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "CommentVC.h"
#import "AFNetworking.h"
#import "CommentModel.h"
#import "CommentCell.h"
#import "CommentTopCell.h"
#import "TopModel.h"
#import "UIImageView+AFNetworking.h"
#import "MJRefresh.h"
#import "UIViewAdditions.h"
#import "NSString+Frame.h"
#import "ImageFrameView.h"
#import "PhotoViewController.h"
#import "AppDelegate.h"
@interface CommentVC ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableview;
    NSMutableArray *_dataArr;
    
    TopModel *_topModel;
    
    NSInteger start;
    
    NSInteger flag;
    
    CGSize size;
}
@end

@implementation CommentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     self.automaticallyAdjustsScrollViewInsets=NO;
    self.view.backgroundColor=[UIColor whiteColor];
    start=20;
    flag=0;
    _dataArr=[[NSMutableArray alloc]init];
   // self.navigationController.navigationBarHidden=YES;
    _tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width,self.view.frame.size.height-49-64)];
    _tableview.dataSource=self;
    _tableview.delegate=self;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableview];
    [_tableview registerNib:[UINib nibWithNibName:@"CommentCell" bundle:nil] forCellReuseIdentifier:@"aaa"];
    [_tableview registerNib:[UINib nibWithNibName:@"CommentTopCell" bundle:nil] forCellReuseIdentifier:@"bbb"];
    
    

    
    NSString *strUrl=[NSString stringWithFormat:@"http://client-api.dingdone.com/97AX8NW8A6/seekhelp/949/latest_comment?&start=0&count=20"];
    
    NSLog(@"begin:%@",strUrl);
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [self dataFinish:manager withUrl:strUrl];
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    
    _tableview.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(downRefersh)];
    
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
    NSString *urlStr=[NSString stringWithFormat:@"http://client-api.dingdone.com/97AX8NW8A6/seekhelp/949/latest_comment?&start=0&count=20"];
    NSLog(@"downRefersh:%@",urlStr);
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.tag=1000;
    [self dataFinish:manager withUrl:urlStr];
    flag=0;
}
-(void)upRefresh
{
    NSString *urlStr=  [NSString stringWithFormat:@"http://client-api.dingdone.com/97AX8NW8A6/seekhelp/949/latest_comment?&start=%d&count=20",start];
    NSLog(@"upRefresh:%@",urlStr);
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.tag=1001;
    [self dataFinish:manager withUrl:urlStr];
}

#pragma mark - getUrl
-(void)dataFinish:(AFHTTPRequestOperationManager *)manager withUrl:(NSString *)urlStr
{
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        if(manager.tag==1000){
            [_dataArr removeAllObjects];
            start=20;
            //把数据写入文件
            //[self writeToLocalWithData:responseObject];
        }else{
            start+=20;
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
    NSLog(@"dic:%@",dic);
    NSDictionary *dicData=[dic objectForKey:@"data"];
    //if(flag==0){
      //  flag=1;
       CommentModel *topModel=[[CommentModel alloc]init];
       topModel.topTitle=[dicData objectForKey:@"name"];
       topModel.topicCount=[NSString stringWithFormat:@"话题%@",[dicData objectForKey:@"seekhelpTotal"] ];
       NSDictionary *avatarDic=[dicData objectForKey:@"avatar"];
       topModel.iconHost= [avatarDic objectForKey:@"host"];
       topModel.iconDir= [avatarDic objectForKey:@"dir"];
       topModel.iconFillPath=[avatarDic objectForKey:@"filepath"];
       topModel.iconFilename=[avatarDic objectForKey:@"filename"];
       NSDictionary *backgroundDic=[dicData objectForKey:@"background"];
       topModel.backHost=[backgroundDic objectForKey:@"host"];
       topModel.backDir=[backgroundDic objectForKey:@"dir"];
       topModel.backFillPath=[backgroundDic objectForKey:@"filepath"];
       topModel.backFilename=[backgroundDic objectForKey:@"filename"];
       [_dataArr addObject:topModel];
   // }
    NSArray *array=[dicData objectForKey:@"content"];
    for(NSDictionary *contentDic in array){
        CommentModel *model=[[CommentModel alloc]init];
        NSDictionary *imageUrl=[contentDic objectForKey:@"memberAvatar"];
        model.dir=[imageUrl objectForKey:@"dir"];
        model.filename=[imageUrl objectForKey:@"filename"];
        model.filepath=[imageUrl objectForKey:@"filepath"];
        model.host=[imageUrl objectForKey:@"host"];
        NSArray *contentImageArr=[contentDic objectForKey:@"contentImage"];
        
        for(NSDictionary *contentImageDic in contentImageArr){
            NSString *contentImageUrl=[NSString stringWithFormat:@"%@%@%@%@",[contentImageDic objectForKey:@"host"],[contentImageDic objectForKey:@"dir"],[contentImageDic objectForKey:@"filepath"],[contentImageDic objectForKey:@"filename"]];
            [model.imageArr addObject:contentImageUrl];
        }
       // NSLog(@"model.imageArr:%@",model.imageArr);
        NSString *content=[contentDic objectForKey:@"content"];
        if(![content isKindOfClass:[NSNull class]]){
            model.content=[contentDic objectForKey:@"content"];
        }
        model.memberName=[contentDic objectForKey:@"memberName"];
        model.createTime=[contentDic objectForKey:@"createTime"];
        model.commentNum=[contentDic objectForKey:@"commentNum"];
        [_dataArr addObject: model];
    }
}
#pragma mark - tableview
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0){
        
        return SCREENW/20*9;;
    }
    CommentModel *model=[_dataArr objectAtIndex:indexPath.row];

    
    float contentWidth = _tableview.frame.size.width - 20;
    float contentHeight = [model.content heightWithFont:[UIFont systemFontOfSize:12] withinWidth:contentWidth];
    float imageFrameHeight = [ImageFrameView contentHeightWithImages:model.imageArr withinWidth:contentWidth];
    NSRange range=[model.content rangeOfString:@"<div"];
    if(range.location!=NSNotFound){
        NSString *str=[model.content substringToIndex:range.location];
        model.content=str;
        if([model.content isEqualToString:@""]){
            contentHeight=floor(0.0);
            return 236-130+contentHeight+imageFrameHeight;
        }else{
            
            contentHeight = [model.content heightWithFont:[UIFont systemFontOfSize:12] withinWidth:contentWidth];
            return 236-130+contentHeight+imageFrameHeight;
        }
        
    }else{
       // _content.text=model.content;
        if([model.content isEqualToString:@""]){
            contentHeight=floor(0.0);
            return 236-130+contentHeight+imageFrameHeight;
        }else{
            
            contentHeight = [model.content heightWithFont:[UIFont systemFontOfSize:12] withinWidth:contentWidth];
            return 236-130+contentHeight+imageFrameHeight;
        }
    }
    return 236-130+contentHeight+imageFrameHeight;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        if(indexPath.row==0){
        CommentModel *topModel=[_dataArr objectAtIndex:indexPath.row];
        CommentTopCell *topcell=[tableView dequeueReusableCellWithIdentifier:@"bbb" forIndexPath:indexPath];
        [topcell customModel:topModel];
        return topcell;
    }
    CommentCell *cell=[tableView dequeueReusableCellWithIdentifier:@"aaa" forIndexPath:indexPath];
    CommentModel *model=[_dataArr objectAtIndex:indexPath.row];
    cell.model=model;
    
    for (UIImageView * imageView in cell.imageFrameView.imageViewArray) {
        UITapGestureRecognizer * gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewClicked:)];
        [imageView addGestureRecognizer:gesture];
        imageView.userInteractionEnabled = YES;
    }

    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [_tableview deselectRowAtIndexPath:indexPath animated:YES];
   
}
- (void) imageViewClicked: (UITapGestureRecognizer *) gesture
{
   
    UIImageView * imageView = (UIImageView *)gesture.view;
    ImageFrameView * imageFrameView = (ImageFrameView *) imageView.superview;
    NSIndexPath * indexPath = [self findIndexPathByView:imageFrameView];
   
        CommentModel *model = (CommentModel *)[_dataArr objectAtIndex:indexPath.row];

    
   
    NSInteger index = [imageFrameView.imageViewArray indexOfObject:imageView];
    
    PhotoViewController *pvc=[[PhotoViewController alloc]init];
    
    pvc.urlArray=model.imageArr;
    pvc.index=index;
 
    [self presentViewController:pvc animated:YES completion:nil];
  
    
}
- (NSIndexPath *) findIndexPathByView: (UIView *) view
{
    UIView * contentView = view.superview;
   

    NSArray * indexPathArray = [_tableview indexPathsForVisibleRows];
    
    for (NSIndexPath * indexPath in indexPathArray) {
        
            UITableViewCell * cell = [_tableview cellForRowAtIndexPath:indexPath];
        
            if (cell.contentView==contentView) {
               
                return indexPath;
            }
        
    }
    
    return nil;
}



@end
