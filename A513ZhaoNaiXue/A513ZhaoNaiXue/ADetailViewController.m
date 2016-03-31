//
//  ADetailViewController.m
//  A513ZhaoNaiXue
//
//  Created by Mac on 15-8-21.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "ADetailViewController.h"
#import "GDataXMLNode.h"
#import "MyView.h"
#import "VegCell.h"
#import "VegModel.h"
#import "BtnCell.h"
@interface ADetailViewController ()<UIScrollViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    NSMutableArray *_dataArr;
    NSMutableArray *_headerArr;
    UIScrollView *_sv;
    NSMutableArray*_btnArr;
    UICollectionView *_btnView;
   // NSInteger j;
}
@end

@implementation ADetailViewController

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
    _dataArr=[[NSMutableArray alloc]init];
    _headerArr=[[NSMutableArray alloc]init];
    _btnArr=[[NSMutableArray alloc]init];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"material" ofType:@"xml"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    GDataXMLDocument *document = [[GDataXMLDocument alloc] initWithData:data options:0 error:nil];
    GDataXMLElement *entity=[[document.rootElement elementsForName:@"entity"]lastObject];
    NSArray *tblMmaterialTypeArr=[entity elementsForName:@"tblMmaterialType"];
    for(GDataXMLElement *tblMmaterialType in tblMmaterialTypeArr){
        NSString *typeName=[[[tblMmaterialType elementsForName:@"name"]lastObject]stringValue];
        [_headerArr addObject:typeName];
        NSArray *tblMaterialArr=[tblMmaterialType elementsForName:@"tblMaterial"];
        NSMutableArray *array=[[NSMutableArray alloc]init];
        for(GDataXMLElement *tblMaterial in tblMaterialArr){
            VegModel *model=[[VegModel alloc]init];
            model.name=[[[tblMaterial elementsForName:@"name"]lastObject]stringValue];
            model.imageFilename=[[[tblMaterial elementsForName:@"imageFilename"]lastObject]stringValue];
            [array addObject:model];
        }
        [_dataArr addObject:array];
    }

    _sv=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 100, 320, 300)];
    _sv.pagingEnabled=YES;
    _sv.contentSize=CGSizeMake(160*15,300);
    [self.view addSubview:_sv];
    for(int i=0;i<15;i++){
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
        //设置滚动方向（默认就是垂直方向）
        layout.scrollDirection=UICollectionViewScrollDirectionVertical;
        //创建网格视图（必须有一个flowlayout对象）
        UICollectionView *collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0+i*160, 0, 160, 300) collectionViewLayout:layout];
        collectionView.backgroundColor=[UIColor whiteColor];
        collectionView.tag=1000+i;
        collectionView.dataSource=self;
        collectionView.delegate=self;
        [_sv addSubview:collectionView];
        [collectionView registerNib:[UINib nibWithNibName:@"VegCell" bundle:nil] forCellWithReuseIdentifier:[NSString stringWithFormat:@"qq%d",i]];
        [collectionView registerClass:[MyView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[NSString stringWithFormat:@"ww%d",i]];
    }
    UICollectionViewFlowLayout *lt=[[UICollectionViewFlowLayout alloc]init];
    //设置滚动方向（默认就是垂直方向）
    lt.scrollDirection=UICollectionViewScrollDirectionVertical;
    //创建网格视图（必须有一个flowlayout对象）
    _btnView=[[UICollectionView alloc]initWithFrame:CGRectMake(0 , 0, 320, 70) collectionViewLayout:lt];
    _btnView.backgroundColor=[UIColor yellowColor];
    
    _btnView.dataSource=self;
    _btnView.delegate=self;
    [self.view addSubview:_btnView];
    
    [_btnView registerNib:[UINib nibWithNibName:@"BtnCell" bundle:nil] forCellWithReuseIdentifier:@"qqq"];
 
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    for(int i=0;i<15;i++){
//        UICollectionView *collctionView1=(UICollectionView *)[self.view viewWithTag:1000+i];
//        if(collctionView1==collectionView){
//           VegModel *model=[[_dataArr objectAtIndex:i]objectAtIndex:indexPath.row];
//           [_btnArr addObject:model.name];
//           [_btnView reloadData];
//        }
//    }
      VegModel *model=[[_dataArr objectAtIndex:collectionView.tag-1000]objectAtIndex:indexPath.row];
     [_btnArr addObject:model.name];
     [_btnView reloadData];

    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if(_btnView==collectionView){
        return 0;
    }
    for(int i=0;i<[_headerArr count];i++){
       UICollectionView *collctionView1=(UICollectionView *)[self.view viewWithTag:1000+i];
        if(collctionView1==collectionView){
            return 1;
        }
    }
    
    return 0;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{//每段的行数
    NSInteger a;
    if(_btnView==collectionView){
        return _btnArr.count;
    }

    for(int i=0;i<[_dataArr count];i++){
       UICollectionView *collctionView1=(UICollectionView *)[self.view viewWithTag:1000+i];
        if(collctionView1==collectionView){
            a=[[_dataArr objectAtIndex:i]count];
            return a;
        }
    }
        return 0;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    if(_btnView==collectionView){
        NSLog(@"!!!!!!!!!");
        BtnCell *cell1=[collectionView dequeueReusableCellWithReuseIdentifier:@"qqq" forIndexPath:indexPath];
        NSString *str=[_btnArr objectAtIndex:indexPath.row];
        NSLog(@"str:%@",str);
        cell1.nameLabe.text=str;
        return cell1;
    }

    for(int i=0;i<[_dataArr count];i++){
        UICollectionView *collctionView1=(UICollectionView *)[self.view viewWithTag:1000+i];
        if(collctionView1==collectionView){
            VegCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:[NSString stringWithFormat:@"qq%d",i] forIndexPath:indexPath];
            VegModel *model=[[_dataArr objectAtIndex:i]objectAtIndex:indexPath.row];
            //NSLog(@"model.name:%@",model.name);
            [cell customModel:model];
            return cell;
        }
    }
    return nil;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{//设置单个cell的大小
    if(_btnView==collectionView){
        return CGSizeMake(80, 30);
    }
    else
        return CGSizeMake(70,90);
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    MyView *view;
    for(int i=0;i<[_headerArr count];i++){
      UICollectionView *collctionView1=(UICollectionView *)[self.view viewWithTag:1000+i];
        if(collctionView1==collectionView){
           view=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[NSString stringWithFormat:@"ww%d",i] forIndexPath:indexPath];
           view.label.text= [_headerArr objectAtIndex:i];
        }
    }
    return view;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{//设置段头的大小，（如果collectionView是垂直方向滑动，那么段头宽度会被忽略，系统会自动把段头宽度处理成colletionView的宽度）
    return CGSizeMake(30, 30);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{//设置分段上左下右的边距
    return UIEdgeInsetsMake(5, 5, 5, 5);
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
