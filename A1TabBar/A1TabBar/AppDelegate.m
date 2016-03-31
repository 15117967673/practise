//
//  AppDelegate.m
//  A1TabBar
//
//  Created by Mac on 15-7-22.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "AppDelegate.h"
#import "AViewController.h"
#import "BViewController.h"
#import "CViewController.h"
#import "DViewController.h"
#import "EViewController.h"
#import "FViewController.h"
#import "GViewController.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    AViewController *avc=[[AViewController alloc]init];
    BViewController *bvc=[[BViewController alloc]init];
    CViewController *cvc=[[CViewController alloc]init];
    DViewController *dvc=[[DViewController alloc]init];
    
    avc.title=@"avc";
    bvc.title=@"bvc";
    cvc.title=@"cvc";
    dvc.title=@"dvc";
    //如果需要，将页面放到导航里
    UINavigationController *bnc=[[UINavigationController alloc]initWithRootViewController:bvc];
    
    //创建一个标签栏控制器
    UITabBarController *tbc=[[UITabBarController alloc]init];
    //设置需要控制的页面(可以是普通页面，也可以是导航控制器)
    tbc.viewControllers=[NSArray arrayWithObjects:avc,bnc,cvc,dvc,nil];
    //将标签栏控制器和window关联
    self.window.rootViewController=tbc;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
