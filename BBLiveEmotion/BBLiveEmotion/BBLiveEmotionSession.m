//
//  BBLiveEmotionSession.m
//  BBLiveEmotion
//
//  Created by linzuhan on 2018/6/7.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "BBLiveEmotionSession.h"
#import "PPStickerKeyboard.h"
#import "PPStickerDataManager.h"
#import "PPUtil.h"

@interface BBLiveEmotionSession ()<PPStickerKeyboardDelegate>

@property (nonatomic, strong) UIButton *emotionToggleBtn;

@property (nonatomic, strong) PPStickerKeyboard *emotionKeyboard;

@property (nonatomic, strong) NSString *plainText;

@end

@implementation BBLiveEmotionSession

- (instancetype)init
{
    self = [super init];
    if (self) {
        _emotionKeyboardType = BBLiveEmotionKeyboardTypeKeyboard;
        
        // default
        _emotionTextFontSize = 16.f;
        _emotionLineSpacing = 5.f;
        _emotionTextColor = [UIColor pp_colorWithRGBString:@"#3B3B3B"];
    }
    return self;
}

- (void)refreshTextUI
{
    if (self.hostTextView.text.length <= 0) {
        return;
    }
    
    UITextRange *markedTextRange = [self.hostTextView markedTextRange];
    UITextPosition *position = [self.hostTextView positionFromPosition:markedTextRange.start
                                                                offset:0];
    if (position) {
        return; // 正处于输入拼音还未点确定的中间状态
    }
    
    NSRange selectedRange = self.hostTextView.selectedRange;
    
    NSMutableAttributedString *attributedComment = [[NSMutableAttributedString alloc] initWithString:self.plainText
                                                                                          attributes:@{ NSFontAttributeName: [UIFont systemFontOfSize:_emotionTextFontSize],
                                                                                                        NSForegroundColorAttributeName: _emotionTextColor}];
    
    // 匹配表情
    [[PPStickerDataManager sharedInstance] replaceEmojiForAttributedString:attributedComment
                                                                      font:[UIFont systemFontOfSize:_emotionTextFontSize]];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = _emotionLineSpacing;
    [attributedComment addAttribute:NSParagraphStyleAttributeName
                              value:paragraphStyle
                              range:attributedComment.pp_rangeOfAll];
    
    NSUInteger offset = self.hostTextView.attributedText.length - attributedComment.length;
    self.hostTextView.attributedText = attributedComment;
    self.hostTextView.selectedRange = NSMakeRange(selectedRange.location - offset, 0);
}

- (NSString *)plainText
{
    return [self.hostTextView.attributedText pp_plainTextForRange:NSMakeRange(0, self.hostTextView.attributedText.length)];
}

- (PPStickerKeyboard *)emotionKeyboard
{
    if (!_emotionKeyboard) {
        _emotionKeyboard = [[PPStickerKeyboard alloc] init];
        _emotionKeyboard.frame = CGRectMake(0,
                                            0,
                                            CGRectGetWidth([UIScreen mainScreen].bounds),
                                            [self.emotionKeyboard heightThatFits]);
        _emotionKeyboard.delegate = self;
    }
    
    return _emotionKeyboard;
}

- (UIButton *)emotionToggleBtn
{
    if (!_emotionToggleBtn) {
        _emotionToggleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_emotionToggleBtn addTarget:self action:@selector(emotionToggleBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [_emotionToggleBtn setImage:BBLiveEmotionImage(@"icon_expression") forState:UIControlStateNormal];
    }
    
    return _emotionToggleBtn;
}

- (void)emotionToggleBtnClicked:(UIButton *)sender
{
    if (_emotionKeyboardType == BBLiveEmotionKeyboardTypeKeyboard) {
        _emotionKeyboardType = BBLiveEmotionKeyboardTypeEmotion;
        [_emotionToggleBtn setImage:BBLiveEmotionImage(@"icon_keyboard") forState:UIControlStateNormal];
        
        self.hostTextView.inputView = self.emotionKeyboard;
        [self.hostTextView reloadInputViews];
        
    } else if (_emotionKeyboardType == BBLiveEmotionKeyboardTypeEmotion) {
        _emotionKeyboardType = BBLiveEmotionKeyboardTypeKeyboard;
        [_emotionToggleBtn setImage:BBLiveEmotionImage(@"icon_expression") forState:UIControlStateNormal];
        
        self.hostTextView.inputView = nil;
        [self.hostTextView reloadInputViews];
    }
}

#pragma mark - PPStickerKeyboardDelegate

- (void)stickerKeyboard:(PPStickerKeyboard *)stickerKeyboard didClickEmoji:(PPEmoji *)emoji
{
    NSString *description = emoji.emojiDescription;
    
    NSRange selectedRange = self.hostTextView.selectedRange;
    NSString *emojiString = description;
    
    NSMutableAttributedString *emojiAttributedString = [[NSMutableAttributedString alloc] initWithString:emojiString];
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithAttributedString:self.hostTextView.attributedText];
    
    [attributedText replaceCharactersInRange:selectedRange
                        withAttributedString:emojiAttributedString];
    
    self.hostTextView.attributedText = attributedText;
    self.hostTextView.selectedRange = NSMakeRange(selectedRange.location + emojiAttributedString.length, 0);
    
    if (self.hostTextView.delegate && [self.hostTextView.delegate respondsToSelector:@selector(textViewDidChange:)]) {
        [self.hostTextView.delegate textViewDidChange:self.hostTextView];
    }
}

- (void)stickerKeyboardDidClickSendButton:(PPStickerKeyboard *)stickerKeyboard
{
    
}

- (void)stickerKeyboardDidClickDeleteButton:(PPStickerKeyboard *)stickerKeyboard
{
    NSRange selectedRange = self.hostTextView.selectedRange;
    if (selectedRange.location == 0 && selectedRange.length == 0) {
        return;
    }
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithAttributedString:self.hostTextView.attributedText];
    if (selectedRange.length > 0) {
        [attributedText deleteCharactersInRange:selectedRange];
        self.hostTextView.attributedText = attributedText;
        self.hostTextView.selectedRange = NSMakeRange(selectedRange.location, 0);
    } else {
        [attributedText deleteCharactersInRange:NSMakeRange(selectedRange.location - 1, 1)];
        self.hostTextView.attributedText = attributedText;
        self.hostTextView.selectedRange = NSMakeRange(selectedRange.location - 1, 0);
    }
    
    if (self.hostTextView.delegate && [self.hostTextView.delegate respondsToSelector:@selector(textViewDidChange:)]) {
        [self.hostTextView.delegate textViewDidChange:self.hostTextView];
    }
}

@end
