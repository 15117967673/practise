//
//  WIFIDoneViewController.m
//  smartHome
//
//  Created by zcznx on 15/11/2.
//  Copyright © 2015年 zhichi. All rights reserved.
//

#import "WIFIDoneViewController.h"
#import "Masonry.h"
#import "MyTabBarController.h"
@interface WIFIDoneViewController ()

@end

@implementation WIFIDoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor= [UIColor colorWithRed:0.265 green:0.7 blue:0.45 alpha:1];
    
    UIImageView *imageWIFI=[[UIImageView alloc]init];
    imageWIFI.image=[UIImage imageNamed:@"u72.png"];
    [self.view addSubview:imageWIFI];
    [imageWIFI mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).offset(80);
        make.height.equalTo(@(80));
        make.width.equalTo(@(80));
    }];
    
    UILabel *label1=[[UILabel alloc]init];
    label1.text=@"连接成功";
    label1.textColor=[UIColor whiteColor];
    label1.font=[UIFont systemFontOfSize:20];
    //label1.backgroundColor=[UIColor redColor];
    label1.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(imageWIFI.mas_bottom).offset(10);
        make.height.equalTo(@(30));
        make.width.equalTo(@(120));
    }];
    
    UIButton *btnNext=[UIButton buttonWithType:UIButtonTypeSystem];
    [btnNext setTitle:@"完成" forState:UIControlStateNormal];
    [btnNext setTintColor:[UIColor whiteColor]];
    btnNext.layer.borderColor=[[UIColor whiteColor]CGColor];
    btnNext.layer.borderWidth=1;
    btnNext.layer.cornerRadius=10;
    [btnNext addTarget:self action:@selector(btnNext:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnNext];
    [btnNext mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(60);
        make.right.equalTo(self.view.mas_right).offset(-60);
        make.top.equalTo(label1.mas_bottom).offset(170);
        make.height.equalTo(@(30));
    }];


}
-(void)btnNext:(UIButton *)sender
{
    MyTabBarController *mvc=[[MyTabBarController alloc]init];
    [self presentViewController:mvc animated:YES completion:nil];
}

@end
