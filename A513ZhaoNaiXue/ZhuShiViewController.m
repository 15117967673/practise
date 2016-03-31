//
//  ZhuShiViewController.m
//  A513ZhaoNaiXue
//
//  Created by Mac on 15-8-20.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "ZhuShiViewController.h"
#import "AFNetworking.h"
#import "ZhuShiModel.h"
#import "ZhuShiCell.h"
#import "MJRefresh.h"
@interface ZhuShiViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionView;
    NSMutableArray *_dataArr;
    
    NSInteger _page;
}

@end

@implementation ZhuShiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.title=self.name;
    self.automaticallyAdjustsScrollViewInsets=NO;
    _page=2;
    _dataArr=[[NSMutableArray alloc]init];
    UICollectionViewFlowLayout *fl=[[UICollectionViewFlowLayout alloc]init];
    fl.scrollDirection=UICollectionViewScrollDirectionVertical;
    
    _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 320, 440) collectionViewLayout:fl];
    _collectionView.backgroundColor=[UIColor whiteColor];
    _collectionView.dataSource=self;
    _collectionView.delegate=self;
    [self.view addSubview:_collectionView];
    [_collectionView registerNib:[UINib nibWithNibName:@"ZhuShiCell" bundle:nil] forCellWithReuseIdentifier:@"qqq"];

    
    NSString *urlStr= [NSString stringWithFormat:@"http://121.40.54.242/HandheldKitchen/api/found/tblBoutique!getTblBoutiqueVegetableList.do?is_traditional=0&phonetype=2&page=1&pageRecord=10&user_id=0&typeId=%@",_modelId];
    NSLog(@"url:==%@",urlStr);
    //NSLog(@"asjhfcghbfjhbj:%@",urlStr);
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [self dataFinish:manager withUrl:urlStr];
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    
    [_collectionView addHeaderWithTarget:self action:@selector(downRefersh)];
    
    [_collectionView addFooterWithTarget:self action:@selector(upRefresh)];
    
   // [self readLocalData];
    
    
}
//-(void)writeToLocalWithData:(NSData *)data
//{
//    NSString *path=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/0709.txt"];
//    
//    [data writeToFile:path atomically:YES];
//}
//-(void)readLocalData
//{
//    NSString *path=[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/0709.txt"];
//    
//    //判断文件是否存在
//    if([[NSFileManager defaultManager]fileExistsAtPath:path]){
//        [self configData:[NSData dataWithContentsOfFile:path]];
//    }else{
//        NSLog(@"文件不存在");
//    }
//}
-(void)downRefersh
{
    NSString *urlStr=[NSString stringWithFormat:@"http://121.40.54.242/HandheldKitchen/api/found/tblBoutique!getTblBoutiqueVegetableList.do?is_traditional=0&phonetype=2&page=1&pageRecord=10&user_id=0&typeId=%@",_modelId];
    NSLog(@"downRefersh:%@",urlStr);
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.tag=1000;
    [self dataFinish:manager withUrl:urlStr];
}
-(void)upRefresh
{
    NSString *urlStr=  [NSString stringWithFormat:@"http://121.40.54.242/HandheldKitchen/api/found/tblBoutique!getTblBoutiqueVegetableList.do?is_traditional=0&phonetype=2&page=%d&pageRecord=10&user_id=0&typeId=%@",_page, _modelId];
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
            _page=2;
            //把数据写入文件
            //[self writeToLocalWithData:responseObject];
        }else{
            _page++;
        }
        [self configData:responseObject];
        [_collectionView reloadData];
        
        [_collectionView headerEndRefreshing];
        [_collectionView footerEndRefreshing];
        [_collectionView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        NSLog(@"fail");
    }];

}
-(void)configData:(NSData *)data
{

    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSArray *array=[dic objectForKey:@"data"];
    for(NSDictionary *appDic in array){
        ZhuShiModel *model=[[ZhuShiModel alloc]init];
        model.name=[appDic objectForKey:@"name"];
        model.magePathThumbnails=[appDic objectForKey:@"imagePathThumbnails"];
        
        [_dataArr addObject:model];
    }

}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZhuShiCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"qqq" forIndexPath:indexPath];
    ZhuShiModel *model=[_dataArr objectAtIndex:indexPath.row];
    
    [cell customModel:model];
    
    
    
    
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{//设置单个cell的大小
    return CGSizeMake(150, 160);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZhuShiModel *model=[_dataArr objectAtIndex:indexPath.row];
    NSLog(@"model.name=%@",model.name);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
