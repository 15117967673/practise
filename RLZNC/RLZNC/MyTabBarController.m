//
//  MyTabBarController.m
//  RLZNC
//
//  Created by zcznx on 15/10/19.
//  Copyright © 2015年 赵乃学. All rights reserved.
//

#import "MyTabBarController.h"
#import "AViewController.h"
#import "BViewController.h"
#import "CViewController.h"
@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    AViewController *avc=[[AViewController alloc]init];
    BViewController *bvc=[[BViewController alloc]init];
    CViewController *cvc=[[CViewController alloc]init];
    
    UINavigationController *anc=[[UINavigationController alloc]initWithRootViewController:avc];
    UINavigationController *bnc=[[UINavigationController alloc]initWithRootViewController:bvc];
    UINavigationController *cnc=[[UINavigationController alloc]initWithRootViewController:cvc];
    
    self.viewControllers=[NSArray arrayWithObjects:anc,bnc,cnc, nil];
    
    anc.tabBarItem.title=@"设备列表";
    bnc.tabBarItem.title=@"设置";
    cnc.tabBarItem.title=@"帮助";
    
    avc.navigationItem.title=@"设备列表";
    bvc.navigationItem.title=@"设置";
    cvc.navigationItem.title=@"帮助";
    
    

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
