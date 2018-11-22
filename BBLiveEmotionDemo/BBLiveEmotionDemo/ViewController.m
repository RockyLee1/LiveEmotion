//
//  ViewController.m
//  BBLiveEmotionDemo
//
//  Created by linzuhan on 2018/6/6.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "ViewController.h"
#import <BBLiveEmotion/BBLiveEmotion.h>

@interface ViewController ()<UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (strong, nonatomic) BBLiveEmotionSession *session;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textView.font = [UIFont systemFontOfSize:16.f];
    
    self.session = [[BBLiveEmotionSession alloc] init];
    self.session.hostTextView = self.textView;
    
    [self.view addSubview:self.session.emotionToggleBtn];
    self.session.emotionToggleBtn.frame = CGRectMake(100, 100, 30, 30);
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)textViewDidChange:(UITextView *)textView
{
    [self.session refreshTextUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
