//
//  ViewController.m
//  A2section
//
//  Created by Mac on 15-7-27.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_dataArr;
    UITableView *_mytableView;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self createData];
    [self createUI];
}
-(void)createData
{
    _dataArr=[[NSMutableArray alloc]init];
    
    NSMutableArray *boyArr=[[NSMutableArray alloc]init];
    for(int i=0;i<20;i++){
        Person *boyPerson=[[Person alloc]init];
        boyPerson.name=[NSString stringWithFormat:@"%d号男",i];
        boyPerson.age=[NSString stringWithFormat:@"%d",18+arc4random()%11];
        [boyArr addObject:boyPerson];
    }
    [_dataArr addObject:boyArr];
    
    NSMutableArray *girlArr=[[NSMutableArray alloc]init];
    for(int i=0;i<20;i++){
        Person *girlPerson=[[Person alloc]init];
        girlPerson.name=[NSString stringWithFormat:@"%d号女",i];
        girlPerson.age=[NSString stringWithFormat:@"%d",16+arc4random()%11];
        [girlArr addObject:girlPerson];
    }
    [_dataArr addObject:girlArr];

}
-(void)createUI
{
    self.view.backgroundColor=[UIColor yellowColor];
    //工具栏(在工具栏上面可以放导航的专用按钮)
    UIToolbar *tb=[[UIToolbar alloc]initWithFrame:CGRectMake(0, 20, 320, 44)];
    [self.view addSubview:tb];
    
    UIBarButtonItem *editBBI=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editClick)];
    
    UIBarButtonItem *refreshBBI=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshClick)];
    //FlexibleSpace这种类型的专用按钮就是占位符
    UIBarButtonItem *sepBBI=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    //让工具栏上面展示一些专用按钮
    tb.items=[NSArray arrayWithObjects:editBBI,refreshBBI,sepBBI,nil];
    CGRect frame=self.view.frame;
    frame.origin.y+=70;
    frame.size.height-=70;
    _mytableView=[[UITableView alloc]initWithFrame:frame];
    _mytableView.delegate=self;
    _mytableView.dataSource=self;
    [self.view addSubview:_mytableView];
    
}
-(void)editClick
{
    //每次点击都改变tv的编辑状态
    [_mytableView setEditing:!_mytableView.editing animated:YES];
    
}
-(void)refreshClick
{
    //刷新tableview,重走所有的代理方法
    [_mytableView reloadData];
}
#pragma mark - tableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{//设置tableview展示的分段
    return _dataArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{//设置每一段里应该展示多少行
    //section就是第几分段
    return [[_dataArr objectAtIndex:section]count];
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section){
       return @"女生";
    }else{
       return @"男生";
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString *identifier=@"cellId";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    //indexPath代表cell的位置
    //indexPath.section代表在第几段
    //indexPath.row代表在第几行
    NSLog(@"section=%zd,row=%zd",indexPath.section,indexPath.row);
    //通过cell的位置找到对应的保存数据的对象（数据模型）
    Person *son=[[_dataArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    //将信息展示在cell自带的2个label上
    
    cell.textLabel.text=son.name;
    cell.detailTextLabel.text=son.age;
    
    
    return cell;
}
#pragma mark - edit
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{//修改删除按钮上的文字
   return @"删";
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{//允许编辑，编辑相关按钮（删除，插入），点击时触发
    if(editingStyle==UITableViewCellEditingStyleDelete){
        //通过位置先删除对应的数据模型
        [[_dataArr objectAtIndex:indexPath.section]removeObjectAtIndex:indexPath.row];
        //然后再删除对应的cell
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationTop];
    }
    if(editingStyle==UITableViewCellEditingStyleInsert){
        Person *son=[[Person alloc]init];
        son.name=@"xixi";
        son.age=@"15";
        //在数据源对应的位置插入新数据
        [[_dataArr objectAtIndex:indexPath.section]insertObject:son atIndex:indexPath.row];
        //在对应位置插入一个cell（会自动匹配刚刚插入的数据）
        [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationTop];
        
    }
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{//设置cell的编辑风格（插入、删除）
    return UITableViewCellEditingStyleInsert;
}
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    //通过移动前的位置找到将要移动的数据模型
    Person *son=[[_dataArr objectAtIndex:sourceIndexPath.section]objectAtIndex:sourceIndexPath.row];
    //把这个数据模型从数据源里删除
    [[_dataArr objectAtIndex:sourceIndexPath.section]removeObjectAtIndex:sourceIndexPath.row];
    //再把这个数据插入到新的位置
    [[_dataArr objectAtIndex:destinationIndexPath.section]insertObject:son atIndex:destinationIndexPath.row];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
