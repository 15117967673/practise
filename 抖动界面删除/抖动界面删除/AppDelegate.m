//
//  AppDelegate.m
//  抖动界面删除
//
//  Created by student on 15-5-15.
//  Copyright (c) 2015年 student. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate
{
    NSMutableArray * viewArray;
    NSMutableArray * buttonArray;
    UIButton * deleteButton;
    NSTimer * timer;
}


-(void)prepareJiemian
{
    viewArray=[[NSMutableArray alloc]init];
    buttonArray=[[NSMutableArray alloc]init];
    deleteButton=[UIButton buttonWithType:UIButtonTypeCustom];
    deleteButton.frame=CGRectMake(110, 325, 100, 100);
    [deleteButton setImage:[UIImage imageNamed:@"Mole02"] forState:UIControlStateNormal];
    [deleteButton addTarget:self action:@selector(douDongKongzhi) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:deleteButton];
    int k=1;
    for (int i=0;i<4;i++){
        for (int j=0;j<4;j++){
            UIView * view=[[UIView alloc]initWithFrame:CGRectMake(20+j*75, 25+i*75, 50, 50)];
            view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:[NSString stringWithFormat:@"%03d@2x",k ]]];
            [self.window addSubview:view];
            k++;
            [viewArray addObject:view];
        }
    }
    for (int i=0;i<16;i++){
        UIButton * button=[UIButton buttonWithType:UIButtonTypeCustom];
        button.frame=CGRectMake(0, 0, 20, 20);
        [button setImage:[UIImage imageNamed:@"btn_tag_delete"] forState:UIControlStateNormal];
        button.hidden=YES;
        [button addTarget:self action:@selector(deletePicture:) forControlEvents:UIControlEventTouchUpInside];
        [buttonArray addObject:button];
        UIView * view=[viewArray objectAtIndex:i];
          [view addSubview:button];
    }
}

-(void)douDongKongzhi
{
    deleteButton.hidden=YES;
  timer= [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(douDong) userInfo:nil repeats:YES];
    [timer setFireDate:[NSDate distantPast]];
     [self fanHui];
    }
-(void)fanHui
{
    
    UIButton * button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(110, 325, 100, 100);
    [button setImage:[UIImage imageNamed:@"Mole04"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(fanhui:) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:button];

}

-(void)fanhui:(UIButton *)button
{
    deleteButton.hidden=NO;
    [timer setFireDate:[NSDate distantFuture]];
    [button removeFromSuperview];
    for (UIButton * xButton in buttonArray){
        xButton.hidden=YES;
    }
}


-(void)douDong
{
    for (int i=0;i<[viewArray count];i++){
        UIView * picture=[viewArray objectAtIndex:i];
        UIButton * button=[buttonArray objectAtIndex:i];
        button.hidden=NO;
        [UIView animateWithDuration:0.1 animations:^{
            picture.transform = CGAffineTransformRotate(picture.transform, M_PI/18);
        }];
        [UIView animateWithDuration:0.1 animations:^{
            picture.transform = CGAffineTransformRotate(picture.transform, -M_PI/18);
        }];
    }
}

-(void)deletePicture:(UIButton *)delButton
{
    for (int i=0;i<[viewArray count];i++){
         UIButton * button=[buttonArray objectAtIndex:i];
        UIView * uiview1=[[UIView alloc]init];
        UIView * view=[viewArray objectAtIndex:i];
        if (button==delButton){
            [view removeFromSuperview];
            for (int j=[viewArray count]-1;j>i;j--){
            UIView * next1View=[viewArray objectAtIndex:j];
            UIView * next2View=[viewArray objectAtIndex:j-1];
                next1View.frame=next2View.frame;
                uiview1.frame=next2View.frame;
                    }
            view.frame=uiview1.frame;
            [buttonArray removeObject:button];
            [viewArray removeObject:view];
            i--;

        }
    }
   
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self prepareJiemian];
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
