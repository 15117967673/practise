//
//  TableViewCell.h
//  WeekNo
//
//  Created by zcznx on 15/11/12.
//  Copyright © 2015年 znx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UIImageView *crossImage;
@property(nonatomic,assign)NSInteger index;
-(void)customModel:(Model *)model;
@end
