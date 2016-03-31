//
//  HomeViewController.m
//  A1CollectionView
//
//  Created by Mac on 15-8-8.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "HomeViewController.h"
#import "MyCell.h"
#import "MyView.h"
@interface HomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionView;
}

@end

@implementation HomeViewController

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
    //网格视图需要一个布局来支撑自己
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
    //设置滚动方向（默认就是垂直方向）
    layout.scrollDirection=UICollectionViewScrollDirectionVertical;
    //创建网格视图（必须有一个flowlayout对象）
    _collectionView=[[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout];
    _collectionView.backgroundColor=[UIColor brownColor];
    
    _collectionView.dataSource=self;
    _collectionView.delegate=self;
    [self.view addSubview:_collectionView];
    //注册cell
    [_collectionView registerClass:[MyCell class] forCellWithReuseIdentifier:@"qqq"];
    //注册段头
    [_collectionView registerClass:[MyView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"www"];
}
#pragma mark -collectionView
//设置分段数量
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{//每段的行数
    return 30;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //网格视图的cell必须提前注册
    MyCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"qqq" forIndexPath:indexPath];
    cell.label.text=[NSString stringWithFormat:@"第%d个",indexPath.row];
    cell.iconView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",indexPath.row]];
    return cell;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{//设置单个cell的大小
    return CGSizeMake(70,170);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    //设置分段内部cell行行的最小距离，滚动方向的间距
    return 10;
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{//设置cell列烈之间最小的间隔，默认10 与滚动方向相反的间距
    return 10;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{//设置分段上左下右的边距
    return UIEdgeInsetsMake(10, 0, 0, 0);
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{//设置段头或段尾
    /*//判断响应这个方法的是段头还是段尾
    if (kind==UICollectionElementKindSectionHeader) {
     
    } else {
        
     
    }
     */
    //设置段头或段尾也需要提前注册
    MyView *view=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"www" forIndexPath:indexPath];
    
    view.label.text=[NSString stringWithFormat:@"第%d段",indexPath.section];
    return view;
    
    
    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{//设置段头的大小，（如果collectionView是垂直方向滑动，那么宽度会被忽略，系统会自动把宽度处理成collectionView的宽度）
    return CGSizeMake(0, 30);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%zd==%zd",indexPath.row,indexPath.section);
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
