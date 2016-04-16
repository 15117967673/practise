//
//  AppDelegate.m
//  QQ表情键盘
//
//  Created by student on 15-5-14.
//  Copyright (c) 2015年 student. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
{
    NSMutableArray * pictureArray;
    UIButton * faceButton;
}

-(void)preparePicture
{
    int k=1;
    pictureArray=[[NSMutableArray alloc]init];
    UIView * beijing=[[UIView alloc]initWithFrame:CGRectMake(0, 20, 320, 235)];
    beijing.backgroundColor=[UIColor cyanColor];
    [self.window addSubview:beijing];
    for (int i=0;i<9;i++){
        for (int j=0;j<12;j++){
            UIButton * pictureButton=[UIButton buttonWithType:UIButtonTypeCustom];
            [pictureButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%03d@2x",k]] forState:UIControlStateNormal];
            pictureButton.frame=CGRectMake( j*25+10,i*25+10, 25, 25);
            [pictureButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [beijing addSubview:pictureButton];
            [pictureArray addObject:pictureButton];
            k++;
        }
    }
    
}
-(void)buttonClick:(UIButton *)button
{
    int k=1;
    faceButton=[UIButton buttonWithType:UIButtonTypeCustom];
    faceButton.frame=CGRectMake(110, 300, 100, 100);
    faceButton.backgroundColor=[UIColor cyanColor];
    [self.window addSubview:faceButton];
    for (UIButton * picture in pictureArray){
        if (picture==button){
            [faceButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%03d@2x",k]] forState:UIControlStateNormal];
        }
        k++;
    }
  
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self preparePicture];
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
