//
//  YLCountDownButton.m
//  YLDemo
//
//  Created by 小江 on 2017/9/19.
//  Copyright © 2017年 jx.l. All rights reserved.
//

#import "YLCountDownButton.h"

@interface YLCountDownButton ()
{
    NSInteger num;
}

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation YLCountDownButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadCountDownView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadCountDownView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self loadCountDownView];
    }
    return self;
}


- (void)loadCountDownView {
    
    num = 60;
    self.titleLabel.text = @"发送验证码";
    [self setTitle:@"发送验证码" forState:UIControlStateNormal];
    
    //添加点击监听
    [self addTarget:self action:@selector(touchUpInsideBtn) forControlEvents:UIControlEventTouchUpInside];
    
}

//点击了按钮
- (void)touchUpInsideBtn{
    
    NSLog(@"点击了按钮");
    
    self.enabled = NO;
    self.titleLabel.text = @"60";
    [self setTitle:@"60" forState:UIControlStateNormal];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(countDown:) userInfo:nil repeats:YES];
    
}

//定时器倒计时
- (void)countDown:(NSTimer *)timer {
    
    NSLog(@"倒计时%tu",num);
    
    if (num == 0) {
        
        self.enabled = YES;
        self.titleLabel.text = @"发送验证码";
        [self setTitle:@"发送验证码" forState:UIControlStateNormal];
        num = 60;
        [timer invalidate];
        return;
        
    }
    
    NSString *numString = [NSString stringWithFormat:@"%tu",--num];
    self.titleLabel.text = numString;
    [self setTitle:numString forState:UIControlStateNormal];
    
}

- (void)invalidate {
    
    [_timer invalidate];
    
}

@end
