//
//  RootViewController.m
//  exercise
//
//  Created by Happigo on 14-10-15.
//  Copyright (c) 2014年 HappiVision. All rights reserved.
//

#import "RootViewController.h"
#import "AFNetworking.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithViewName:(NSString *)viewName
{
    self = [super init];
    if (self)
    {
        _viewName = viewName;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeThemeNotificantion) name:kThemeDidChangeNotification object:nil];
    
    [self uiConfig];
}
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
    
    ThemeButton *btn = [[ThemeButton alloc] initWithImage:@"shareBtn.png" highlighted:@"shareBtn_hl" selected:nil];
    btn.frame = CGRectMake(0, 0, 23, 6);
//    [btn addTarget:self action:@selector(shareAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    self.view.backgroundColor = [[ThemeManager shareInstance] getColorWithName:@"bgColor"];
}

- (void)uiConfig
{
    [self loadThemeImage];
    
//    AFHTTPRequestOperationManager* manager =[AFHTTPRequestOperationManager manager];
//    NSString* url =@"http://iappfree.candou.com:8080/free/applications/limited?page=1&number=1" ;
//    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"%@",responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"%@",error);
//    }];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
//    manager.responseSerializer.acceptableContentTypes = []
//    NSDictionary *parameters =@{@"参数1":@"value1",@"参数2":@"value2"};
    
    [manager POST:@"http://1000phone.net:8088/app/iAppFree/api/reduce.php?page=1&number=1"parameters:nil
         success:^(AFHTTPRequestOperation *operation,id responseObject) {
             NSLog(@"Success: %@", responseObject);
             
         }failure:^(AFHTTPRequestOperation *operation,NSError *error) {
             NSLog(@"Error: %@", error);
         }];
    
    
//    ThemeButton* button =[[ThemeButton alloc]initWIthColorName:@"default"];
//    UIButton* button =[UIButton buttonWithType:UIButtonTypeCustom];
//    button.backgroundColor =[UIColor  orangeColor];
//    button.frame =CGRectMake(10, 100, 300, 40);
//    [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
//    
//}
//
//-(void)btnClick
//{
//    SubViewController* sub =[[SubViewController alloc]init];
////    CustTabbarController* cust =[[CustTabbarController alloc]init];
////    cust.bg.hidden =YES;
//    [self.navigationController pushViewController:sub animated:YES];
    
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
