//
//  CViewController.m
//  A513ZhaoNaiXue
//
//  Created by Mac on 15-8-20.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "CViewController.h"
#import "AFNetworking.h"
#import "CRowModel.h"
#import "AllModel.h"
#import "MyCollectionViewCell.h"
#import "MyView.h"
@interface CViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UITableView *_tableView;
    NSMutableArray *_dataArr;
    NSMutableArray *_closeArr;
    NSMutableArray *_headerArr;
    
    NSMutableArray *_allDataArr;
    
    UICollectionView *_collectionView;
    
    NSString *_url;
}

@end

@implementation CViewController

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
    self.navigationController.automaticallyAdjustsScrollViewInsets=NO;
    self.navigationItem.title=@"卖汤汤";
    _dataArr=[[NSMutableArray alloc]init];
    _headerArr=[[NSMutableArray alloc]init];
    _closeArr=[[NSMutableArray alloc]init];
    _allDataArr=[[NSMutableArray alloc]init];
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 100, 480)];
    
    _tableView.dataSource=self;
    _tableView.delegate=self;
    [self.view addSubview:_tableView];
    
    UICollectionViewFlowLayout *fl=[[UICollectionViewFlowLayout alloc]init];
    fl.scrollDirection=UICollectionViewScrollDirectionVertical;
    _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(102, 0, 216, 480) collectionViewLayout:fl];
    _collectionView.backgroundColor=[UIColor whiteColor];
    _collectionView.dataSource=self;
    _collectionView.delegate=self;
        [self.view addSubview:_collectionView];
     [_collectionView registerNib:[UINib nibWithNibName:@"MyCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"qqq"];
   // [_collectionView registerClass:[MyView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"www"];
    
    NSString *strUrl=@"http://121.40.54.242/HandheldKitchen/api/more/hotwater!getHotwaterClass.do?is_traditional=0";
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    [manager GET:strUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSArray *array=[dic objectForKey:@"data"];
        for(NSDictionary *dic in array){
            NSString *strName=[dic objectForKey:@"name"];
            [_headerArr addObject:strName];
            //NSLog(@"_header:%@",_headerArr);
            NSMutableArray *rowArr=[[NSMutableArray alloc]init];
            
            for(NSDictionary *rowDic in [dic objectForKey:@"hotwater"]){
                CRowModel *cm=[[CRowModel alloc]init];
                cm.name =[rowDic objectForKey:@"name"];
                cm.Id=[rowDic objectForKey:@"id"];
                [rowArr addObject:cm];
                NSLog(@"cm.name:%@",cm.name);
                
                
            }
           [_dataArr addObject:rowArr];
           [_closeArr addObject:[NSNumber numberWithBool:YES]];
            
        }
        [_tableView reloadData];
        // NSLog(@"%@",_dataArr);
        //NSLog(@"hhhh:%d",_headerArr.count);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        NSLog(@"fail");
    }];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   
    return _headerArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([[_closeArr objectAtIndex:section] boolValue]) {
        return 0;
    }
    return [[_dataArr objectAtIndex:section] count];

}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:[_headerArr objectAtIndex:section] forState:UIControlStateNormal];
    btn.tag=section+100;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
-(void)btnClick:(UIButton *)sender
{
    BOOL isClose = [[_closeArr objectAtIndex:sender.tag-100] boolValue];
    
    
    [_closeArr replaceObjectAtIndex:sender.tag-100 withObject:[NSNumber numberWithBool:!isClose]];
    
    
    [_tableView reloadSections:[NSIndexSet indexSetWithIndex:sender.tag-100] withRowAnimation:UITableViewRowAnimationBottom];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"qqq"];
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:0 reuseIdentifier:@"qqq"];
    }
    CRowModel *cm=[[_dataArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    cell.textLabel.text=cm.name;
    cell.textLabel.font=[UIFont systemFontOfSize:15];
    //NSLog(@"[_dataArr objectAtIndex:indexPath.section]:%@",[_dataArr objectAtIndex:indexPath.section]);
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CRowModel *cm=[[_dataArr objectAtIndex:indexPath.section ]objectAtIndex:indexPath.row];
    NSLog(@"cm.model:%@",cm.name);
    if([cm.name isEqualToString:@"全部"] ){
        _url=[NSString stringWithFormat:@"http://121.40.54.242/HandheldKitchen/api/more/hotwater!getHotwaterList.do?is_traditional=0&page=1&pageRecord=10&id=%@",cm.Id];
        //NSLog(@"_url:%@",_url);
        if(_allDataArr){
            [_allDataArr removeAllObjects];
        }
        [self WebGet:_url];
    }
   // [_collectionView reloadData];
    
}
-(void)WebGet:(NSString *)strUrl
{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    [manager GET:strUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSArray *array=[dic objectForKey:@"data"];
        for(NSDictionary *appDic in array){
            AllModel *am=[[AllModel alloc]init];
            am.imageFilename=[appDic objectForKey:@"imageFilename"];
            am.name=[appDic objectForKey:@"name"];
            [_allDataArr addObject:am];
            //NSLog(@"am==========%@",am);
        }
      [_collectionView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
    }];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _allDataArr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    

    MyCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"qqq" forIndexPath:indexPath];
    AllModel *model=[_allDataArr objectAtIndex:indexPath.row];
    [cell customModel:model];
    return cell;
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    AllModel *am=[_allDataArr objectAtIndex:indexPath.row];
    NSLog(@"am.name:%@",am.name);
}
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//    MyView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"www" forIndexPath:indexPath];
//    
//    return view;
//}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 120);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(2, 2, 2, 2);
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
