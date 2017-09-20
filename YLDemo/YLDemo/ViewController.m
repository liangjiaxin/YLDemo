//
//  ViewController.m
//  YLDemo
//
//  Created by 小江 on 2017/9/19.
//  Copyright © 2017年 jx.l. All rights reserved.
//

#import "ViewController.h"
#import "YLLoadAnimationView.h"
#import "JX_GCDTimerManager.h"

@interface ViewController ()

@property (nonatomic, strong) JX_GCDTimerManager *timerManager;

@end

static NSString * const myTimer = @"MyTimer";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _countDownBtn.layer.cornerRadius = 4;
    
    //加载动画
    [self loadImageAnimation];
    
    //GCD定时器
    [self loadGCDTimerManager];
    
}

//加载动画
- (void)loadImageAnimation {
    
    YLLoadAnimationView *loadAnimationView = [[YLLoadAnimationView alloc] initWithFrame:CGRectMake(40, 100, 100, 100)];
    [self.view addSubview:loadAnimationView];
    
    //图片名称前缀
    loadAnimationView.imageName = @"mic";
    //图片数量
    loadAnimationView.imageNumber = 8;
    //动画执行时间
    loadAnimationView.animationDuration = 3;
    //加载图片
    [loadAnimationView loadImage];
    //开始动画
    [loadAnimationView startAnimating];
    
}

//GCD定时器
- (void)loadGCDTimerManager {
    __weak typeof(self) weakSelf = self;
    [[JX_GCDTimerManager sharedInstance] scheduledDispatchTimerWithName:myTimer
                                                           timeInterval:2.0
                                                                  queue:nil
                                                                repeats:YES
                                                           actionOption:AbandonPreviousAction
                                                                 action:^{
                                                                     [weakSelf doSomething];
                                                                 }];
    
}

- (void)doSomething {
    NSLog(@"666");
}


- (void)dealloc {
    
    //撤销定时器
    [_countDownBtn invalidate];
    //撤销timer
    [[JX_GCDTimerManager sharedInstance] cancelTimerWithName:myTimer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
