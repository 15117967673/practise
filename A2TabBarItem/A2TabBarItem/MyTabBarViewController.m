//
//  MyTabBarViewController.m
//  A2TabBarItem
//
//  Created by Mac on 15-7-22.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "MyTabBarViewController.h"
#import "HomeViewController.h"
#import "LoveViewController.h"
#import "NearlyViewController.h"
#import "SetViewController.h"
@interface MyTabBarViewController ()

@end

@implementation MyTabBarViewController

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
    
    /*  使用tabBarController的思路
     *  1.创建所有需要展示的页面
     *  2.如果需要将页面放到导航里
     *  3.设置每一个页面或者导航显示在tabBar上的专用按钮
     *  4.将页面或者导航放到数组里然后和标签栏关联
     *
     */
    
    HomeViewController *homevc=[[HomeViewController alloc]init];
    LoveViewController *lovevc=[[LoveViewController alloc]init];
    NearlyViewController *nearlyvc=[[NearlyViewController  alloc]init];
    SetViewController *setvc=[[SetViewController alloc]init];
    
    UINavigationController *homenc=[[UINavigationController alloc]initWithRootViewController:homevc];
    
    homevc.navigationItem.title=@"主页";
    //1.创建一个标签栏专用按钮(系统自带样式)
    UITabBarItem *homeItem=[[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemContacts tag:0];
    //设置给需要展示的页面（导航）
    homenc.tabBarItem=homeItem;
    //2.使用一个字符串和一个图片创建专用按钮(默认会渲染图片)
    //UITabBarItem使用的图片最合适的大小是30*30
    UITabBarItem *loveItem=[[UITabBarItem alloc]initWithTitle:@"love" image:[UIImage imageNamed:@"tab_0"] tag:0];
    lovevc.tabBarItem=loveItem;
    //3.使用一个字符串和两张图片创建（默认会渲染）
    UITabBarItem *nearItem=[[UITabBarItem alloc]initWithTitle:@"near" image:[UIImage imageNamed:@"tab2_1"] selectedImage:[UIImage imageNamed:@"tab2_2"]];
    nearlyvc.tabBarItem=nearItem;
    
    self.viewControllers=[NSArray arrayWithObjects:homenc,lovevc,nearlyvc,setvc, nil];
    //设置渲染色
    self.tabBar.tintColor=[UIColor redColor];
    //背景色
    self.tabBar.barTintColor=[UIColor purpleColor];
    //背景图片（标签栏高度默认是49）
    self.tabBar.backgroundImage=[UIImage imageNamed:@"tabbg"];
    //可以给专用按钮上的文字设置属性（工作中一般不用）
    [homeItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14],NSFontAttributeName, nil] forState:UIControlStateNormal];
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
