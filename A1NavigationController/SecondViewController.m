
//
//  SecondViewController.m
//  A1NavigationController
//
//  Created by Mac on 15-7-20.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

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
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor orangeColor];
    
    [self customBackButtonwithTitle:@"返回上一页" action:@selector(backClick)];
    
    [self customNavigationItem];
    
}
//设置当前页展示在导航条的内容
-(void)customNavigationItem
{
    //1.如果是navigationcontroller就会影响所有页面,navigationitem只针对当前页面有效
    self.navigationItem.hidesBackButton=YES;
    //2.当前页展示在导航条上的title（下一页自带的返回按钮的文字就是当前页title）
    //self.navigationItem.title=@"xixi";
    
    self.navigationItem.title=@"orange";
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    label.text=@"lable";
    label.textAlignment=NSTextAlignmentCenter;
    //3.展示在当前页导航栏正中间的view，设置了这个view以后，title就不显示了
    self.navigationItem.titleView=label;
    //4-1.创建一个导航栏专用按钮
    UIBarButtonItem *aItem=[[UIBarButtonItem alloc]initWithTitle:@"aItem" style:UIBarButtonItemStyleBordered target:self action:@selector(itemClick)];
    //专用按钮展示在当前页导航栏的左面
    self.navigationItem.leftBarButtonItem=aItem;
    //设置专用按钮的文字属性（通过字典）
    [aItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:10],NSFontAttributeName, nil] forState:UIControlStateNormal];
    //4-2.使用图片创建专用按钮（只取图片的轮廓，不去颜色，系统会把不透明的地方渲染掉）
    UIBarButtonItem *bItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"haoyou"] style:UIBarButtonItemStyleBordered target:self action:@selector(itemClick)];
    //self.navigationItem.rightBarButtonItem=bItem;
    //4-3.使用系统自带的风格
    UIBarButtonItem *cItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(itemClick)];
    // self.navigationItem.rightBarButtonItem=cItem;
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame=CGRectMake(0, 0, 30, 30);
    //[btn setTitle:@"666" forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"wo"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(itemClick) forControlEvents:UIControlEventTouchUpInside];
    //4-4.使用一个view创建专用按钮（一般都用btn）
    UIBarButtonItem *dItem=[[UIBarButtonItem alloc]initWithCustomView:btn];
   // self.navigationItem.rightBarButtonItem=dItem;
    //4-5.可以设置一组专用按钮
    self.navigationItem.rightBarButtonItems=[NSArray arrayWithObjects:bItem,cItem,dItem, nil];
    
    /*
    4种方式创建专用按钮
     a,使用字符串创建
     b,使用图片（默认会被渲染，需要注意图片大小的问题）
     c,使用系统自带的风格（说白了就是扎带一个图片）
     d,自定义（一般都用btn）
     */
}
-(void)itemClick
{
    NSLog(@"%s",__func__);
}
-(void)backClick
{
    //通过导航控制器返回到上一页，当前页销毁
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    ThirdViewController *tvc=[[ThirdViewController alloc]init];
    [self.navigationController pushViewController:tvc animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
