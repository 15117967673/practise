//
//  AInsideViewController.m
//  RLZNC
//
//  Created by zcznx on 15/10/20.
//  Copyright © 2015年 赵乃学. All rights reserved.
//

#import "AInsideViewController.h"
#import "AInsideACell.h"
#import "AInsideBCell.h"
#import "AInsideCCell.h"
#import "AInsideDCell.h"
#import "DatePickerViewController.h"
@interface AInsideViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_myTableView;
    NSMutableArray *_dataArr;
}

@end

@implementation AInsideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    _dataArr=[[NSMutableArray alloc]init];
    if([[NSUserDefaults standardUserDefaults]objectForKey:[NSString stringWithFormat:@"%@array",self.name]]){
        _dataArr.array=[[NSUserDefaults standardUserDefaults]objectForKey:[NSString stringWithFormat:@"%@array",self.name]];
    }else{
       
    
       NSMutableArray *dataArr1=[[NSMutableArray alloc]init];
       NSMutableArray *dataArr2=[[NSMutableArray alloc]init];
       for(int i=0;i<2;i++){
           NSString *string=[NSString stringWithFormat:@"%d",i];
          [dataArr2 addObject:string];
       }

       NSMutableArray *dataArr3=[[NSMutableArray alloc]init];
       NSMutableArray *dataArr4=[[NSMutableArray alloc]init];
    
       [_dataArr addObject:dataArr1];
       [_dataArr addObject:dataArr2];
       [_dataArr addObject:dataArr3];
       [_dataArr addObject:dataArr4];
    
       //NSArray *array=[_dataArr mutableCopy];
       NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
       [ud setObject:_dataArr forKey:[NSString stringWithFormat:@"%@array",self.name]];
       [ud synchronize];
    }
    _myTableView = [[UITableView alloc] initWithFrame:self.view.frame ];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    [self.view addSubview:_myTableView];
    
    [_myTableView registerClass:[AInsideACell class] forCellReuseIdentifier:@"aaa"];
    [_myTableView registerClass:[AInsideBCell class] forCellReuseIdentifier:@"bbb"];
    [_myTableView registerClass:[AInsideCCell class] forCellReuseIdentifier:@"ccc"];
    [_myTableView registerClass:[AInsideDCell class] forCellReuseIdentifier:@"ddd"];
    
    UIBarButtonItem *item=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshClick)];
    self.navigationItem.rightBarButtonItem=item;
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}
-(void)addClick:(UIButton *)sender
{
    NSLog(@"addClick");
    
    [_myTableView setEditing:!_myTableView.editing animated:YES];
}
- (void)refreshClick
{
    //刷新tableView（重走所有的代理方法）
    [_myTableView reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==0){
       return 1;
    }
    if(section==1){
        return [[_dataArr objectAtIndex:section]count];
    }
    if(section==2){
        return 1;
    }
    if(section==3){
        return 2;
    }

    return 0;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{//设置分段头标题
    if(section==0){
        return @"";
    }
    if(section==1){
        return @"";
    }
    if(section==2){
        return @"倒计时";
    }
    if(section==3){
        return @"";
    }

    return @"";
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section==1) {
        UIView *view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 15)];
        view.backgroundColor=[UIColor lightGrayColor];
        UILabel *lable=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 80, 20)];
        lable.text=@"定时";
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(250, 0, 40, 20);
        [btn setTitle:@"添加" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(addClick:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:btn];
        [view addSubview:lable];
        return view;
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 54;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        AInsideACell *ac = [tableView dequeueReusableCellWithIdentifier:@"aaa" forIndexPath:indexPath];
       // AModel *model=[_dataArr objectAtIndex:indexPath.row];
        //[ac customWithModel:model];
        ac.name.text=self.name;
        return ac;
    }
    if (indexPath.section==1) {
        AInsideBCell *bc = [tableView dequeueReusableCellWithIdentifier:@"bbb" forIndexPath:indexPath];
        // AModel *model=[_dataArr objectAtIndex:indexPath.row];
        //[ac customWithModel:model];
        bc.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边箭头
        bc.time.text=[[_dataArr objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
        NSLog(@"bc.name:%@",bc.time.text);
        return bc;
    }

    if (indexPath.section==2) {
        AInsideCCell *cc = [tableView dequeueReusableCellWithIdentifier:@"ccc" forIndexPath:indexPath];
        // AModel *model=[_dataArr objectAtIndex:indexPath.row];
        //[ac customWithModel:model];
        cc.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边箭头

        return cc;
    }
    if(indexPath.section==3){
        if(indexPath.row==0){
            AInsideACell *ac = [tableView dequeueReusableCellWithIdentifier:@"aaa" forIndexPath:indexPath];
            // AModel *model=[_dataArr objectAtIndex:indexPath.row];
            //[ac customWithModel:model];
            ac.name.text=@"锁";
            return ac;

        }
        if (indexPath.row==1) {
            AInsideDCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ddd" forIndexPath:indexPath];
            
            //AModel *model = [_dataArr objectAtIndex:indexPath.row];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边箭头
            //[cell customWithModel:model];、
            cell.name.text=@"修改密码";
            return cell;

        }
    }
    return nil;

}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle==UITableViewCellEditingStyleInsert) {
        
    
    
    NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
    NSArray *array=[ud objectForKey:[NSString stringWithFormat:@"%@array",self.name]];
   // NSLog(@"NSArray *array:%@",array);
    NSMutableArray *dataArr=[[NSMutableArray alloc]initWithArray:[array objectAtIndex:indexPath.section]];
   // NSLog(@"NSMutableArray *dataArr:%@",dataArr);
    
    [dataArr insertObject:@"3" atIndex:indexPath.row];
    
    [_dataArr replaceObjectAtIndex:indexPath.section withObject:dataArr];
    [_myTableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationTop];
    NSUserDefaults *udd=[NSUserDefaults standardUserDefaults];
    [udd setObject:_dataArr forKey:[NSString stringWithFormat:@"%@array",self.name]];
    }
    
    
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{//设置cell的编辑风格（插入/删除）
    return UITableViewCellEditingStyleInsert;
}


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==1) {
        return YES;
    }
    return NO;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_myTableView deselectRowAtIndexPath:indexPath animated:YES];
    DatePickerViewController *dataView=[[DatePickerViewController alloc]init];
    [self.navigationController pushViewController:dataView animated:YES];
}










@end
