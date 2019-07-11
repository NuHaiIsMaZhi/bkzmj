//
//  TodayTaskView.m
//  CoBkzProject
//
//  Created by leo on 2018/6/19.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "TodayTaskView.h"
#import "SDAutoLayout.h"
#import "KNCirclePercentView.h"

#define V_SCALE (float)[UIScreen mainScreen].bounds.size.width/320

@implementation TodayTaskView

-(id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        UIImageView *leftImageView = [UIImageView new];
        leftImageView.image = [UIImage imageNamed:@"todayRWImage"];
        [self addSubview:leftImageView];
        leftImageView.sd_layout.
        leftSpaceToView(self, 10).
        heightIs([UIImage imageNamed:@"todayRWImage"].size.height).
        widthIs([UIImage imageNamed:@"todayRWImage"].size.width).
        topSpaceToView(self, 10);
        
        UILabel *leftTitleLabel = [UILabel new];
        leftTitleLabel.textColor = [UIColor darkGrayColor];
        leftTitleLabel.font = [UIFont systemFontOfSize:14];
        leftTitleLabel.text = @"今日任务";
        leftTitleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:leftTitleLabel];
        leftTitleLabel.sd_layout.
        centerYEqualToView(leftImageView).
        leftSpaceToView(leftImageView, 10).
        autoHeightRatio(0);
        leftTitleLabel.sd_maxWidth = @320;
        
        UIView *lineView = [UIView new];
        lineView.backgroundColor = [UIColor colorWithRed:((226) / 255.0) green:((226) / 255.0) blue:((226) / 255.0)  alpha:1];
        [self addSubview:lineView];
        lineView.sd_layout.
        topSpaceToView(leftImageView, 10).
        leftSpaceToView(self, 0).
        rightSpaceToView(self, 0).
        heightIs(1);
        
        UILabel *titleLabel = [UILabel new];
        titleLabel.textColor = [UIColor darkGrayColor];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.text = @"记单词";
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:titleLabel];
        titleLabel.sd_layout.
        topSpaceToView(lineView, 10).
        leftSpaceToView(self, 10).
        autoHeightRatio(0);
        titleLabel.sd_maxWidth = @320;
 
        [self setProView:titleLabel];
    }
    
    return self;
}

