//
//  WordInfoView.m
//  CoBkzProject
//
//  Created by leo on 2018/6/26.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "WordInfoView.h"
#import "SDAutoLayout.h"
#import <AVFoundation/AVFoundation.h>

@implementation WordInfoView{
    
    AVAudioPlayer*_mp3Player;

    UILabel *firstTitleLabel;
    UIView *firstView;
    UILabel *firstLabel;
    
    UIView *lijuView;
    UILabel *lijuTitleLabel;
    UIButton *lijuVoiceButton;
    UILabel *lijuLabel;
    UILabel *lijuCheseLanbel;
    
    UIView *zhujiView;
    UILabel *zhujiTitleLabel;
    UILabel *zhujiLabel;
}

- (id)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {

        firstView = [UIView new];
        firstView.backgroundColor = [UIColor whiteColor];
        [self addSubview:firstView];
        firstView.sd_layout.
        topSpaceToView(self, 10).
        leftSpaceToView(self, 0).
        rightSpaceToView(self, 0).
        heightIs(35);

        firstTitleLabel = [UILabel new];
        firstTitleLabel.textColor = [UIColor colorWithRed:((255) / 255.0) green:((91) / 255.0) blue:((96) / 255.0)  alpha:1];
        firstTitleLabel.text = @"词义";
        firstTitleLabel.font = [UIFont systemFontOfSize:14];
        [firstView addSubview:firstTitleLabel];
        firstTitleLabel.sd_layout.
        leftSpaceToView(firstView, 10).
        centerYEqualToView(firstView).
        autoHeightRatio(0);
        firstTitleLabel.sd_maxWidth = @320;

        firstLabel = [UILabel new];
        firstLabel.textAlignment = NSTextAlignmentLeft;
        firstLabel.textColor = [UIColor blackColor];
        firstLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:firstLabel];
        firstLabel.sd_layout.
        topSpaceToView(firstView, 10).
        leftSpaceToView(self, 10).
        rightSpaceToView(self, 10).
        autoHeightRatio(0);

        lijuView = [UIView new];
        lijuView.backgroundColor = [UIColor whiteColor];
        [self addSubview:lijuView];
        lijuView.sd_layout.
        topSpaceToView(firstLabel, 10).
        leftSpaceToView(self, 0).
        rightSpaceToView(self, 0).
        heightIs(35);

        lijuTitleLabel = [UILabel new];
        lijuTitleLabel.text = @"例句";
        lijuTitleLabel.textColor = [UIColor colorWithRed:((255) / 255.0) green:((91) / 255.0) blue:((96) / 255.0)  alpha:1];
        lijuTitleLabel.font = [UIFont systemFontOfSize:14];
        [lijuView addSubview:lijuTitleLabel];
        lijuTitleLabel.sd_layout.
        leftSpaceToView(lijuView, 10).
        centerYEqualToView(lijuView).
        autoHeightRatio(0);
        lijuTitleLabel.sd_maxWidth = @320;
        
        lijuVoiceButton = [UIButton new];
        [lijuVoiceButton addTarget:self action:@selector(sendVoice) forControlEvents:UIControlEventTouchUpInside];
        [lijuVoiceButton setImage:[UIImage imageNamed:@"spuceImage"] forState:UIControlStateNormal];
        [lijuView addSubview:lijuVoiceButton];
        lijuVoiceButton.sd_layout.
        centerYEqualToView(lijuView).
        leftSpaceToView(lijuTitleLabel, 10).
        heightIs(25).
        widthIs(25);
        
        lijuLabel = [UILabel new];
        lijuLabel.textColor = [UIColor blackColor];
        lijuLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:lijuLabel];
        lijuLabel.sd_layout.
        topSpaceToView(lijuView, 10).
        leftSpaceToView(self, 10).
        rightSpaceToView(self, 10).
        autoHeightRatio(0);

        lijuCheseLanbel = [UILabel new];
        lijuCheseLanbel.textColor = [UIColor blackColor];
        lijuCheseLanbel.font = [UIFont systemFontOfSize:14];
        [self addSubview:lijuCheseLanbel];
        lijuCheseLanbel.sd_layout.
        topSpaceToView(lijuLabel, 10).
        leftSpaceToView(self, 10).
        rightSpaceToView(self, 10).
        autoHeightRatio(0);

        zhujiView = [UIView new];
        zhujiView.backgroundColor = [UIColor whiteColor];
        [self addSubview:zhujiView];
        zhujiView.sd_layout.
        topSpaceToView(lijuCheseLanbel, 10).
        leftSpaceToView(self, 0).
        rightSpaceToView(self, 0).
        heightIs(35);

        zhujiTitleLabel = [UILabel new];
        zhujiTitleLabel.text = @"助记";
        zhujiTitleLabel.textColor = [UIColor colorWithRed:((255) / 255.0) green:((91) / 255.0) blue:((96) / 255.0)  alpha:1];
        zhujiTitleLabel.font = [UIFont systemFontOfSize:14];
        [zhujiView addSubview:zhujiTitleLabel];
        zhujiTitleLabel.sd_layout.
        leftSpaceToView(zhujiView, 10).
        rightSpaceToView(zhujiView, 10).
        centerYEqualToView(zhujiView).
        autoHeightRatio(0);
        
        zhujiLabel = [UILabel new];
        zhujiLabel.textColor = [UIColor blackColor];
        zhujiLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:zhujiLabel];
        zhujiLabel.sd_layout.
        topSpaceToView(zhujiView, 10).
        leftSpaceToView(self, 10).
        rightSpaceToView(self, 10).
        autoHeightRatio(0);
        
        [self setupAutoHeightWithBottomView:zhujiLabel bottomMargin:20];
    }

    return self;
}

- (void)hiddenLabek:(BOOL)hidden{
    
    self.hidden = hidden;
}

- (void)setWordDict:(NSDictionary *)wordDict{
    
    _wordDict = wordDict;
    //词义
    NSString *labelStr = [wordDict objectForKey:@"base"];
    firstLabel.text = labelStr;

    NSString *labelStr4 = [wordDict objectForKey:@"english"];
    lijuLabel.text = labelStr4;

    NSString *labelStr5 =  [wordDict objectForKey:@"chinese"];
    lijuCheseLanbel.text = labelStr5;
    
    NSString *labelStr7 = [wordDict objectForKey:@"helptxt"];
    zhujiLabel.text = labelStr7;
}

- (void)sendVoice{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSString *urlStr = [NSString stringWithFormat:@"http://dict.youdao.com/dictvoice?audio=%@",[self getWordString:[_wordDict objectForKey:@"english"]]];
        
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

@end
