//
//  AnalysisView.m
//  CoBkzProject
//
//  Created by leo on 2018/8/16.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "AnalysisView.h"
#import "SaveObjeModel.h"

@implementation AnalysisView{
    
    UILabel *answerLabel;
    UILabel *translateTitleLabel;
    UILabel *translateLabel;
    
}

- (id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = UIColor.whiteColor;
        
        answerLabel = [UILabel new];
        answerLabel.font = FourThenFont;
        answerLabel.textAlignment = LeftText;
        answerLabel.numberOfLines = 0;
        [self addSubview:answerLabel];
        
        translateTitleLabel = [UILabel new];
        translateTitleLabel.text = @"翻译";
        translateTitleLabel.font = SixThenFont;
        translateTitleLabel.textAlignment = NSTextAlignmentCenter;
        translateTitleLabel.numberOfLines = 0;
        translateTitleLabel.layer.borderColor = UIColor.blackColor.CGColor;
        translateTitleLabel.layer.borderWidth = 1;
        translateTitleLabel.layer.cornerRadius = 2;
        [self addSubview:translateTitleLabel];

        translateLabel = [UILabel new];
        translateLabel.font = FourThenFont;
        translateLabel.textAlignment = LeftText;
        translateLabel.numberOfLines = 0;
        [self addSubview:translateLabel];
        
        answerLabel.sd_layout.
        topSpaceToView(self, 15).
        leftSpaceToView(self, 10).
        rightSpaceToView(self, 10).
        autoHeightRatio(0);
        
        translateTitleLabel.sd_layout.
        topSpaceToView(answerLabel, 15).
        leftSpaceToView(self, 10).
        heightIs(30).
        widthIs(65);
        
        translateLabel.sd_layout.
        topSpaceToView(translateTitleLabel, 10).
        leftSpaceToView(self, 10).
        rightSpaceToView(self, 10).
        autoHeightRatio(0);
        
        [self setupAutoHeightWithBottomView:translateLabel bottomMargin:20];
    }
    
    return self;
}

- (void)setAnalysisDict:(NSDictionary*)dict withMoel:(SaveObjeModel*)model{
    
    answerLabel.text = [NSString stringWithFormat:@"正确答案是%@ ，你的答案是%@",model.rightOptionIDStr,model.optionIDStr];
    
    translateLabel.text = @"默认填充文字";
    NSString *sampleTransStr = dict[@"sampleTrans"];
    if (sampleTransStr != NULL && ![sampleTransStr isKindOfClass:[NSNull class]]) {
        
        translateLabel.text = [dict objectForKey:@"sampleTrans"];
    }
}

- (void)isFinishOver:(BOOL)finish{
    
    if (finish)
        self.hidden = NO;
    else
        self.hidden = YES;    
}


@end
