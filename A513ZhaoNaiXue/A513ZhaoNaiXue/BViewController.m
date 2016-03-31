//
//  BViewController.m
//  A513ZhaoNaiXue
//
//  Created by Mac on 15-8-20.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "BViewController.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import "BcollectionCell.h"
#import "XXSModel.h"
#import "XXSTableViewCell.h"
#import "ZhuShiViewController.h"
@interface BViewController ()<UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDataSource,UITableViewDelegate>
{
    UISegmentedControl *segmentedControl;
    UIScrollView *sv;
    
    UICollectionView *_collectionView;
    NSMutableArray *_dataArr;
    
    UITableView *_tableView;
    NSMutableArray *_dataArr2;

}
@end

@implementation BViewController

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
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"导航背景"] forBarMetrics:0];
     segmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"精品汇",@"新鲜事", nil]];
    segmentedControl.frame = CGRectMake(40, 200, 200, 30);
    [segmentedControl addTarget:self action:@selector(segmentedControlClick:) forControlEvents:UIControlEventValueChanged];
    
    _dataArr=[[NSMutableArray alloc]init];
    _dataArr2=[[NSMutableArray alloc]init];
    
    

    self.navigationItem.titleView=segmentedControl;
    self.navigationController.automaticallyAdjustsScrollViewInsets=YES;
    sv = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 390)];
    
    sv.delegate=self;
    sv.pagingEnabled=YES;
    [self.view addSubview:sv];
    
    UICollectionViewFlowLayout *fl=[[UICollectionViewFlowLayout alloc]init];
    fl.scrollDirection=UICollectionViewScrollDirectionVertical;
    _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 320, 390) collectionViewLayout:fl];
    _collectionView.backgroundColor=[UIColor whiteColor];
    _collectionView.dataSource=self;
    _collectionView.delegate=self;
    [sv addSubview:_collectionView];
    [_collectionView registerNib:[UINib nibWithNibName:@"BcollectionCell" bundle:nil] forCellWithReuseIdentifier:@"qqq"];
    
    
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(320, 0, 320, 390)];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [sv addSubview:_tableView];
    [_tableView registerNib:[UINib nibWithNibName:@"XXSTableViewCell" bundle:nil] forCellReuseIdentifier:@"www"];
    sv.contentSize = CGSizeMake(320*2, 0);
    
    NSString *strUrl1=@"http://121.41.117.95/HandheldKitchen/api/found/tblBoutique!getTblBoutiqueTypeList.do?is_traditional=0&phonetype=2&page=1&pageRecord=100";
    AFHTTPRequestOperationManager *manager1=[AFHTTPRequestOperationManager manager];
    manager1.responseSerializer=[AFHTTPResponseSerializer serializer];
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    [manager1 GET:strUrl1 parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSArray *array=[dic objectForKey:@"data"];
        for(NSDictionary *appDic in array){
            BModel *model=[[BModel alloc]init];
            model.name=[appDic objectForKey:@"name"];
            model.imageFilename=[appDic objectForKey:@"imageFilename"];
            model.Id=[appDic objectForKey:@"id"];
            [_dataArr addObject:model];
        }
        [_collectionView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        NSLog(@"fail");
    }];
    
    NSString *strUrl2=@"http://121.40.54.242/HandheldKitchen/api/found/tblFresh!getTblFreshList616.do?is_traditional=0&phonetype=2&page=1&pageRecord=10";
    AFHTTPRequestOperationManager *manager2=[AFHTTPRequestOperationManager manager];
    manager2.responseSerializer=[AFHTTPResponseSerializer serializer];
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    [manager2 GET:strUrl2 parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSArray *array=[dic objectForKey:@"data"];
        for(NSDictionary *appDic in array){
            XXSModel *model=[[XXSModel alloc]init];
            model.name=[appDic objectForKey:@"name"];
            model.titleImageFile=[appDic objectForKey:@"titleImageFile"];
            model.content=[appDic objectForKey:@"content"];
            [_dataArr2 addObject:model];
        }
        [_tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        NSLog(@"fail");
    }];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    BcollectionCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"qqq" forIndexPath:indexPath];
    BModel *model=[_dataArr objectAtIndex:indexPath.row];
    
    [cell customModel:model];
    
    
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 160);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    BModel *model=[_dataArr objectAtIndex:indexPath.row];
    ZhuShiViewController *zvc=[[ZhuShiViewController alloc]init];
    zvc.modelId=model.Id;
    zvc.name=model.name;
    NSLog(@"name==%@",model.name);
    zvc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:zvc animated:YES];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  _dataArr2.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XXSTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"www" forIndexPath:indexPath];
    XXSModel *model=[_dataArr2 objectAtIndex:indexPath.row];
    [cell customModel:model];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XXSModel *model=[_dataArr2 objectAtIndex:indexPath.row];
    NSLog(@"model,name:%@",model.name);
}
-(void)segmentedControlClick:(UISegmentedControl *)sc
{
    if(sc.selectedSegmentIndex==0){
        CGPoint off=sv.contentOffset;
        off.x=0;
        sv.contentOffset=off;
    }else{
        CGPoint off=sv.contentOffset;
        off.x=320;
        sv.contentOffset=off;
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    segmentedControl.selectedSegmentIndex=sv.contentOffset.x/320;
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
