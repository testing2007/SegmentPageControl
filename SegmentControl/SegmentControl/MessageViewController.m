//
//  MessageViewController.m
//  SegmentControl
//
//  Created by 魏志强 on 15/10/14.
//  Copyright © 2015年 yeelion. All rights reserved.
//

#import "MessageViewController.h"
#import "SystemMessage.h"
#import "MyMessage.h"
#import "Common.h"
#import "SystemMessageCell.h"
//#import "MyMessageCell.h"
//#import "PrivateMessageCell.h"

#define ROWS 10

@interface MessageViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    MessageType _curSelMessageType;
    UIView* _tabViewManager;
}
@property(nonatomic, retain) SystemMessage* sm;
@property(nonatomic, retain) MyMessage* mm;

@end

@implementation MessageViewController

- (void)initNavBar
{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"后退";
    self.navigationItem.backBarButtonItem = backItem;
}


+ (instancetype)viewControllerFromNIB {
    return [[MessageViewController alloc] initWithNibName:NSStringFromClass([self class]) bundle:[NSBundle mainBundle]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//for debuging    self.view.backgroundColor = [UIColor greenColor];
    
    [self initNavBar];
    
    // Do any additional setup after loading the view from its nib.
//    NSArray* arrViews = [[NSBundle mainBundle] loadNibNamed:@"SystemMessage" owner:nil options:nil];
//    _sm = arrViews[0];
//    arrViews = [[NSBundle mainBundle] loadNibNamed:@"MyMessage" owner:nil options:nil];
//    _mm = arrViews[0];
//    NSArray* array = [[NSBundle mainBundle] loadNibNamed:@"SystemMessageCell" owner:nil options:nil];
    long navHeight = 64; //顶部20+导航44
    CGRect tableRC = self.view.frame;
    tableRC.origin.y = tableRC.origin.y+navHeight+_segMsgTab.frame.size.height;
    tableRC.size.height = self.view.frame.size.height-(navHeight+_segMsgTab.frame.size.height);
    
    _curSelMessageType = MessageType_System;
    _segMsgTab.selectedSegmentIndex = _curSelMessageType;
    
    _tabViewManager = [[UIView alloc]initWithFrame:tableRC];
//for debuging    _tabViewManager.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_tabViewManager];
    
    CGRect smRC = tableRC;
    smRC.origin.x = 0;
    smRC.origin.y = 0;
    _sm = [[SystemMessage alloc]initWithFrame:smRC];
    [_tabViewManager addSubview:_sm];
//    [_tabViewManager addSubview:_mm];
    
    _sm.delegate = self;
    _sm.dataSource = self;
    
    [self hideAllMessageExceptCurrentView:_curSelMessageType];
    
    [self onChangeMsgTab:_segMsgTab];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) hideAllMessageExceptCurrentView:(MessageType)curSel
{
    [_tabViewManager.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx!=_curSelMessageType)
        {
            [obj setHidden:YES];
        }
        else
        {
            [obj setHidden:NO];
        }
    }];
}

- (IBAction)onChangeMsgTab:(id)sender {
    UISegmentedControl* segCtl = (UISegmentedControl*)sender;
    if(_curSelMessageType!=segCtl.selectedSegmentIndex)
    {
        _curSelMessageType = segCtl.selectedSegmentIndex;
        [self hideAllMessageExceptCurrentView:_curSelMessageType];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    int nRow = 0;
    switch (_curSelMessageType) {
        case MessageType_System:
            break;
        case MessageType_My:
            break;
        case MessageType_Personal:
            break;
        default:
            break;
    }
    return ROWS;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* retcell = nil;
    switch (_curSelMessageType)
    {
            /*
             MessageType_System=0,
             MessageType_My,
             MessageType_Personal
             //*/
        case MessageType_System:
        {
            static NSString *cellIdentifier = @"SystemMessageCell";
            SystemMessageCell *systemCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
            if (!systemCell) {
                NSArray* array = [[NSBundle mainBundle] loadNibNamed:@"SystemMessageCell" owner:nil options:nil];
                systemCell = (SystemMessageCell *)[array lastObject];

            }
            systemCell.nickNameLabel.text = @"宠你";
            systemCell.messageTitleTextView.text = @"message title 1";
            retcell = systemCell;
        }
            break;
        case MessageType_My:
            break;
        case MessageType_Personal:
            break;
        default:
            break;
    }
    
    return retcell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
