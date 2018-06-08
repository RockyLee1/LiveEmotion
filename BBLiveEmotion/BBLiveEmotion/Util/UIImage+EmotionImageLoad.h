//
//  UIImage+EmotionImageLoad.h
//  BBLiveEmotion
//
//  Created by linzuhan on 2018/6/7.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#define BBLiveEmotionImage(name) [UIImage BBLiveEmotionImageWithName:name]

@interface UIImage (EmotionImageLoad)

+ (UIImage *)BBLiveEmotionImageWithName:(NSString *)name;

@end
