//
//  MyWordViewController.m
//  CoBkzProject
//
//  Created by leo on 2018/6/26.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "MyWordViewController.h"
#import "SDAutoLayout.h"
#import "WordInfoView.h"
#import <AVFoundation/AVFoundation.h>

@interface MyWordViewController ()

@end

@implementation MyWordViewController{
    
    AVAudioPlayer*_mp3Player;

    UIButton *lijuVoiceButton;
    UILabel *topWordLabel;
    UILabel *voiceLabel;
    UIButton *voiceButton;
    
    WordInfoView *infoWord;
    UIScrollView *myScrollView;
    
    UIButton *yesButton;
    UIButton *noButton;
    UIButton *nextButton;
    
    NSDictionary *wordDict;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = [NSString stringWithFormat:@"第%ld组",_number];
    
    self.view.backgroundColor = [UIColor colorWithRed:((246) / 255.0) green:((246) / 255.0) blue:((246) / 255.0)  alpha:1];
    
    topWordLabel = [UILabel new];
    topWordLabel.font = [UIFont boldSystemFontOfSize:24];
    topWordLabel.textAlignment = NSTextAlignmentCenter;
    topWordLabel.textColor = [UIColor blackColor];
    [self.view addSubview:topWordLabel];
    topWordLabel.sd_layout.
    topSpaceToView(self.view, 30+64).
    autoHeightRatio(0).
    centerXEqualToView(self.view);
    topWordLabel.sd_maxWidth = @320;
    
    voiceLabel = [UILabel new];
    voiceLabel.font = [UIFont systemFontOfSize:12];
    voiceLabel.textAlignment = NSTextAlignmentCenter;
    voiceLabel.textColor = [UIColor blackColor];
    [self.view addSubview:voiceLabel];
    voiceLabel.sd_layout.
    topSpaceToView(topWordLabel, 15).
    autoHeightRatio(0).
    centerXEqualToView(self.view);
    voiceLabel.sd_maxWidth = @320;
    
    lijuVoiceButton = [UIButton new];
    [lijuVoiceButton addTarget:self action:@selector(sendVoice) forControlEvents:UIControlEventTouchUpInside];
    [lijuVoiceButton setImage:[UIImage imageNamed:@"spuceImage"] forState:UIControlStateNormal];
    [self.view addSubview:lijuVoiceButton];
    lijuVoiceButton.sd_layout.
    centerYEqualToView(voiceLabel).
    leftSpaceToView(voiceLabel, 5).
    heightIs(25).
    widthIs(25);

    [self buildBottomButton];
    
    myScrollView = [UIScrollView new];
    [self.view addSubview:myScrollView];
    myScrollView.sd_layout.
    topSpaceToView(voiceLabel, 30).
    leftSpaceToView(self.view, 0).
    rightSpaceToView(self.view, 0).
    bottomSpaceToView(yesButton, 10);
    
    infoWord = [[WordInfoView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    infoWord.backgroundColor = [UIColor colorWithRed:((246) / 255.0) green:((246) / 255.0) blue:((246) / 255.0)  alpha:1];
    [myScrollView addSubview:infoWord];
    infoWord.sd_layout.
    topSpaceToView(myScrollView, 0).
    leftSpaceToView(myScrollView, 0).
    rightSpaceToView(myScrollView, 0);
    
    infoWord.wordDict = _dataSourceArray[_index];
    NSString *wordTextStr = [infoWord.wordDict objectForKey:@"word"];
    topWordLabel.text = wordTextStr;
    NSString *voiceStr = [infoWord.wordDict objectForKey:@"phonetic"];
    voiceLabel.text = voiceStr;
    
    [infoWord hiddenLabek:YES];
    
    [myScrollView setupAutoContentSizeWithBottomView:infoWord bottomMargin:30];    
}

- (void)buildBottomButton{
    
    yesButton = [UIButton new];
    [yesButton addTarget:self action:@selector(yesAciton) forControlEvents:UIControlEventTouchUpInside];
    [yesButton setTitle:@"记住了" forState:UIControlStateNormal];
    yesButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [yesButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:yesButton];
    yesButton.sd_layout.
    bottomSpaceToView(self.view, 20).
    leftSpaceToView(self.view, 20).
    widthIs(150).
    heightIs(45);
    yesButton.layer.masksToBounds = YES;
    yesButton.layer.borderColor = [UIColor colorWithRed:((83) / 255.0) green:((196) / 255.0) blue:((25) / 255.0)  alpha:1].CGColor;
    yesButton.layer.borderWidth = 1;
    yesButton.sd_cornerRadius = @4;

    noButton = [UIButton new];
    [noButton addTarget:self action:@selector(noAciton) forControlEvents:UIControlEventTouchUpInside];
    [noButton setTitle:@"没记住" forState:UIControlStateNormal];
    noButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [noButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:noButton];
    noButton.sd_layout.
    bottomSpaceToView(self.view, 20).
    rightSpaceToView(self.view, 20).
    widthIs(150).
    heightIs(45);
    noButton.layer.masksToBounds = YES;
    noButton.layer.borderColor = [UIColor colorWithRed:((255) / 255.0) green:((91) / 255.0) blue:((96) / 255.0)  alpha:1].CGColor;
    noButton.layer.borderWidth = 1;
    noButton.sd_cornerRadius = @4;

    nextButton = [UIButton new];
    [nextButton addTarget:self action:@selector(nextAction) forControlEvents:UIControlEventTouchUpInside];
    nextButton.hidden = YES;
    [nextButton setTitle:@"下一个" forState:UIControlStateNormal];
    nextButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nextButton.backgroundColor = [UIColor colorWithRed:((255) / 255.0) green:((91) / 255.0) blue:((96) / 255.0)  alpha:1];
    [self.view addSubview:nextButton];
    nextButton.sd_layout.
    bottomSpaceToView(self.view, 20).
    rightSpaceToView(self.view, 20).
    leftSpaceToView(self.view, 20).
    heightIs(45);
    nextButton.sd_cornerRadius = @4;
    
}

- (void)yesAciton{
    
    [self nextAction];
    [infoWord hiddenLabek:YES];
}

- (void)noAciton{
    
    nextButton.hidden = NO;
    yesButton.hidden = YES;
    noButton.hidden = YES;
    
    [infoWord hiddenLabek:NO];
}

- (void)nextAction{
    
    nextButton.hidden = YES;
    yesButton.hidden = NO;
    noButton.hidden = NO;
    
    if (_index >= _dataSourceArray.count - 1) {
        
        return;
    }
    _index ++;
    infoWord.wordDict = _dataSourceArray[_index];
    NSString *wordTextStr = [infoWord.wordDict objectForKey:@"word"];
    topWordLabel.text = wordTextStr;
    NSString *voiceStr = [infoWord.wordDict objectForKey:@"phonetic"];
    voiceLabel.text = voiceStr;

    [infoWord hiddenLabek:YES];
}

- (void)sendVoice{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSString *urlStr = [NSString stringWithFormat:@"http://dict.youdao.com/dictvoice?audio=%@",[self getWordString:[infoWord.wordDict objectForKey:@"word"]]];
        
        __block NSData*mp3Data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:urlStr]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            _mp3Player = [[AVAudioPlayer alloc] initWithData:mp3Data error:nil];
            [_mp3Player play];
        });
    });
}

- (NSString*)getWordString:(NSString*)word
{
    NSArray *wordArray = [word componentsSeparatedByString:@" "];
    
    NSMutableString *wordMutableStr = [[NSMutableString alloc]init];
    for (int i = 0; i<[wordArray count]; i++)
    {
        if (i == [wordArray count]-1)
            [wordMutableStr appendFormat:@"%@",[wordArray objectAtIndex:i]];
        else
            [wordMutableStr appendFormat:@"%@%%20",[wordArray objectAtIndex:i]];
    }
    NSString *str = [wordMutableStr copy];
    return str;
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

@end
