//
//  PersonalHeadCell.h
//  SegmentControl
//
//  Created by 魏志强 on 15/10/16.
//  Copyright © 2015年 yeelion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalHeadCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *albumCoverImageView;
@property (weak, nonatomic) IBOutlet UIImageView *portraitImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *testLabel;

@end
