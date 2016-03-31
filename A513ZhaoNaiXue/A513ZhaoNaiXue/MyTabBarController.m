//
//  MyTabBarController.m
//  A513ZhaoNaiXue
//
//  Created by Mac on 15-8-20.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "MyTabBarController.h"
#import "AViewController.h"
#import "BViewController.h"
#import "CViewController.h"
#import "DViewController.h"
@interface MyTabBarController ()

@end

@implementation MyTabBarController

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
    
    AViewController *avc=[[AViewController alloc]init];
    BViewController *bvc=[[BViewController alloc]init];
    CViewController *cvc=[[CViewController alloc]init];
    DViewController *dvc=[[DViewController alloc]init];
    UINavigationController *anc=[[UINavigationController alloc]initWithRootViewController:avc];
    UINavigationController *bnc=[[UINavigationController alloc]initWithRootViewController:bvc];
    UINavigationController *cnc=[[UINavigationController alloc]initWithRootViewController:cvc];
    UINavigationController *dnc=[[UINavigationController alloc]initWithRootViewController:dvc];
    
    
    self.tabBar.backgroundImage=[UIImage imageNamed:@"tabbar"];
    self.viewControllers=[NSArray arrayWithObjects:anc,bnc,cnc,dnc,nil];
    
    UITabBarItem *item1=[[UITabBarItem alloc]initWithTitle:@"菜谱" image:[[UIImage imageNamed:@"菜谱"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] selectedImage:[[UIImage imageNamed:@"菜谱A"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    avc.tabBarItem=item1;
    UITabBarItem *item2=[[UITabBarItem alloc]initWithTitle:@"精品汇" image:[[UIImage imageNamed:@"精品汇"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ]selectedImage:[[UIImage imageNamed:@"精品汇A"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ]];
    bvc.tabBarItem=item2;
    UITabBarItem *item3=[[UITabBarItem alloc]initWithTitle:@"卖汤汤" image:[[UIImage imageNamed:@"卖汤汤"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] selectedImage:[[UIImage imageNamed:@"卖汤汤A"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ]];
    cvc.tabBarItem=item3;
    UITabBarItem *item4=[[UITabBarItem alloc]initWithTitle:@"我的" image:[[UIImage imageNamed:@"我的"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] selectedImage:[[UIImage imageNamed:@"我的A"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ]];
    dvc.tabBarItem=item4;

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
