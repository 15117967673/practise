//
//  AViewController.m
//  RLZNC
//
//  Created by zcznx on 15/10/19.
//  Copyright © 2015年 赵乃学. All rights reserved.
//

#import "AViewController.h"
#import "AACell.h"
#import "ABCell.h"
#import "AModel.h"
#import "AInsideViewController.h"
@interface AViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_myTableView;
    NSMutableArray *_dataArr;
}
@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _dataArr=[[NSMutableArray alloc]init];
    self.view.backgroundColor=[UIColor redColor];
    self.navigationController.navigationBar.barTintColor=[UIColor blueColor];
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:18], NSFontAttributeName, [UIColor whiteColor], NSForegroundColorAttributeName, nil];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, 0, 40, 40);
    [btn setTitle:@"添加" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *dItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = dItem;
    
    NSArray *array=@[@"插座",@"一楼客厅插座",@"音箱遥控器",@"DVD遥控器",@"小米遥控器",@"电视遥控器",@"空调遥控器"];
    for(int i=0;i<[array count];i++){
        AModel *model=[[AModel alloc]init];
        model.name=array[i];
        [_dataArr addObject:model];
    }
    
    _myTableView = [[UITableView alloc] initWithFrame:self.view.frame];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;
    [self.view addSubview:_myTableView];
    
    [_myTableView registerClass:[AACell class] forCellReuseIdentifier:@"www"];
    [_myTableView registerClass:[ABCell class] forCellReuseIdentifier:@"qqq"];

    
}
-(void)btnClick:(UIButton *)sender
{
   
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
   
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 53;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0||indexPath.row==1) {
        AACell *ac = [tableView dequeueReusableCellWithIdentifier:@"www" forIndexPath:indexPath];
        AModel *model=[_dataArr objectAtIndex:indexPath.row];
        [ac customWithModel:model];
        
        return ac;
    }
    
    
    ABCell *cell = [tableView dequeueReusableCellWithIdentifier:@"qqq" forIndexPath:indexPath];
    
    AModel *model = [_dataArr objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; //显示最右边箭头
    [cell customWithModel:model];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [_myTableView deselectRowAtIndexPath:indexPath animated:YES];
    AInsideViewController *aivc=[[AInsideViewController alloc]init];
    AModel *model=[_dataArr objectAtIndex:indexPath.row];
    aivc.name=model.name;
    [self.navigationController pushViewController:aivc animated:YES ];
    
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
