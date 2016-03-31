//
//  AViewController.m
//  A513ZhaoNaiXue
//
//  Created by Mac on 15-8-21.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "AViewController.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import "A1Model.h"
#import "A2Model.h"
#import "ADetailViewController.h"
@interface AViewController ()<UIScrollViewDelegate>
{
    NSMutableArray *_dataArr;
    
    UIScrollView *_sv;
    
    NSMutableArray *_dataArr2;
}
@end

@implementation AViewController

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
    // Do any additional setup after loading the view from its nib.
    _dataArr=[[NSMutableArray alloc]init];
    _dataArr2=[[NSMutableArray alloc]init];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"导航背景"] forBarMetrics:0];
    
    
    
    _sv=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 400)];
    _sv.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_sv];
    _sv.contentSize=CGSizeMake(320*10, 400);
    _sv.pagingEnabled=YES;
    _sv.delegate=self;
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
    btn.backgroundColor=[UIColor blackColor];
    btn.frame=CGRectMake(0, 0, 40, 30);
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView=btn;
    
    NSString *strUrl1=@"http://121.41.84.91/HandheldKitchen/api/more/tblcalendaralertinfo!getHomePage.do?phonetype=2&page=1&pageRecord=10&is_traditional=0";
    AFHTTPRequestOperationManager *manager1=[AFHTTPRequestOperationManager manager];
    manager1.responseSerializer=[AFHTTPResponseSerializer serializer];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    [manager1 GET:strUrl1 parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSArray *array=[dic objectForKey:@"data"];
        
        for(NSDictionary *appDic in array){
            A1Model *am1=[[A1Model alloc]init];
            [am1 setValuesForKeysWithDictionary:appDic];
            [_dataArr addObject:am1];
            
            
        }
        [self createUI];
        //NSLog(@"_dataArr:%@",_dataArr);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        NSLog(@"fail");
    }];
    
    NSString *strUrl2=@"http://121.41.84.91/HandheldKitchen/api/more/tblcalendaralertinfo!get.do?year=2015&month=08&day=20&page=1&pageRecord=1&is_traditional=0";
    AFHTTPRequestOperationManager *manager2=[AFHTTPRequestOperationManager manager];
    manager2.responseSerializer=[AFHTTPResponseSerializer serializer];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    [manager2 GET:strUrl2 parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSArray *array=[dic objectForKey:@"data"];
        
        for(NSDictionary *appDic in array){
            A2Model *am2=[[A2Model alloc]init];
            [am2 setValuesForKeysWithDictionary:appDic];
            [_dataArr2 addObject:am2];
            NSLog(@"%@",_dataArr2);
        }
        [self createUI2];
        //NSLog(@"_dataArr:%@",_dataArr);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        NSLog(@"fail");
    }];

    
}
-(void)btnClick:(UIButton *)sender
{
    ADetailViewController *adc=[[ADetailViewController alloc]init];
    [self.navigationController pushViewController:adc animated: YES];
}
-(void)createUI
{
    [self.view sendSubviewToBack:_sv];
    for(int i=0;i<10;i++){
        A1Model *model=[_dataArr objectAtIndex:i];
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0+i*320, 0, 320, 400)];
        [imageView setImageWithURL:[NSURL URLWithString:model.imagePathPortrait]];
        [_sv addSubview:imageView];
        
    }
    
    
}
-(void)createUI2
{
    A2Model *am2=[_dataArr2 objectAtIndex:0];
    _alertInfoAvoidLabel.text=am2.alertInfoAvoid;
    _LunarCalendarLabel.text=am2.LunarCalendar;
    
    _yearLabel.text=[am2.GregorianCalendar substringToIndex:7];
    _dateLabel.text=[am2.GregorianCalendar substringFromIndex:8];
    
    
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
     
    A1Model *am=[_dataArr objectAtIndex:scrollView.contentOffset.x/320];
    _nameLabel.text=am.name;
    _englishNameLable.text=am.englishName;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
