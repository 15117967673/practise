//
//  ViewController.m
//  WeekNo
//
//  Created by zcznx on 15/11/12.
//  Copyright © 2015年 znx. All rights reserved.
//

#import "ViewController.h"
#import "WeekViewController.h"
@interface ViewController ()<WeekViewControllerDelegate>
@property(nonatomic,copy)UILabel *time;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _time=[[UILabel alloc]initWithFrame:CGRectMake(10, 100, 300, 50)];
    if([[NSUserDefaults standardUserDefaults]objectForKey:@"time"]){
        _time.text=[[NSUserDefaults standardUserDefaults]objectForKey:@"time"];
    }else{
        _time.text=@"";
    }

    _time.backgroundColor=[UIColor yellowColor];
    _time.textAlignment=NSTextAlignmentLeft;
    [self.view addSubview:_time];
    _time.userInteractionEnabled=YES;
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [_time addGestureRecognizer:tap];
    
    //如果已经获得发送通知的授权则创建本地通知，否则请求授权(注意：如果不请求授权在设置中是没有对应的通知设置项的，也就是说如果从来没有发送过请求，即使通过设置也打不开消息允许设置)
    if ([[UIApplication sharedApplication]currentUserNotificationSettings].types!=UIUserNotificationTypeNone) {
        [self addLocalNotification];
//        [self addLocalNotification2];
//        [self addLocalNotification3];
//        [self addLocalNotification4];
    }else{
        [[UIApplication sharedApplication]registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound  categories:nil]];
    }
}
#pragma mark 调用过用户注册通知方法之后执行（也就是调用完registerUserNotificationSettings:方法之后执行）
-(void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings{
    if (notificationSettings.types!=UIUserNotificationTypeNone) {
        [self addLocalNotification];
//        [self addLocalNotification2];
//        [self addLocalNotification3];
//        [self addLocalNotification4];
    }
}
-(void)addLocalNotification{
    
    //定义本地通知对象
    UILocalNotification *notification=[[UILocalNotification alloc]init];
    //设置调用时间
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH:mm"];
    NSDate *date=[formatter dateFromString:_time.text];
    NSLog(@"date:%@",[formatter stringFromDate:date]);
    // notification.fireDate=[NSDate dateWithTimeIntervalSinceNow:5.0];//通知触发的时间，10s以后
    notification.fireDate=date;
    NSLog(@"具体启动的时间：%@", notification.fireDate);
    
    notification.repeatInterval=NSCalendarUnitDay;
    //通知重复次数
    //notification.repeatCalendar=[NSCalendar currentCalendar];//当前日历，使用前最好设置时区等信息以便能够自动同步时间
    //设置通知属性
    notification.alertBody=@"每天某时发消息"; //通知主体
    notification.applicationIconBadgeNumber=1;//应用程序图标右上角显示的消息数
    notification.alertAction=@"打开应用"; //待机界面的滑动动作提示
    notification.alertLaunchImage=@"Default";//通过点击通知打开应用时的启动图片,这里使用程序启动图片
    //notification.soundName=UILocalNotificationDefaultSoundName;//收到通知时播放的声音，默认消息声音
    notification.soundName=@"msg.caf";//通知声音（需要真机才能听到声音）
    //设置用户信息
    notification.userInfo=@{@"id":@1,@"user":@"Kenshin Cui"};//绑定到通知上的其他附加信息
    //调用通知
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}
-(void)tap:(UITapGestureRecognizer *)sender
{
    WeekViewController *weekView=[[WeekViewController alloc]init];
    weekView.delegate=self;
    [self.navigationController pushViewController:weekView animated:YES];
}
-(void)timeLabel:(NSMutableArray *)array
{
    _time.text=@"";
    for(int i=0;i<[array count];i++){
        _time.text=[_time.text stringByAppendingString:array[i]];
        if(i!=[array count]-1){
          _time.text=[_time.text stringByAppendingString:@","];
        }
    }
    
    [[NSUserDefaults standardUserDefaults]setObject:_time.text forKey:@"time"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
