//
//  MyTabBarController.m
//  smartHome
//
//  Created by zcznx on 15/10/30.
//  Copyright © 2015年 zhichi. All rights reserved.
//

#import "MyTabBarController.h"
#import "HomeViewController.h"
#import "ManagerViewController.h"
#import "ControlViewController.h"
@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HomeViewController * hvc = [[HomeViewController alloc]init];
    //hvc.tabBarItem.title = @"首页";
    ManagerViewController * mvc = [[ManagerViewController alloc]init];
    //mvc.tabBarItem.title = @"设备管理";
    ControlViewController * cvc = [[ControlViewController alloc]init];
    //cvc.tabBarItem.title = @"设备控制";
    
    UINavigationController *hnc=[[UINavigationController alloc]initWithRootViewController:hvc];
    UINavigationController *mnc=[[UINavigationController alloc]initWithRootViewController:mvc];
    UINavigationController *cnc=[[UINavigationController alloc]initWithRootViewController:cvc];
    
    self.viewControllers=[NSArray arrayWithObjects:hnc,mnc,cnc, nil];
    
    hvc.navigationItem.title=@"首页";
    mvc.navigationItem.title=@"设备管理";
    cvc.navigationItem.title=@"设备控制";
    
    hnc.tabBarItem.title=@"首页";
    mnc.tabBarItem.title=@"设备管理";
    cnc.tabBarItem.title=@"设备控制";

    

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
