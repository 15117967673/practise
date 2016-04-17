//
//  PersonalViewController.m
//  exercise
//
//  Created by Happigo on 14-10-15.
//  Copyright (c) 2014年 HappiVision. All rights reserved.
//

#import "PersonalViewController.h"

@interface PersonalViewController ()

@end

@implementation PersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeThemeNotificantion) name:kThemeDidChangeNotification object:nil];
    
    [self uiConfig];
}

#pragma mark - 改变主题的通知
- (void)changeThemeNotificantion
{
    [self loadThemeImage];
}

#pragma mark - 加载导航栏图片,背景颜色
- (void)loadThemeImage
{
    UIImage *image = [[ThemeManager shareInstance] getThemeImage:kkDeviceVersion ? @"navback7.png" : @"navback.png"];
    UIImage *titleViewImage = [[ThemeManager shareInstance] getThemeImage:@"logo.png"];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:titleViewImage];
    
    self.view.backgroundColor = [[ThemeManager shareInstance] getColorWithName:@"bgColor"];
}

-(void)uiConfig
{
    [self loadThemeImage];
    // 设置按钮
    UIButton *settingButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 54, kkScreenWidth, 33)];
    [settingButton addTarget:self action:@selector(settingButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [settingButton setBackgroundImage:[UIImage imageNamed:@"followUsBtn"] forState:UIControlStateHighlighted];
    [self.view addSubview:settingButton];
    
    ThemeLabel *settingLabel = [[ThemeLabel alloc] initWithColorName:@"default"];
    settingLabel.frame = CGRectMake(50, 3.25, 100, 26.5);
    settingLabel.text = @"设置";
    settingLabel.backgroundColor = [UIColor clearColor];
    settingLabel.font = [UIFont systemFontOfSize:14];
    [settingButton addSubview:settingLabel];
    
    UIImageView *settingImage = [[UIImageView alloc] initWithFrame:CGRectMake(20, 6.5, 20, 20)];
    settingImage.image = [UIImage imageNamed:@"setting"];
    [settingButton addSubview:settingImage];
    
    UIImageView *p_con_arrow = [[UIImageView alloc] initWithFrame:CGRectMake(kkScreenWidth - 30, 12.25, 8.5, 14)];
    p_con_arrow.image = [UIImage imageNamed:@"p_con_arrow"];
    [settingButton addSubview:p_con_arrow];
    
}
- (void)settingButtonAction
{
    SettingViewController *set = [[SettingViewController alloc] init];
    
    set.delegate = self;
    
    [self.navigationController pushViewController:set animated:YES];
    
    CustTabbarController *tabBarVC = (CustTabbarController *)self.parentViewController.parentViewController;
    
    tabBarVC.bg.hidden = YES;
}

- (void)showTabBar
{
    CustTabbarController *tabBarVC = (CustTabbarController *)self.parentViewController.parentViewController;
    
    tabBarVC.bg.hidden = NO;
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
