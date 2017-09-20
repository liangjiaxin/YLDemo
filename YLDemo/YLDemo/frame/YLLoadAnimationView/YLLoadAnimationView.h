//
//  YLLoadAnimationView.h
//  YLDemo
//
//  Created by 小江 on 2017/9/19.
//  Copyright © 2017年 jx.l. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YLLoadAnimationView : UIImageView

/**图片前缀名（后面用_0，例如image_0。这里就传image.从0开始）*/
@property (nonatomic, copy) NSString *imageName;

/**图片数量*/
@property (nonatomic, assign) NSInteger imageNumber;

/**加载图片*/
- (void)loadImage;

@end
