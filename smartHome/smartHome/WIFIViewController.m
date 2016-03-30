//
//  WIFIViewController.m
//  smartHome
//
//  Created by zcznx on 15/11/2.
//  Copyright © 2015年 zhichi. All rights reserved.
//

#import "WIFIViewController.h"
#import "Masonry.h"
#import "WIFIDoneViewController.h"
@interface WIFIViewController ()

@end

@implementation WIFIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        self.view.backgroundColor= [UIColor colorWithRed:0.265 green:0.7 blue:0.45 alpha:1];
    
    UIImageView *imageWIFI=[[UIImageView alloc]init];
    imageWIFI.image=[UIImage imageNamed:@"u25.png"];
    [self.view addSubview:imageWIFI];
    [imageWIFI mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).offset(80);
        make.height.equalTo(@(80));
        make.width.equalTo(@(80));
    }];
    
    UILabel *label1=[[UILabel alloc]init];
    label1.text=@"连接WIFI";
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
    
    UILabel *label2=[[UILabel alloc]init];
    label2.text=@"选择一个可用WIFI让设备接入网络";
    label2.textColor=[UIColor whiteColor];
    label2.font=[UIFont systemFontOfSize:16];
    //label1.backgroundColor=[UIColor redColor];
    label2.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(label1.mas_bottom).offset(5);
        make.height.equalTo(@(20));
        make.width.equalTo(@(300));
    }];

    
    UITextField *tf1=[[UITextField alloc]init];
    tf1.backgroundColor=[UIColor clearColor];
    tf1.placeholder=@"获取WIFI名";
    tf1.layer.borderWidth=1;
    tf1.layer.borderColor=[[UIColor whiteColor]CGColor];
    tf1.layer.cornerRadius=5;
    [self.view addSubview:tf1];
    [tf1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label2.mas_bottom).offset(10);
        make.left.equalTo(self.view.mas_left).offset(60);
        make.right.equalTo(self.view.mas_right).offset(-60);
        make.height.equalTo(@(30));
    }];
    
    UITextField *tf2=[[UITextField alloc]init];
    tf2.backgroundColor=[UIColor clearColor];
    tf2.placeholder=@"WIFI密码";
    tf2.layer.borderWidth=1;
    tf2.layer.borderColor=[[UIColor whiteColor]CGColor];
    tf2.layer.cornerRadius=5;
    [self.view addSubview:tf2];
    [tf2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tf1.mas_bottom).offset(10);
        make.left.equalTo(tf1.mas_left);
        make.right.equalTo(tf1.mas_right);
        make.height.equalTo(@(30));
    }];
    
    UIButton *btnNext=[UIButton buttonWithType:UIButtonTypeSystem];
    [btnNext setTitle:@"下一步" forState:UIControlStateNormal];
    [btnNext setTintColor:[UIColor whiteColor]];
    btnNext.layer.borderColor=[[UIColor whiteColor]CGColor];
    btnNext.layer.borderWidth=1;
    btnNext.layer.cornerRadius=10;
    [btnNext addTarget:self action:@selector(btnNext:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnNext];
    [btnNext mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tf2.mas_left);
        make.right.equalTo(tf2.mas_right);
        make.top.equalTo(tf2.mas_bottom).offset(5);
        make.height.equalTo(@(30));
    }];

    
}
-(void)btnNext:(UIButton *)sender
{
    WIFIDoneViewController *wvc=[[WIFIDoneViewController alloc]init];
    [self.navigationController pushViewController:wvc animated:YES];
}










@end
