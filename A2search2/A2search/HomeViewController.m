//
//  HomeViewController.m
//  A2search
//
//  Created by Mac on 15-7-28.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_dataArr;
    UITableView *_myTableView;
    
    NSMutableArray *_closeArr;
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
    self.view.backgroundColor=[UIColor yellowColor];
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self createData];
    [self createUI];
}
-(void)createData
{
    _dataArr=[[NSMutableArray alloc]init];
    _closeArr=[[NSMutableArray alloc]init];
    for(int i='a';i<='z';i++){
        NSMutableArray *arr=[[NSMutableArray alloc]init];
        for(int j=0;j<9;j++){
            [arr addObject:[NSString stringWithFormat:@"%c%d",i,j]];
        }
        [_dataArr addObject:arr];
        [_closeArr addObject:[NSNumber numberWithBool:YES]];
    }
}
-(void)createUI
{
    CGRect frame=self.view.frame;
    
    frame.origin.y+=64;
    frame.size.height-=64;
    _myTableView=[[UITableView alloc]initWithFrame:frame];
    _myTableView.delegate=self;
    _myTableView.dataSource=self;
    //索引条的颜色
    _myTableView.sectionIndexBackgroundColor=[UIColor purpleColor];
    [self.view addSubview:_myTableView];
}
#pragma mark - tableview
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([[_closeArr objectAtIndex:section]boolValue]) {
        return 0;
    } else {
        return [[_dataArr objectAtIndex:section]count];
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIButton *btn=[UIButton  buttonWithType:UIButtonTypeSystem];
    btn.backgroundColor=[UIColor redColor];
    [btn setTitle:[NSString stringWithFormat:@"%c",'A'+section] forState:UIControlStateNormal];
    btn.tag=section+100;
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
-(void)btnClick:(UIButton *)sender
{
    //找到对应的折叠状态
    BOOL isClose=[[_closeArr objectAtIndex:sender.tag-100]boolValue];
    [_closeArr replaceObjectAtIndex:sender.tag-100 withObject:[NSNumber numberWithBool:!isClose]];
    //刷新对应的分段
    [_myTableView reloadSections:[NSIndexSet indexSetWithIndex:sender.tag-100] withRowAnimation:UITableViewRowAnimationBottom];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"qqq"];
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:0 reuseIdentifier:@"qqq"];
    }
    cell.textLabel.text=[[_dataArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    return cell;
}
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{//索引条
    //默认情况下点击索引里的第几个，tv就会跳到第几段
    NSMutableArray *titleArr=[NSMutableArray array];
    
    for(int i='A';i<'Z';i++){
        [titleArr addObject:[NSString stringWithFormat:@"%c",i]];
    }
    return titleArr;
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
