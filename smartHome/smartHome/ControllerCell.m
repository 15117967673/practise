//
//  ControllerCell.m
//  smartHome
//
//  Created by zcznx on 15/10/28.
//  Copyright © 2015年 zhichi. All rights reserved.
//

#import "ControllerCell.h"

@implementation ControllerCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)customModel:(ControlModel *)model
{
    _nameLable.text=model.name;
    _timeLable.text=model.time;
    _isOn.on=model.isOn;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    for (UIView *subView in self.subviews) {
        if ([NSStringFromClass([subView class]) isEqualToString:@"UITableViewCellDeleteConfirmationView"]) {
            ((UIView *)[subView.subviews firstObject]).backgroundColor = [UIColor colorWithRed:0.0706 green:0.5490 blue:0.0118 alpha:1];
            ((UILabel *)[subView.subviews lastObject]).font=[UIFont systemFontOfSize:25];
        }
    }
}
- (IBAction)switchClicked:(UISwitch *)sender {
    
    sender.on=!sender.on;
    if(sender.on==NO){
        sender.on=YES;
        
        NSDictionary *dic=[[NSDictionary alloc]initWithObjectsAndKeys:@(sender.tag),@"index.row",@(0),@"flag",nil];
        NSNotification *notification =[NSNotification notificationWithName:@"ControlViewController" object:nil userInfo:dic];
        //通过通知中心发送通知
        [[NSNotificationCenter defaultCenter] postNotification:notification];

//     _nameLable.text=@"请绑定电器";
//     _timeLable.text=@"";
    }else{
        sender.on=NO;
        NSDictionary *dic=[[NSDictionary alloc]initWithObjectsAndKeys:@(sender.tag),@"index.row",@(1),@"flag",nil];
        NSNotification *notification =[NSNotification notificationWithName:@"ControlViewController" object:nil userInfo:dic];
        //通过通知中心发送通知
        [[NSNotificationCenter defaultCenter] postNotification:notification];

//      _nameLable.text=@"绑定电器名称";
//      _timeLable.text=@"绑定时间";
    }
    NSLog(@"sender.tag:%d",sender.tag);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
