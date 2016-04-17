//
//  SettingViewController.m
//  exercise
//
//  Created by Happigo on 14-10-15.
//  Copyright (c) 2014年 HappiVision. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
    NSArray *_titleArray;
}
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeThemeNotificantion) name:kThemeDidChangeNotification object:nil];
    
    [self uiConfig];
}

- (void)changeThemeNotificantion
{
    ThemeLabel *title = [[ThemeLabel alloc] initWithColorName:@"default"];
    title.text = @"设置";
    title.frame = CGRectMake(0, 0, 100, 30);
    title.textAlignment = NSTextAlignmentCenter;
    title.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = title;
    
//    UIBarButtonItem* right =[[UIBarButtonItem alloc]initWithTitle:@"right" style:UIBarButtonItemStylePlain target:self action:@selector(rightbtn)];
//    self.navigationItem.rightBarButtonItem =right;
    
    self.view.backgroundColor = [[ThemeManager shareInstance] getColorWithName:@"bgColor"];
    _tableView.backgroundColor = [[ThemeManager shareInstance] getColorWithName:@"bgColor"];
}

//-(void)rightbtn
//{
//    [self.navigationController popToRootViewControllerAnimated:YES];
//    
//}


-(void)uiConfig
{
    _dataArray = [[NSMutableArray alloc] init];
    _titleArray = @[@"浏览设置", @"缓存设置", @"账号设置", @"分享设置", @"关于"];
    
    for (int i = 0; i < 5; ++i)
    {
        switch (i)
        {
            case 0:
                [_dataArray addObject:@[@"夜间模式切换"]];
                break;
                
            case 1:
                [_dataArray addObject:@[@"下次启动清除列表缓存", @"下次启动清除图片缓存"]];
                break;
                
            case 2:
                [_dataArray addObject:@[@"重新验证新浪微博"]];
                break;
                
            case 3:
                [_dataArray addObject:@[@"重新验证腾讯微博", @"重新验证人人网"]];
                break;
                
            default:
                [_dataArray addObject:@[@"去评分", @"版权", @"关注我们", @"反馈", @"检查新版本", @"版本号"]];
                break;
        }
    }
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self changeThemeNotificantion];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    int section = indexPath.section;
    if (indexPath.section < 4)
    {
        static NSString *cellid = @"settingCell";
        
        SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
        
        if (!cell)
        {
            cell = [[NSBundle mainBundle] loadNibNamed:@"SettingTableViewCell" owner:self options:nil][0];
        }
        cell.settingText.text = _dataArray[indexPath.section][indexPath.row];
        
        switch (indexPath.section)
        {
            case 0:
                cell.settingSwitch.tag = indexPath.row + 10;
                break;
                
            case 1:
                cell.settingSwitch.tag = indexPath.row + 20;
                break;
                
            case 2:
                cell.settingSwitch.tag = indexPath.row + 30;
                break;
                
            default:
                cell.settingSwitch.tag = indexPath.row + 40;
                break;
        }
        
        if ([@"nt" isEqualToString:[ThemeManager shareInstance].themeName] && cell.settingSwitch.tag == 10)
        {
            cell.settingSwitch.on = YES;
        }
        
        return cell;
    }
    
    else
    {
        static NSString *cellid2 = @"otherCell";
        
        SettingTableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:cellid2];
        
        if (!cell2)
        {
            cell2 = [[NSBundle mainBundle] loadNibNamed:@"SettingTableViewCell" owner:self options:nil][1];
        }
        cell2.accessoryType = indexPath.row < 4 ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
        cell2.aboutText.text = _dataArray[indexPath.section][indexPath.row];
        if (indexPath.row == 5)
        {
            cell2.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell2;
    }
    
    return nil;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray[section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _titleArray[section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section < 4)
    {
        return;
    }
    switch (indexPath.row)
    {
        case 0:
            NSLog(@"去评分");
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@""]];
            break;
            
        case 1:
            NSLog(@"版权");
            break;
            
        case 2:
            NSLog(@"关注我们");
            break;
            
        case 3:
            NSLog(@"反馈");
            break;
            
        case 4:
            NSLog(@"检查新版本");
            break;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [_delegate showTabBar];
    
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
