//
//  DatePickerViewController.m
//  RLZNC
//
//  Created by zcznx on 15/11/6.
//  Copyright © 2015年 赵乃学. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
{
    NSMutableArray *_dataArr;
}
@end

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _dataArr=[[NSMutableArray alloc]init];
    NSArray *array=@[@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日"];
    for (int i=0; i<array.count; i++) {
        [_dataArr addObject:[array objectAtIndex:i]];
        //NSLog(@"_dataarr:%@",[_dataArr objectAtIndex:i]);
        NSLog(@"wefx");
    }

    NSLog(@"dataArr:%@",_dataArr);
    UIPickerView *date=[[UIPickerView alloc]init];
    [self.view addSubview:date];
    
    date.frame=self.view.frame;
    //date.backgroundColor=[UIColor redColor];

    date.dataSource=self;
    date.delegate=self;
    
}
#pragma mark - UIPickerViewDataSource
// 返回pickerView一共有多少列
- (NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// 返回pickerView的第component列有多少行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _dataArr.count;
}
#pragma mark - UIPickerViewDelegate
// 返回第component列的第row行显示什么内容 单纯文字
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return [_dataArr objectAtIndex:row];
}
// 返回第component列的第row行需要显示的视图
// 当一个view进入视野范围内的时候调用
// 当系统调用该方法的时候会自动传入可重用的view  可以使用自定义视图
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    return nil;
}

// 当选中了pickerView的某一行的时候调用
// 会将选中的列号和行号作为参数传入
// 只有通过手指选中某一行的时候才会调用

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"wwwwww");
}

//[objc] view plaincopy在CODE上查看代码片派生到我的代码片
// 返回第component列每一行的高度

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 30;
}








@end
