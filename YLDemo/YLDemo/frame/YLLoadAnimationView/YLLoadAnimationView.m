//
//  YLLoadAnimationView.m
//  YLDemo
//
//  Created by 小江 on 2017/9/19.
//  Copyright © 2017年 jx.l. All rights reserved.
//

#import "YLLoadAnimationView.h"

@implementation YLLoadAnimationView

- (void)loadImage {
    
    //加载图片
    NSMutableArray *ary = [NSMutableArray new];
    for (NSInteger i = 0; i<_imageNumber; i++) {
        NSString *name = [NSString stringWithFormat:@"%@_%tu",_imageName,i];
        UIImage *image = [UIImage imageNamed:name];
        if (image) {
            [ary addObject:image];
        }
    }
    
    //设置图片的序列帧
    self.animationImages = ary;
    
    //动画重复次数,0表示无限重复
    self.animationRepeatCount = 0;
    
}

@end
