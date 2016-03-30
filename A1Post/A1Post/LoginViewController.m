//
//  LoginViewController.m
//  A1Post
//
//  Created by Mac on 15-8-6.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "HomeViewController.h"
#import "AFNetworking.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *passTF;

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title=@"login";
    _nameTF.text=@"zhaonaixue";
    _passTF.text=@"0709";
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (IBAction)loginClick:(id)sender {
    //http:10.0.8.8/sns/my/login.php?username=hhl&password=123
    
    NSString *urlStr=@"http:10.0.8.8/sns/my/login.php";
    //afn进行post请求时参数需要放到字典里
    NSDictionary *bodyDic=[NSDictionary dictionaryWithObjectsAndKeys:_nameTF.text,@"username",_passTF.text,@"password", nil];
    //使用afn进行post或get请求需要用到下面这个
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    //设置响应格式（返回的数据是nsdata）
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    //启动post请求,第一个参数是接口部分（问号前部分），第二个参数是请求体（请求的参数）
    //后面两个block,一个是成功的回调，一个是失败的回调
    
    [manager POST:urlStr parameters:bodyDic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        //如果登陆成功直接跳转
        if([[dic objectForKey:@"code"]isEqualToString:@"login_success"]){
            //将用户身份信息取出
            NSString *m_auth=[dic objectForKey:@"m_auth"];
            NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
            //保存到userdefault里
            [ud setObject:m_auth forKey:@"token"];
            //同步信息
            [ud synchronize];
            
            HomeViewController *hvc=[[HomeViewController alloc]init];
            [self.navigationController pushViewController:hvc animated:YES];
        }else{
            //如果登陆不成功就弹个警告框
            UIAlertView *av=[[UIAlertView alloc]initWithTitle:[dic objectForKey:@"code"] message:[dic objectForKey:@"message"] delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil];
            [av show];

        }
                 //"m_auth"对应的是一个用户
        NSLog(@"==%@",dic);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        NSLog(@"fail");
    }];
 
}
- (IBAction)registerClick:(id)sender {
    RegisterViewController *rvc=[[RegisterViewController alloc]init];
    rvc.block=^(NSString *nameStr, NSString *passStr) {
        _nameTF.text=nameStr;
        _passTF.text=passStr;
    };
    [self.navigationController pushViewController:rvc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
