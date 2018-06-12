//
//  BBLiveEmotionSession.h
//  BBLiveEmotion
//
//  Created by linzuhan on 2018/6/7.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef NS_ENUM (NSUInteger, BBLiveEmotionKeyboardType) {
    BBLiveEmotionKeyboardTypeUnknown = 0,
    BBLiveEmotionKeyboardTypeEmotion,
    BBLiveEmotionKeyboardTypeKeyboard,
};

@protocol BBLiveEmotionSessionDelegate <NSObject>

@optional

- (BOOL)emotionSessionShouldSelectEmotionWithEmotionImage:(UIImage *)image
                                       emotionDescription:(NSString *)description;

- (void)emotionSessionDidSelectEmotionWithEmotionImage:(UIImage *)image
                                    emotionDescription:(NSString *)description;

- (void)emotionSessionDidClickedDeleteButton;

@end

@interface BBLiveEmotionSession : NSObject

@property (nonatomic, assign) BBLiveEmotionKeyboardType emotionKeyboardType;

@property (nonatomic, strong) UITextView *hostTextView;
@property (nonatomic, strong, readonly) UIButton *emotionToggleBtn;
@property (nonatomic, strong, readonly) NSString *plainText;

@property (nonatomic, weak) id<BBLiveEmotionSessionDelegate>delegate;

// config
@property (nonatomic, assign) CGFloat emotionTextFontSize;
@property (nonatomic, assign) CGFloat emotionLineSpacing;
@property (nonatomic, strong) UIColor *emotionTextColor;

- (void)refreshTextUI;

- (void)changeEmotionToggleBtnTypeWithKeyboardType:(BBLiveEmotionKeyboardType)keyboardType;

@end
