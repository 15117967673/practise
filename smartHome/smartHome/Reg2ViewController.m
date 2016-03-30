//
//  Reg2ViewController.m
//  smartHome
//
//  Created by zcznx on 15/10/30.
//  Copyright © 2015年 zhichi. All rights reserved.
//

#import "Reg2ViewController.h"
#import "Masonry.h"
#import "NSString+Frame.h"
#import "WIFIViewController.h"
@interface Reg2ViewController ()

@end

@implementation Reg2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor= [UIColor colorWithRed:0.265 green:0.7 blue:0.45 alpha:1];
    UILabel *label1=[[UILabel alloc]init];
    label1.text=@"手机激活码";
    label1.font=[UIFont systemFontOfSize:16];
    label1.textColor=[UIColor whiteColor];
    //label1.backgroundColor=[UIColor yellowColor];
    CGSize size1=[label1.text sizeWithAttributes: @{[UIFont systemFontOfSize:16]:NSFontAttributeName}];

    [self.view addSubview:label1];
    //[label1 sizeToFit];
    
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(60);
        make.top.equalTo(self.view.mas_top).offset(80);
        make.height.equalTo(@(size1.height));
        make.width.equalTo(@(100));
    }];
    
    UILabel *label2=[[UILabel alloc]init];
    label2.text=@"手机已发送到您13888888888的手机上";
    //label2.lineBreakMode = NSLineBreakByCharWrapping;
    label2.numberOfLines=0;
    label2.textColor=[UIColor whiteColor];
    //label2.backgroundColor=[UIColor redColor];
    label2.font=[UIFont systemFontOfSize:16];
    float contentHeight = [label2.text heightWithFont:[UIFont systemFontOfSize:16] withinWidth:self.view.frame.size.width-120];
    [self.view addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(60);
        make.top.equalTo(label1.mas_bottom).offset(20);
        make.height.equalTo(@(contentHeight));
        make.width.equalTo(@(self.view.frame.size.width-120));
    }];
    
    UITextField *tf=[[UITextField alloc]init];
    tf.placeholder=@"请输入激活密码";
    tf.layer.borderColor=[[UIColor whiteColor]CGColor];
    tf.layer.borderWidth=1;
    tf.layer.cornerRadius=10;
    tf.font=[UIFont systemFontOfSize:14];
    [self.view addSubview:tf];
    [tf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label2.mas_left);
        make.top.equalTo(label2.mas_bottom).offset(20);
        make.height.equalTo(@(30));
        make.width.equalTo(@(100));
    }];
    
    UIButton *btnActivation=[UIButton buttonWithType:UIButtonTypeSystem];
    [btnActivation setTitle:@"点击激活" forState:UIControlStateNormal];
    [btnActivation setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnActivation.layer.borderWidth=1;
    btnActivation.layer.borderColor=[[UIColor whiteColor]CGColor];
    btnActivation.layer.cornerRadius=15;
    [self.view addSubview:btnActivation];
    [btnActivation mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tf.mas_right).offset(10);
        make.top.equalTo(label2.mas_bottom).offset(20);
        make.height.equalTo(@(30));
        make.width.equalTo(@(100));
    }];
    
    UIButton *btnDone=[UIButton buttonWithType:UIButtonTypeSystem];
    [btnDone setTitle:@"完成" forState:UIControlStateNormal];
    [btnDone setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnDone addTarget:self action:@selector(btnDone:) forControlEvents:UIControlEventTouchUpInside];
    btnDone.layer.borderColor=[[UIColor whiteColor]CGColor];
    btnDone.layer.borderWidth=1;
    btnDone.layer.cornerRadius=10;
    [self.view addSubview:btnDone];
    [btnDone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tf.mas_left);
        make.top.equalTo(tf.mas_bottom).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-60);
        make.height.equalTo(@(30));
    }];
}
-(void)btnDone:(UIButton *)sender
{
    WIFIViewController *wvc=[[WIFIViewController alloc]init];
    [self.navigationController pushViewController:wvc animated:YES];
  
}

@end
