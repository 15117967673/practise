//
//  MyTableViewCell.h
//  DBTableView
//
//  Created by Mac on 15-8-11.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
@interface MyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headimage;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *uid;
@property (weak, nonatomic) IBOutlet UILabel *lastactivity;
-(void)customModel:(Model *)model;
@end
