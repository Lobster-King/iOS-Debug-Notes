//
//  ViewController.m
//  NSNotification_Keng_1
//
//  Created by qinzhiwei on 15/7/9.
//  Copyright (c) 2015年 syswin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //NSNotificationCenter第一坑
    
    NSLog(@"current thread:%@",[NSThread currentThread]);
    
    //在主线程中注册通知并转发消息
    //add observer in main thread and deal in main thread
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"current thread:%@",[NSThread currentThread]);
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:@"notificaiton_1" object:nil];
    });

    //在子线程中发送通知
    //post notification in another thread not in the same thread as main
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
        [[NSNotificationCenter defaultCenter] postNotificationName:@"notificaiton_1" object:nil];
        
    });
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
//question:this method will never be called
- (void)handleNotification:(NSNotification *)notification{
    //处理通知
    //handle notification here
    
    NSLog(@"current thread:%@",[NSThread currentThread]);
    
    NSLog(@"handle notification");
    
}

- (void)dealloc{
    //remove notification in dealloc method
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
/**
 *  @author 秦志伟, 15-07-09 17:07:26
 *
 *  some notes
 *  1.you should never attempt to post a
 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
