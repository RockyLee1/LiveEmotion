//
//  CustomTextView.m
//  BBLiveEmotionDemo
//
//  Created by linzuhan on 2018/11/22.
//  Copyright © 2018 linzuhan. All rights reserved.
//

#import "CustomTextView.h"

@implementation CustomTextView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (CGRect)caretRectForPosition:(UITextPosition *)position
{
    CGRect originalRect = [super caretRectForPosition:position];

    NSLog(@"%f,%f,%f,%f",originalRect.origin.x,originalRect.origin.y,originalRect.size.width,originalRect.size.height);
    // 为了保证光标上下跳动，写死光标的大小
    originalRect.size.height = 21.f;
    
    return originalRect;
}

@end
