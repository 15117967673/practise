//
//  ViewController.m
//  DBTableView
//
//  Created by Mac on 15-8-11.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "Model.h"
#import "MyTableViewCell.h"
#import "DatabaseManager.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_myTableView;
    
    NSMutableArray *_dataArr;
    
    NSInteger _page;
    
    NSMutableArray *_pageArr;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    {
//        credit = 70;
//        experience = 60;
//        friendnum = 0;
//        groupid = 0;
//        headimage = "/my/headimage.php?uid=129063";
//        lastactivity = 0;
//        realname = "";
//        uid = 129063;
//        username = sz15121004;
//        viewnum = 0;
//    },
    _page=1;
    _pageArr=[[NSMutableArray alloc]init];
       NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
    NSArray *array=[ud objectForKey:@"aaa"];
    if(!array){
        NSNumber *page=@(_page);
        [_pageArr addObject:page];

        [ud setObject:_pageArr forKey:@"aaa"];
        [ud synchronize];
    }
    
    
    UIButton *btn1=[UIButton buttonWithType:UIButtonTypeSystem];
    btn1.frame=CGRectMake(0, 0, 30, 30);
    [btn1 setTitle:@"前" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btnClickAfter:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *Item1=[[UIBarButtonItem alloc]initWithCustomView:btn1];
    
    UIButton *btn2=[UIButton buttonWithType:UIButtonTypeSystem];
    btn2.frame=CGRectMake(0, 0, 30, 30);
    [btn2 setTitle:@"后" forState:UIControlStateNormal];
    UIBarButtonItem *Item2=[[UIBarButtonItem alloc]initWithCustomView:btn2];
    [btn2 addTarget:self action:@selector(btnClickFront:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItems=[NSArray arrayWithObjects:Item2,Item1, nil];
    
    _dataArr=[[NSMutableArray alloc]init];
    
    _dataArr.array = [[DatabaseManager defaultManager] selectAllModel:_page];
    
    _myTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, 320, self.view.frame.size.height)];
    _myTableView.delegate=self;
    _myTableView.dataSource=self;
    [self.view addSubview:_myTableView];
    [_myTableView registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:nil] forCellReuseIdentifier:@"qqq"];
    
    NSString *urlStr=[NSString stringWithFormat:@"http://10.0.8.8/sns/my/user_list.php?page=%d&number=4",_page ] ;
    [self netRequest:urlStr];
}
-(void)netRequest:(NSString *)urlStr
{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSArray *array=[dic objectForKey:@"users"];
        for(NSDictionary *appDic in array){
            Model *model=[[Model alloc]init];
            model.headimage=[appDic objectForKey:@"headimage"];
            //NSLog(@"model.headimage%@",model.headimage);
            model.uid=[appDic objectForKey:@"uid"];
            model.username=[appDic objectForKey:@"username"];
            model.lastactivity=[appDic objectForKey:@"lastactivity"];
//            for(Model *am in _dataArr.array){
//            
//            }
            [[DatabaseManager defaultManager] insertDataWithModel:model];
            [_dataArr addObject:model];
        }
        [_myTableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        NSLog(@"加载网络失败");
       
    }];

}
#pragma mark -btnClick
-(void)btnClickFront:(UIButton *)sender
{
     
   [_dataArr removeAllObjects];
    
    _page++;
    NSLog(@"page====%d",_page);
    NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
    NSArray *arr=[ud objectForKey:@"aaa"];
    if(![arr containsObject:@(_page)]){
        NSNumber *p=@(_page);
        [_pageArr addObject:p];
        [ud setObject:_pageArr forKey:@"aaa"];
        [ud synchronize];
        NSString *urlStr=[NSString stringWithFormat:@"http://10.0.8.8/sns/my/user_list.php?page=%d&number=4",_page];
        [self netRequest:urlStr];
        NSLog(@"走网了");
    }else{
        _dataArr.array = [[DatabaseManager defaultManager] selectAllModel:_page];
        NSLog(@"没走网络");
        [_myTableView reloadData];
    }
    
    
    NSLog(@"======%d",_page);
   [_myTableView reloadData];

}
-(void)btnClickAfter:(UIButton *)sender
{
    
   [_dataArr removeAllObjects];
    _page--;
    NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
    NSArray *arr=[ud objectForKey:@"aaa"];
    if(![arr containsObject:@(_page)]){
        NSNumber *p=@(_page);
        [_pageArr addObject:p];
        [ud setObject:_pageArr forKey:@"aaa"];
        [ud synchronize];
        NSString *urlStr=[NSString stringWithFormat:@"http://10.0.8.8/sns/my/user_list.php?page=%d&number=4",_page];
        [self netRequest:urlStr];
         NSLog(@"走网了");
    }else{
        _dataArr.array = [[DatabaseManager defaultManager] selectAllModel:_page];
         NSLog(@"没走网络");
        [_myTableView reloadData];
    }

         NSLog(@"======%d",_page);
    [_myTableView reloadData];
    
}
#pragma mark - tableview
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 120;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"qqq"forIndexPath:indexPath];
    Model *model=[_dataArr objectAtIndex:indexPath.row];
    [cell customModel:model];
    return cell;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
