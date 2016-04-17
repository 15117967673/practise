//
//  StudentCell.h
//  A1DatebaseWorker
//
//  Created by Mac on 15-8-11.
//  Copyright (c) 2015年 WJ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentModel.h"

@interface StudentCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *ageLabel;

@property (weak, nonatomic) IBOutlet UILabel *numLabel;

- (void)customWithModel:(StudentModel *)sm;

@end
