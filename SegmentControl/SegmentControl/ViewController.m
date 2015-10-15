//
//  ViewController.m
//  SegmentControl
//
//  Created by 魏志强 on 15/10/13.
//  Copyright © 2015年 yeelion. All rights reserved.
//

#import "ViewController.h"
#import "MessageViewController.h"

@interface ViewController ()
//@property (nonatomic, retain) MessageViewController* mvc;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    // Do any additional setup after loading the view, typically from a nib.
//    _mvc = [MessageViewController viewControllerFromNIB];
//    
//    [Navi]
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onEnterMessageViewController:(id)sender {
    MessageViewController* msg =  [[MessageViewController alloc]init];
    [self.navigationController pushViewController:msg animated:YES];
//    [self.navigationController pushViewController:[MessageViewController viewControllerFromNIB] animated:YES];
}



@end
