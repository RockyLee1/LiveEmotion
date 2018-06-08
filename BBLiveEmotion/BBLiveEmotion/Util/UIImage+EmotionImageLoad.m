//
//  UIImage+EmotionImageLoad.m
//  BBLiveEmotion
//
//  Created by linzuhan on 2018/6/7.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "UIImage+EmotionImageLoad.h"

@implementation UIImage (EmotionImageLoad)

+ (NSBundle *)BBLiveSDKResourceBundle
{
    static NSBundle *bundle = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        bundle = [NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:@"BBLiveEmotionResource" withExtension:@"bundle"]];
    });
    
    return bundle;
}

+ (UIImage *)BBLiveEmotionImageWithName:(NSString *)name
{
    return [UIImage imageNamed:name inBundle:[self BBLiveSDKResourceBundle] compatibleWithTraitCollection:nil];
}

@end
