//
//  ViewController.m
//  SegmentControl
//
//  Created by 魏志强 on 15/10/13.
//  Copyright © 2015年 yeelion. All rights reserved.
//

#import "ViewController.h"
#import "SystemMessage/SystemMessageTableViewController.h"
#import "SearchMessage/SearchMessageTableViewController.h"
#import "PrivateMessage/PrivateMessageTableViewController.h"
#import "ARSegmentPageController.h"

@interface ViewController ()
@property (nonatomic, retain) ARSegmentPageController* msgCtl;
@end

@implementation ViewController

-(void)readyForLoadMessage
{
    SystemMessageTableViewController *sysMsg = [[SystemMessageTableViewController alloc] initWithNibName:@"SystemMessageTableViewController" bundle:[NSBundle mainBundle]];
    SearchMessageTableViewController *srhMsg = [[SearchMessageTableViewController alloc] initWithNibName:@"SearchMessageTableViewController" bundle:[NSBundle mainBundle]];
    PrivateMessageTableViewController *priMsg = [[PrivateMessageTableViewController alloc] initWithNibName:@"PrivateMessageTableViewController" bundle:[NSBundle mainBundle]];
    ARSegmentPageController *msgCtl = [[ARSegmentPageController alloc]init];
    [msgCtl setViewControllers:@[sysMsg, srhMsg, priMsg]];
    self.msgCtl = msgCtl;
}

-(void)loadView
{
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    [self readyForLoadMessage];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onEnterMessageViewController:(id)sender {
    [self.navigationController pushViewController:_msgCtl animated:YES];
}

@end
