//
//  FirstViewController.m
//  A1NavigationController
//
//  Created by Mac on 15-7-20.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

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
    self.view.backgroundColor=[UIColor redColor];
    
    [self customNavigationBar];
    
}
//设置导航栏（导航栏是属于导航控制器的）
-(void)customNavigationBar
{
    //针对导航栏的设置，会影响到整个导航控制器
    //1.设置导航栏的隐藏状态
    self.navigationController.navigationBarHidden=NO;
    //2-1.通过vc找到nc,通过nc找到导航栏，设置背景色
    self.navigationController.navigationBar.barTintColor=[UIColor magentaColor];
    //2-2.设置导航栏内容的渲染色（自带的返回按钮）
    self.navigationController.navigationBar.tintColor=[UIColor greenColor];
    //半透明状态，如果写成yes，00坐标点在导航栏左上角
    //如果写成no。00坐标点在导航栏左下角
    //self.navigationController.navigationBar.translucent=NO;
    //3.设置背景图片（默认是平铺,会引起坐标原点的改变）
    //以iphone4为例，如果图片的大小是320*44，那么就会展示成ios7以前的效果，这个效果就是系统状态栏和导航栏分离
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"44"] forBarMetrics:UIBarMetricsDefault];
   // [UINavigationBar appearance]这个方法也可以找到当前导航栏
    
    self.navigationItem.title=@"red";
    //4.设置导航栏上title的文字属性
    self.navigationController.navigationBar.titleTextAttributes=[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:10],NSFontAttributeName ,[UIColor purpleColor],NSForegroundColorAttributeName,nil];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    SecondViewController *svc=[[SecondViewController alloc]init];
    //通过当前页面找到所属的导航控制器,推出新页面
    [self.navigationController pushViewController:svc animated:YES];
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
