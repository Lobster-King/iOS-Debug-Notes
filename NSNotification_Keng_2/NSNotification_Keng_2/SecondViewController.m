//
//  SecondViewController.m
//  NSNotification_Keng_2
//
//  Created by qinzhiwei on 15/7/9.
//  Copyright (c) 2015年 syswin. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:@"notification_2" object:nil];
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)handleNotification:(NSNotification *)notification{
    
    NSLog(@"handle notification");
    
}

- (void)dealloc{
    //do not remove observer
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
