//
//  GielsTableViewCell.h
//  CellAutoGirls
//
//  Created by Mac on 15-8-10.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GielsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *update_time;
@property (weak, nonatomic) IBOutlet UILabel *wbody;
@property (weak, nonatomic) IBOutlet UIImageView *wpic_middle;
@property (weak, nonatomic) IBOutlet UILabel *likes;
@property (weak, nonatomic) IBOutlet UILabel *comments;

@end
