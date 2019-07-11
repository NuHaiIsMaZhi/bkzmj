//
//  QuestionView.m
//  CoBkzProject
//
//  Created by leo on 2018/8/13.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "QuestionView.h"
#import "AnalysisView.h"
#import "BottomButtonView.h"
#import "SaveObjeModel.h"

@implementation QuestionView{
    
    SaveObjeModel *myModel;
    AnalysisView *analysisView;
    BottomButtonView *bottomBtnView;
    UIScrollView *baseScrollView;
    UIView *topView;
    UILabel *titleLabel;
    UILabel *contentLabel;
    UIView *optionView;
    
    NSDictionary *wordDict;
    
    UILabel *currentLabel;
    
}

- (id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        __weak typeof (self)weakSelf = self;
        bottomBtnView = [BottomButtonView new];
        bottomBtnView.backgroundColor = GrayUIColor(246);
        [self addSubview:bottomBtnView];
        [bottomBtnView setSubmitBlock:^{
            
            [weakSelf saveDataAction];
        }];
        
        baseScrollView = [UIScrollView new];
        baseScrollView.showsVerticalScrollIndicator = false;
        baseScrollView.showsHorizontalScrollIndicator = false;
        [self addSubview:baseScrollView];
        
        topView = [UIView new];
        topView.backgroundColor = UIColor.whiteColor;
        [baseScrollView addSubview:topView];
        
        optionView = [UIView new];
        optionView.backgroundColor = UIColor.whiteColor;
        [baseScrollView addSubview:optionView];
        
        analysisView = [[AnalysisView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        [baseScrollView addSubview:analysisView];
        
        titleLabel = [UILabel new];
        titleLabel.font = SixThenFont;
        titleLabel.textAlignment = LeftText;
        titleLabel.numberOfLines = 0;
        [topView addSubview:titleLabel];
        
        contentLabel = [UILabel new];
        contentLabel.font = [UIFont boldSystemFontOfSize:19];
        contentLabel.textAlignment = LeftText;
        contentLabel.numberOfLines = 0;
        [topView addSubview:contentLabel];
        
        bottomBtnView.sd_layout.
        bottomSpaceToView(self, 0).
        leftSpaceToView(self, 0).
        rightSpaceToView(self, 0).
        heightIs(50);
        
        baseScrollView.sd_layout.
        topSpaceToView(self, 0).
        bottomSpaceToView(bottomBtnView, 0).
        leftSpaceToView(self, 0).
        rightSpaceToView(self, 0);
        
        topView.sd_layout.
        topSpaceToView(baseScrollView, 0).
        leftSpaceToView(baseScrollView, 0).
        rightSpaceToView(baseScrollView, 0);
        
        optionView.sd_layout.
        topSpaceToView(topView, 25).
        leftSpaceToView(baseScrollView, 0).
        rightSpaceToView(baseScrollView, 0);
        
        analysisView.sd_layout.
        topSpaceToView(optionView, 25).
        leftSpaceToView(baseScrollView, 0).
        rightSpaceToView(baseScrollView, 0);
        
        titleLabel.sd_layout.
        topSpaceToView(topView, 15).
        leftSpaceToView(topView, 15).
        rightSpaceToView(topView, 15).
        autoHeightRatio(0);
        
        contentLabel.sd_layout.
        topSpaceToView(titleLabel, 10).
        leftSpaceToView(topView, 15).
        rightSpaceToView(topView, 15).
        autoHeightRatio(0);
        
        [topView setupAutoHeightWithBottomView:contentLabel bottomMargin:15];
    }
    
    return self;
}

- (void)setDictWithData:(NSDictionary*)dict{
    
    NSString *wordStr;
    NSString *titleStr;
    wordDict = dict;
    
    __weak typeof (self)weakSelf = self;
    [bottomBtnView setNextBlock:^{
        
        [weakSelf nextAction];
    }];
    
    if ([[dict objectForKey:@"type"]intValue] == 1 || [[dict objectForKey:@"type"]intValue] == 3) {
        
        wordStr = [dict objectForKey:@"words"];
        titleStr = [dict objectForKey:@"guide"];
    }else if ([[dict objectForKey:@"type"]intValue] == 2 || [[dict objectForKey:@"type"]intValue] == 4){
        
        titleStr = [dict objectForKey:@"guide"];
        wordStr = [dict objectForKey:@"english"];
    }
    
    titleLabel.text = titleStr;
    contentLabel.text = wordStr;
    
    [self buildOptionView];
    
    [analysisView setAnalysisDict:wordDict withMoel:myModel];
}

- (void)setSaveModelData:(SaveObjeModel *)model{
    
    myModel = model;
    
    [bottomBtnView isFinishOver:model.isSubMit];
    [analysisView isFinishOver:myModel.isSubMit];
}

- (void)buildOptionView{
    
    for (UIView *view in optionView.subviews) {
        
        [view removeFromSuperview];
    }
    
    UIView *tempView = optionView;
    
    NSArray *optionArray = wordDict[@"groups"];
    NSMutableArray *alphabets = [[NSMutableArray alloc] initWithArray:[[UILocalizedIndexedCollation currentCollation] sectionIndexTitles]];

    for (int i = 0; i<optionArray.count; i++) {
        
        UILabel *optionContentLabel = [UILabel new];
        optionContentLabel.textAlignment = LeftText;
        optionContentLabel.font = SixThenFont;
        optionContentLabel.text = [[optionArray objectAtIndex:i]objectForKey:@"base"];
        [optionView addSubview:optionContentLabel];
        optionContentLabel.sd_layout.
        topSpaceToView(tempView, 25).
        leftSpaceToView(optionView, 60).
        rightSpaceToView(optionView, 15).
        autoHeightRatio(0);
        
        UILabel *optionLabel = [UILabel new];
        optionLabel.tag = 3000 + i;
        optionLabel.textAlignment = NSTextAlignmentCenter;
        optionLabel.font = SixThenFont;
        optionLabel.text = alphabets[i];
        optionLabel.layer.masksToBounds = YES;
        optionLabel.layer.borderWidth = 1;
        optionLabel.layer.borderColor = UIColor.blackColor.CGColor;
        [optionView addSubview:optionLabel];
        optionLabel.sd_layout.
        centerYEqualToView(optionContentLabel).
        leftSpaceToView(optionView, 15).
        heightIs(30).
        widthIs(30);
        optionLabel.sd_cornerRadiusFromWidthRatio = @0.5;
        if (myModel.optionIDStr.length >0 && [myModel.optionIDStr isEqualToString:optionLabel.text]) {
            optionLabel.backgroundColor = MainColor;
        }
        
        UIView *lineView = [UIView new];
        lineView.backgroundColor = Line_COLOR;
        [optionView addSubview:lineView];
        lineView.sd_layout.
        topSpaceToView(optionContentLabel, 25).
        leftSpaceToView(optionView, 15).
        rightSpaceToView(optionView, 0).
        heightIs(1);
        
        UIButton *button = [UIButton new];
        button.tag = 1000 + i;
        [button addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
        [optionView addSubview:button];
        button.sd_layout.
        topSpaceToView(tempView, 0).
        leftSpaceToView(optionView, 0).
        rightSpaceToView(optionView, 0).
        bottomEqualToView(lineView);
        
        tempView = lineView;
        
        if ([optionArray[i][@"correct"] boolValue]) {
            
            myModel.rightOptionIDStr = alphabets[i];
        }
    }
    
    [optionView setupAutoHeightWithBottomView:tempView bottomMargin:0];
    [baseScrollView setupAutoContentSizeWithBottomView:optionView bottomMargin:30];
}

- (void)saveDataAction{
    
    myModel.isSubMit = YES;
    [bottomBtnView isFinishOver:myModel.isSubMit];
    [analysisView isFinishOver:myModel.isSubMit];
    [analysisView setAnalysisDict:wordDict withMoel:myModel];
}

- (void)nextAction{
    
    if (_nextBlock) {
        
       _nextBlock();
        currentLabel = nil;
    }
}

- (void)selectAction:(UIButton*)button{
    
    NSArray *optionArray = wordDict[@"groups"];
    
    myModel.optionIDStr = optionArray[button.tag - 1000][@"id"];
    
    UILabel *label = [optionView viewWithTag:button.tag-1000 + 3000];
    
    if (label.tag != currentLabel.tag) {
        
        currentLabel.backgroundColor = UIColor.whiteColor;
        label.backgroundColor = MainColor;
        
        currentLabel = label;
    }
    
    myModel.optionIDStr = currentLabel.text;
}

@end
