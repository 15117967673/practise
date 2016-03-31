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
    CGRect frame=self.view.frame;
    frame.origin.y+=20;
    frame.size.height-=20;
    _mytableView=[[UITableView alloc]initWithFrame:frame];
    _mytableView.delegate=self;
    _mytableView.dataSource=self;
    _mytableView.separatorColor=[UIColor redColor];
    [self.view addSubview:_mytableView];
    
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
{//设置分段的头标题
    if(!section){
        return @"男生";
    }else{
        return @"女生";
    }
   
}
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{//设置分段脚标题
    if(!section){
        return @"男脚";
    }else{
        return @"女脚";
    }

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{//头标题高度
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{//脚标题高度
    return 30;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{//设置行高，默认是44
    return 100;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{//自定义头标题的view
    UILabel *label=[[UILabel alloc]init];
    
    label.backgroundColor=[UIColor grayColor];
    
    if (section) {
        label.text=@"女生";
    } else {
        label.text=@"男生";
    }
    
    label.textAlignment=NSTextAlignmentCenter;
    //return的view会替换自带的头标题view
    //frame设置无效，位置和宽高是固定的，和table一样，高度通过代理方法设置
    return label;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString *identifier=@"cellId";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        //cell被点击以后是否变灰，如果是none就不变，否则就变
        cell.selectionStyle=UITableViewCellSelectionStyleBlue;
        //cell的附属view的类型，（如果附属view里有button，那么这个view的点击事件会独立出来）
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
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
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{//cell被点击时触发
    NSLog(@"s=%zd,r=%zd",indexPath.section,indexPath.row);
    //让cell被选中的时候变灰状态恢复，恢复成不变灰，不触发deselectRowAtIndexPath这个方法
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Person *son=[[_dataArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    
    NSLog(@"age=%@",son.age);
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{//反选的时候触发，
    NSLog(@"Deselect");
}
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{//如果附属cell的附属view里有button，那么这个view的点击事件会独立出来
    NSLog(@"accessory,s=%zd,r=%zd",indexPath.section,indexPath.row);
   
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
