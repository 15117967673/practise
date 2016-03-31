//
//  AppDelegate.m
//  A4chessBoard
//
//  Created by Mac on 15-7-14.
//  Copyright (c) 2015年 Mac. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    UIView *bgView=[[UIView alloc]initWithFrame:CGRectMake(0, 40, 320, 320)];
    [self.window addSubview:bgView];
    NSArray *titleArr=@[@"车",@"马",@"象",@"王",@"后",@"象",@"马",@"车"];
    for(int i=0;i<8;i++){
        for(int j=0;j<8;j++){
            UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(40*j, 40*i, 40, 40)];
            if((i+j)%2){
                label.backgroundColor=[UIColor blackColor];
            }
            else{
                label.backgroundColor=[UIColor whiteColor];
            }
            [bgView addSubview:label];
            
            label.textAlignment=NSTextAlignmentCenter;
            
            label.font=[UIFont boldSystemFontOfSize:30];
            
            if(i<2){
                label.textColor=[UIColor redColor];
                if(i==0){
                    label.text=titleArr[j];
                }
                else
                {
                   label.text=@"兵";
                }
            }
            if(i>5){
                label.textColor=[UIColor greenColor];
                if(i==7){
                    label.text=titleArr[7-j];
                }
                else{
                  label.text=@"兵";
                }
            }
        }
    }
    
    self.window.backgroundColor = [UIColor yellowColor];
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