- (void)setProView:(UIView*)wordRemeberLabel{
    
    int totalWord = 0;
    int finishWord = 0;
    int finishGroup = 46;

    CGFloat perWight = 80*V_SCALE;
    
    CGFloat percentWord = 27;
    if (totalWord >0)
        percentWord = finishWord*100/totalWord;
    
    KNCirclePercentView * autoCalculateCircleView = [[KNCirclePercentView alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width/2 - perWight)/2, wordRemeberLabel.frame.origin.y+wordRemeberLabel.frame.size.height+60*V_SCALE, perWight, perWight)];
    [autoCalculateCircleView drawCircleWithPercent:percentWord
                                          duration:2
                                         lineWidth:5
                                         clockwise:YES
                                           lineCap:kCALineCapRound
                                         fillColor:[UIColor clearColor]
                                       strokeColor:[UIColor colorWithRed:((255) / 255.0) green:((91) / 255.0) blue:((96) / 255.0)  alpha:1]
                                    animatedColors:nil];
    autoCalculateCircleView.percentLabel.font = [UIFont systemFontOfSize:15*V_SCALE];
    [autoCalculateCircleView startAnimation];
    [self addSubview:autoCalculateCircleView];

    UILabel *hhhLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, (autoCalculateCircleView.frame.size.height - 15*V_SCALE)/2-8*V_SCALE, autoCalculateCircleView.frame.size.width, 15*V_SCALE)];
    hhhLabel.text = [NSString stringWithFormat:@"%.0f",percentWord];
    hhhLabel.font = [UIFont systemFontOfSize:14*V_SCALE];
    hhhLabel.textColor = [UIColor blackColor];
    hhhLabel.textAlignment = NSTextAlignmentCenter;
    [autoCalculateCircleView addSubview:hhhLabel];
    
    UILabel *xixixifinishLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, hhhLabel.frame.size.height+hhhLabel.frame.origin.y+2*V_SCALE, autoCalculateCircleView.frame.size.width, 10*V_SCALE)];
    xixixifinishLabel.text = @"已完成";
    xixixifinishLabel.font = [UIFont systemFontOfSize:8*V_SCALE];
    xixixifinishLabel.textColor = [UIColor blackColor];
    xixixifinishLabel.textAlignment = NSTextAlignmentCenter;
    [autoCalculateCircleView addSubview:xixixifinishLabel];
    
    UILabel *enenenatitleWordLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, autoCalculateCircleView.frame.origin.y+autoCalculateCircleView.frame.size.height+5*V_SCALE, [UIScreen mainScreen].bounds.size.width/2, 20*V_SCALE)];
    enenenatitleWordLabel.text = @"单词";
    enenenatitleWordLabel.font = [UIFont systemFontOfSize:14*V_SCALE];
    enenenatitleWordLabel.textColor = [UIColor blackColor];
    enenenatitleWordLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:enenenatitleWordLabel];
    
    KNCirclePercentView * autoCalculateCircleView2 = [[KNCirclePercentView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2+([UIScreen mainScreen].bounds.size.width/2 - perWight)/2, wordRemeberLabel.frame.origin.y+wordRemeberLabel.frame.size.height+60*V_SCALE, perWight, perWight)];
    [autoCalculateCircleView2 drawCircleWithPercent:finishGroup
                                           duration:2
                                          lineWidth:5
                                          clockwise:YES
                                            lineCap:kCALineCapRound
                                          fillColor:[UIColor clearColor]
                                        strokeColor:[UIColor colorWithRed:((255) / 255.0) green:((91) / 255.0) blue:((96) / 255.0)  alpha:1]
                                     animatedColors:nil];
    autoCalculateCircleView2.percentLabel.font = [UIFont systemFontOfSize:15*V_SCALE];
    [autoCalculateCircleView2 startAnimation];
    [self addSubview:autoCalculateCircleView2];
    
    UILabel *lllLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, (autoCalculateCircleView.frame.size.height - 15*V_SCALE)/2-8*V_SCALE, autoCalculateCircleView.frame.size.width, 15*V_SCALE)];
    lllLabel.text = [NSString stringWithFormat:@"%d",finishGroup];
    lllLabel.font = [UIFont systemFontOfSize:14*V_SCALE];
    lllLabel.textColor = [UIColor blackColor];
    lllLabel.textAlignment = NSTextAlignmentCenter;
    [autoCalculateCircleView2 addSubview:lllLabel];
    
    UILabel *jijijiLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, hhhLabel.frame.size.height+hhhLabel.frame.origin.y+2*V_SCALE, autoCalculateCircleView2.frame.size.width, 10*V_SCALE)];
    jijijiLabel.text = @"已完成";
    jijijiLabel.font = [UIFont systemFontOfSize:8*V_SCALE];
    jijijiLabel.textColor = [UIColor blackColor];
    jijijiLabel.textAlignment = NSTextAlignmentCenter;
    [autoCalculateCircleView2 addSubview:jijijiLabel];
    
    UILabel *groupTitleWordLabel = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2, autoCalculateCircleView2.frame.origin.y+autoCalculateCircleView2.frame.size.height+5*V_SCALE, [UIScreen mainScreen].bounds.size.width/2, 20*V_SCALE)];
    groupTitleWordLabel.text = @"词组";
    groupTitleWordLabel.font = [UIFont systemFontOfSize:13*V_SCALE];
    groupTitleWordLabel.textColor = [UIColor blackColor];
    groupTitleWordLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:groupTitleWordLabel];

    [self setupAutoHeightWithBottomView:enenenatitleWordLabel bottomMargin:20];

}

@end
