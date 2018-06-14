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

/* 返回图片和描述的对应字典
 *
 * @param key 图片的对应文字描述 比如：[开心]
 * @param value 图片资源，一个UIImage对象
 */

+ (NSDictionary <NSString *, __kindof UIImage *>*)liveEmotionMapper;

@end
