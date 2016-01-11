//
//  WeekViewController.m
//  WeekNo
//
//  Created by zcznx on 15/11/12.
//  Copyright © 2015年 znx. All rights reserved.
//

#import "WeekViewController.h"
#import "TableViewCell.h"
#import "Model.h"
@interface WeekViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_myTableView;
    NSMutableArray *_dataArr;
    //NSUserDefaults *ud;
    NSMutableArray *_dataBOOL;
    NSMutableArray *_timeLabelArr;
    NSArray *array;
}

@end

@implementation WeekViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    
    
    _myTableView=[[UITableView alloc]initWithFrame:self.view.frame];
    _myTableView.dataSource=self;
    _myTableView.delegate=self;
    [self.view addSubview:_myTableView];
    
    array=@[@"每天",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日"];
    _dataArr=[[NSMutableArray alloc]init];
    _dataBOOL=[[NSMutableArray alloc]init];
    _timeLabelArr=[[NSMutableArray alloc]init];
    if([[NSUserDefaults standardUserDefaults]objectForKey:@"weekArr"]){
        _dataArr.array=[[NSUserDefaults standardUserDefaults]objectForKey:@"array"];
        _dataBOOL.array=[[NSUserDefaults standardUserDefaults]objectForKey:@"weekArr"];
    }else{
    
       for(int i=0;i<[array count];i++){
        [_dataArr addObject:array[i]];
       }
        for (int j=0; j<[array count]; j++) {
        [_dataBOOL addObject:@"yes"];
       }
       [[NSUserDefaults standardUserDefaults]setObject:_dataArr forKey:@"array"];
       [[NSUserDefaults standardUserDefaults]setValue:_dataBOOL forKey:@"weekArr"];
    }
    [_myTableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"qqq"];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"qqq"forIndexPath:indexPath];
    cell.nameLable.text=_dataArr[indexPath.row];
    NSArray *arrayBOOL=[[NSUserDefaults standardUserDefaults]objectForKey:@"weekArr"];
    if([arrayBOOL[indexPath.row]isEqualToString:@"yes"]){
        cell.crossImage.hidden=YES;
    }else{
        cell.crossImage.hidden=NO;
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    NSArray *arrayBOOL=[[NSUserDefaults standardUserDefaults]objectForKey:@"weekArr"];

    if([arrayBOOL[indexPath.row]isEqualToString:@"no"]){
        cell.crossImage.hidden=YES;
        [_dataBOOL replaceObjectAtIndex:indexPath.row withObject:@"yes"];
        [[NSUserDefaults standardUserDefaults]setObject:_dataBOOL forKey:@"weekArr"];
        
    }else{
        cell.crossImage.hidden=NO;
        NSLog(@"_timeLabelArr :%@",_timeLabelArr);
        [_dataBOOL replaceObjectAtIndex:indexPath.row withObject:@"no"];
        [[NSUserDefaults standardUserDefaults]setObject:_dataBOOL forKey:@"weekArr"];

    }
    NSLog(@"******");
    if(_timeLabelArr){
        [_timeLabelArr removeAllObjects];
    }
    for(int i=0;i<[_dataBOOL count];i++){
        if([_dataBOOL[i] isEqualToString:@"no"]){
            [_timeLabelArr addObject:array[i]];
        }
    }
    [self.delegate timeLabel:_timeLabelArr];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
