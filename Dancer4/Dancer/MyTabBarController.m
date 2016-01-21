//
//  MyTabBarController.m
//  Dancer
//
//  Created by qianfeng on 15/8/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "MyTabBarController.h"
#import "RecommendVC.h"
#import "CommentVC.h"
#import "ShowVC.h"
#import "SpecialVC.h"
#import "AppDelegate.h"
#import "LeftDetailViewController.h"
#import "MyViewController.h"
#import "RESideMenu.h"
#import "AppDelegate.h"
@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    RecommendVC *avc=[[RecommendVC alloc]init];
    CommentVC *bvc=[[CommentVC alloc]init];
    ShowVC *cvc=[[ShowVC alloc]init];
    SpecialVC *dvc=[[SpecialVC alloc]init];
    LeftDetailViewController *lvc=[[LeftDetailViewController alloc]init];
    
    UINavigationController *lnc=[[UINavigationController alloc]initWithRootViewController:lvc];
    UINavigationController *anc=[[UINavigationController alloc]initWithRootViewController:avc];
    UINavigationController *bnc=[[UINavigationController alloc]initWithRootViewController:bvc];
    UINavigationController *cnc=[[UINavigationController alloc]initWithRootViewController:cvc];
    UINavigationController *dnc=[[UINavigationController alloc]initWithRootViewController:dvc];
    
   
    
    self.viewControllers=[NSArray arrayWithObjects:lnc,anc,bnc,cnc,dnc, nil];
    lnc.tabBarItem.title=@"学舞蹈";
    anc.tabBarItem.title=@"推荐";
    bnc.tabBarItem.title=@"交流天地";
    cnc.tabBarItem.title=@"精彩表演";
    dnc.tabBarItem.title=@"专题";
    
    lvc.navigationItem.title=@"学舞蹈";
    avc.navigationItem.title=@"推荐";
    bvc.navigationItem.title=@"交流天地";
    cvc.navigationItem.title=@"精彩表演";
    dvc.navigationItem.title=@"专题";
    
    UITabBarItem *item1=[[UITabBarItem alloc]initWithTitle:@"学舞蹈" image:[UIImage imageNamed:@"module_6944"] tag:1];
    lvc.tabBarItem=item1;
    
    UITabBarItem *item2=[[UITabBarItem alloc]initWithTitle:@"推荐" image:[UIImage imageNamed:@"module_99340"] tag:2];
    avc.tabBarItem=item2;
    
    UITabBarItem *item3=[[UITabBarItem alloc]initWithTitle:@"交流天地" image:[UIImage imageNamed:@"module_12290"] tag:3];
    bvc.tabBarItem=item3;
    
    UITabBarItem *item4=[[UITabBarItem alloc]initWithTitle:@"精彩表演" image:[UIImage imageNamed:@"module_99341"] tag:4];
    cvc.tabBarItem=item4;
    
    UITabBarItem *item5=[[UITabBarItem alloc]initWithTitle:@"专题" image:[UIImage imageNamed:@"module_12288"] tag:5];
    dvc.tabBarItem=item5;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receivedNotif:) name:@"MyTabBarController" object:nil];
}
-(void)receivedNotif:(NSNotification *)noti
{
    NSNumber *flag=noti.userInfo[@"flag"];
    NSNumber *selected=noti.userInfo[@"flagslected"];
    if(flag.intValue==1){
        NSInteger index=self.selectedIndex;
        for(int i=0;i<self.viewControllers.count;i++){
            if(i==index&&(index!=selected.intValue)){
                MyViewController *mvc=[[MyViewController alloc]init];
                UINavigationController *nav=self.viewControllers[i];
                NSLog(@"nav.visibleViewController.navigationItem.title:%@",nav.visibleViewController.navigationItem.title);
               
                if([nav.visibleViewController.navigationItem.title isEqualToString:@"学舞蹈"]){
                    [nav pushViewController:mvc animated:YES];
                }
                if([nav.visibleViewController.navigationItem.title isEqualToString:@"推荐"]){
                    [nav pushViewController:mvc animated:YES];
                }
                if([nav.visibleViewController.navigationItem.title isEqualToString:@"交流天地"]){
                    [nav pushViewController:mvc animated:YES];
                }
                if([nav.visibleViewController.navigationItem.title isEqualToString:@"精彩表演"]){
                    [nav pushViewController:mvc animated:YES];
                }
                if([nav.visibleViewController.navigationItem.title isEqualToString:@"专题"]){
                    [nav pushViewController:mvc animated:YES];
                }
                
                
            }
        }
    }

      if(flag.intValue==2){
         NSLog(@"noti 22222222");
         self.selectedIndex=0;
     }


}





@end
