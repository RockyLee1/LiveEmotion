//
//  BBLiveEmotionHandle.m
//  BBLiveEmotion
//
//  Created by linzuhan on 2018/6/7.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveEmotionHandle.h"
#import "PPStickerDataManager.h"

@implementation BBLiveEmotionHandle

+ (void)replaceEmotionForAttributedString:(NSMutableAttributedString *)attributedString
                                     font:(UIFont *)font
{
    [[PPStickerDataManager sharedInstance] replaceEmojiForAttributedString:attributedString
                                                                      font:font];
}

+ (NSDictionary <NSString *, __kindof UIImage *>*)liveEmotionMapper
{
    return [[PPStickerDataManager sharedInstance] allEmoticonMapper];
}

@end
