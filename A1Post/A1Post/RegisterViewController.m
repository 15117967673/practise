//
//  RegisterViewController.m
//  A1Post
//
//  Created by Mac on 15-8-6.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()<NSURLConnectionDataDelegate,UIAlertViewDelegate>
{
    NSMutableData *_downloadData;
    
    
}
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *passTF;
@property (weak, nonatomic) IBOutlet UITextField *mailTF;

@end

@implementation RegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title=@"register";
}
- (IBAction)btnClick:(id)sender {
    //http:10.0.8.8/sns/my/register.php?username=hhl&password=123&email=hhl@qq.com
    NSURL *url=[NSURL URLWithString:@"http:10.0.8.8/sns/my/register.php"];
    //使用post需要可变的网络请求
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    //设置请求方式为POST
    [request setHTTPMethod:@"POST"];
    //将参数拼接成完整的字符串
    NSString *bodyStr=[NSString stringWithFormat:@"username=%@&password=%@&email=%@",_nameTF.text,_passTF.text,_mailTF.text];
    //将参数拼接成的字符串转成NSData对象
    NSData *bodyData=[bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    //设置请求体（这次post请求的参数）
    [request setHTTPBody:bodyData];
    
    _downloadData=[[NSMutableData alloc]init];
    //启动网络请求
    [NSURLConnection connectionWithRequest:request delegate:self];
    
}
#pragma mark - connection
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _downloadData.length=0;
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_downloadData appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:_downloadData options:0 error:nil];
    UIAlertView *av=[[UIAlertView alloc]initWithTitle:[dic objectForKey:@"code"] message:[dic objectForKey:@"message"] delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil];
    
    if([[dic objectForKey:@"code"]isEqualToString:@"registered"]){
        av.tag=2;
    }
    [av show];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"fail");
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(alertView.tag==2){
        
        if(_block){
            _block(_nameTF.text,_passTF.text);
        }
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
