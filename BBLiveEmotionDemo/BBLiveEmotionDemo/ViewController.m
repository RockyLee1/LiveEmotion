//
//  ViewController.m
//  BBLiveEmotionDemo
//
//  Created by linzuhan on 2018/6/6.
//  Copyright © 2018年 linzuhan. All rights reserved.
//

#import "ViewController.h"
#import <BBLiveEmotion/BBLiveEmotion.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (strong, nonatomic) PPStickerKeyboard *keyboard;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (PPStickerKeyboard *)keyboard
{
    if (!_keyboard) {
        _keyboard = [[PPStickerKeyboard alloc] init];
        _keyboard.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), [self.keyboard heightThatFits]);
    }
    
    return _keyboard;
}

- (IBAction)changeBtnClicked:(UIButton *)sender
{
    if ([[sender titleForState:UIControlStateNormal] isEqualToString:@"表情"]) {
        [sender setTitle:@"键盘" forState:UIControlStateNormal];
        
        self.textField.inputView = self.keyboard;
        [self.textField reloadInputViews];
    } else {
        [sender setTitle:@"表情" forState:UIControlStateNormal];
        
        self.textField.inputView = nil;
        [self.textField reloadInputViews];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
