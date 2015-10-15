//
//  MessageViewController.h
//  SegmentControl
//
//  Created by 魏志强 on 15/10/14.
//  Copyright © 2015年 yeelion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageViewController : UIViewController

+ (instancetype)viewControllerFromNIB;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segMsgTab;


@end
