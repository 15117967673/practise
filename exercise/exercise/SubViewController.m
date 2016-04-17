//
//  SubViewController.m
//  exercise
//
//  Created by Happigo on 14-10-15.
//  Copyright (c) 2014年 HappiVision. All rights reserved.
//

#import "SubViewController.h"

@interface SubViewController ()

@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeThemeNotificantion) name:kThemeDidChangeNotification object:nil];
    
//    [self uiConfig];
    self.view.backgroundColor = [[ThemeManager shareInstance] getColorWithName:@"bgColor"];

}
- (void)changeThemeNotificantion
{
    self.view.backgroundColor = [[ThemeManager shareInstance] getColorWithName:@"bgColor"];
    
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
