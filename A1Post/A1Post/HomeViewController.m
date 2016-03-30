//
//  HomeViewController.m
//  A1Post
//
//  Created by Mac on 15-8-6.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "HomeViewController.h"
#import "AFNetworking.h"
@interface HomeViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
    //图片选择控制器
    UIImagePickerController *_ipc;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation HomeViewController

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
    
}
- (IBAction)btnClick:(id)sender {
    if(!_ipc){
        //图片选择控制器（系统相册）
       _ipc=[[UIImagePickerController alloc]init];
    }
    _ipc.delegate=self;
    [self presentViewController:_ipc animated:YES completion:nil];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
   //在相册中点击图片时触发
    NSLog(@"info=%@",info);
    _imageView.image=[info objectForKey:UIImagePickerControllerOriginalImage];
    NSString *urlStr=@"http:10.0.8.8/sns/my/upload_headimage.php";
    
    NSUserDefaults *ud=[NSUserDefaults standardUserDefaults];
    NSString *m_auth=[ud objectForKey:@"token"];
    //参数
    NSDictionary *bodyDic=[NSDictionary dictionaryWithObject:m_auth forKey:@"m_auth"];
    
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
    //启动拥有上传文件功能的post请求
    [manager POST:urlStr parameters:bodyDic constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        //设置需要上传的文件UIImagePNGRepresentation(_imageView.image)将图片转成nsdata
        //第一个参数是需要上传的文件，第二个参数是后台规定的参数名，第三个是文件名，但是后台一般不用，所以意义不大，第四个是文件类型
        [formData appendPartWithFileData:UIImagePNGRepresentation(_imageView.image) name:@"headimage" fileName:@"1.png" mimeType:@"image/png"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
         UIAlertView *av=[[UIAlertView alloc]initWithTitle:[dic objectForKey:@"code"] message:[dic objectForKey:@"message"] delegate:self cancelButtonTitle:@"好" otherButtonTitles:nil];
        [av show];
       // NSLog(@"===%@",dic);
    } failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
     }];
    //返回
    [picker dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
