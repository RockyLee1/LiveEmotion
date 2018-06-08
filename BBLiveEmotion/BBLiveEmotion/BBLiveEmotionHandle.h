//
//  BBLiveEmotionHandle.h
//  BBLiveEmotion
//
//  Created by linzuhan on 2018/6/7.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BBLiveEmotionHandle : NSObject

/* 匹配给定attributedString中的所有emoji，如果匹配到的emoji有本地图片的话会直接换成本地的图片
 *
 * @param attributedString 可能包含表情包的attributedString
 * @param font 表情图片的对齐字体大小
 */
+ (void)replaceEmotionForAttributedString:(NSMutableAttributedString *)attributedString
                                     font:(UIFont *)font;



@end
