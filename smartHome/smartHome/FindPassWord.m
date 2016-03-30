//
//  FindPassWord.m
//  smartHome
//
//  Created by zcznx on 15/11/10.
//  Copyright © 2015年 zhichi. All rights reserved.
//

#import "FindPassWord.h"
#import "Masonry.h"
#import "RepeatPassWord.h"
@interface FindPassWord ()
{
    UITextField *tfPhoneNum;
}
@end

@implementation FindPassWord

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor= [UIColor colorWithRed:0.265 green:0.7 blue:0.45 alpha:1];
    
    tfPhoneNum=[[UITextField alloc]init];
    tfPhoneNum.backgroundColor=[UIColor clearColor];
    tfPhoneNum.placeholder=@"请输入登陆密码";
    tfPhoneNum.layer.borderWidth=1;
    tfPhoneNum.layer.borderColor=[[UIColor whiteColor]CGColor];
    tfPhoneNum.layer.cornerRadius=5;
    tfPhoneNum.secureTextEntry=YES;
    [self.view addSubview:tfPhoneNum];
    [tfPhoneNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(30);
        make.right.equalTo(self.view.mas_right).offset(-30);
        make.top.equalTo(self.view.mas_top).offset(100);
        make.height.equalTo(@(35));
    }];
    
    
    UITextField *tfVerificationCode=[[UITextField alloc]init];
    tfVerificationCode.backgroundColor=[UIColor clearColor];
    tfVerificationCode.placeholder=@"请输入验证码";
    tfVerificationCode.layer.borderWidth=1;
    tfVerificationCode.layer.borderColor=[[UIColor whiteColor]CGColor];
    tfVerificationCode.layer.cornerRadius=5;
    [self.view addSubview:tfVerificationCode];
    [tfVerificationCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tfPhoneNum.mas_bottom).offset(20);
        make.left.equalTo(tfPhoneNum.mas_left);
        make.width.equalTo(@(120));
        make.height.equalTo(@(35));
    }];
    
    UIButton *btnGetVerification=[UIButton buttonWithType:UIButtonTypeCustom];
    //[btn setBackgroundImage:[UIImage imageNamed:@"dian"] forState:UIControlStateNormal];
    btnGetVerification.layer.borderColor=[[UIColor whiteColor]CGColor];
    btnGetVerification.layer.borderWidth=1;
    btnGetVerification.layer.cornerRadius=35/2;
    //btn.backgroundColor=[UIColor whiteColor];
    [btnGetVerification setTitle:@"获取验证码" forState:UIControlStateNormal];
    [btnGetVerification setTintColor:[UIColor whiteColor]];
    [self.view addSubview:btnGetVerification];
    [btnGetVerification addTarget:self action:@selector(btnGetVerificationClick:) forControlEvents:UIControlEventTouchUpInside];
    [btnGetVerification mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tfVerificationCode.mas_right).offset(10);
        make.top.equalTo(tfPhoneNum.mas_bottom).offset(20);
        make.width.equalTo(@(110));
        make.height.equalTo(@(35));
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
        make.left.equalTo(tfPhoneNum.mas_left);
        make.right.equalTo(tfPhoneNum.mas_right);
        make.top.equalTo(btnGetVerification.mas_bottom).offset(10);
        make.height.equalTo(@(30));
    }];


}
-(void)btnGetVerificationClick:(UIButton *)sender
{
    NSLog(@"get");
    [sender setTitleColor:[UIColor colorWithRed:0.7569 green:0.7569 blue:0.7373 alpha:1] forState:UIControlStateNormal];
    sender.enabled=NO;
}
-(void)btnNext:(UIButton *)sender
{
    RepeatPassWord *repeatView=[[RepeatPassWord alloc]init];
    [self.navigationController pushViewController:repeatView animated:YES];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}






@end
