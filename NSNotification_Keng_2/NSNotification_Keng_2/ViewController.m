//
//  ViewController.m
//  NSNotification_Keng_2
//
//  Created by qinzhiwei on 15/7/9.
//  Copyright (c) 2015年 syswin. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@property (nonatomic, retain) UIButton *customButton;
@property (nonatomic, retain) SecondViewController *sVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _customButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    _customButton.center = self.view.center;
    [_customButton addTarget:self action:@selector(handleAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_customButton];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)handleAction{
    
    _sVC = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:_sVC animated:YES];
    [self performSelector:@selector(handlePostNotification) withObject:nil afterDelay:2.0];
    
}

- (void)handlePostNotification{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notification_2" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
