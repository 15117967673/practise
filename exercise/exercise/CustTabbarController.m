//
//  CustTabbarController.m
//  exercise
//
//  Created by Happigo on 14-10-15.
//  Copyright (c) 2014年 HappiVision. All rights reserved.
//

#import "CustTabbarController.h"

@interface CustTabbarController ()
{
    ThemeImageView* _custTabbarView;
    ThemeImageView* _naviView;
}
@end

@implementation CustTabbarController
@synthesize bg =_bg;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tabBar.hidden =YES;
    
    
//    UIImage *image = [[ThemeManager shareInstance] getThemeImage:kkDeviceVersion ? @"navback7.png" : @"navback.png"];
//    UIImage *titleViewImage = [[ThemeManager shareInstance] getThemeImage:@"logo.png"];
//    
//    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
//    
//    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:titleViewImage];
    
    
    RootViewController *home = [[RootViewController alloc] initWithViewName:kkHomeView];
    RootViewController *content = [[RootViewController alloc] initWithViewName:kkContentView];
    RootViewController *questtion = [[RootViewController alloc] initWithViewName:kkQuestionView];
    RootViewController *things = [[RootViewController alloc] initWithViewName:kkThingsView];
    PersonalViewController *personal = [[PersonalViewController alloc] init];
    
    NSArray *controllersArray = @[home, content, questtion, things, personal];
    
    NSMutableArray *naviArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < controllersArray.count; ++i)
    {
        UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:controllersArray[i]];
        
        [naviArray addObject:navi];
//        [[controllersArray objectAtIndex:i]setTitle:@"abc"];
    }
    
    self.viewControllers = naviArray;
    
    [self prepareTabBar];
}

#pragma mark - 标签栏
- (void)prepareTabBar
{
    NSArray *normalArray = @[@"home.png", @"content.png", @"question.png", @"things.png", @"personal.png"];
    NSArray *hlArray = @[@"home_hl.png", @"content_hl.png", @"question_hl.png", @"things_hl.png", @"personal_hl.png"];
    
    _bg = [[ThemeImageView alloc] initWithImageName:@"navback.png" stretchable:NO];
    _bg.frame = CGRectMake(0, kkScreenHeight - kkTabBarHeight, kkScreenWidth, kkTabBarHeight);
    _bg.userInteractionEnabled = YES;
//    _bg.tag = 1;
    [self.view addSubview:_bg];
    
    for (int i = 0; i < normalArray.count; ++i)
    {
        ThemeButton *button = [[ThemeButton alloc] initWithImage:normalArray[i] highlighted:hlArray[i] selected:hlArray[i]];
        
        button.frame = CGRectMake(i * kkScreenWidth / 5.0, 0, kkScreenWidth / 5.0, kkTabBarHeight);
        
        button.tag = 100 + i;
        
        [_bg addSubview:button];
        
        button.selected = i == 0;
        
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
        [button addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventTouchDown];
    }
}

#pragma mark - 点击标签栏
- (void)click:(UIButton *)btn
{
    self.selectedIndex = btn.tag - 100;
    btn.selected = YES;
}

- (void)touchDown:(UIButton *)btn
{
    for (UIButton *button in _bg.subviews)
    {
        if (100 <= button.tag && button.tag <= 104)
        {
            button.selected = NO;
        }
    }
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
