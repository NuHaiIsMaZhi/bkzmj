//
//  TopView.m
//  CoBkzProject
//
//  Created by leo on 2018/6/19.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "TopView.h"
#import "SDAutoLayout.h"

@implementation TopView

- (id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        UIImageView *baseImageView = [UIImageView new];
        baseImageView.image = [UIImage imageNamed:@"TopBackImage"];
        [self addSubview:baseImageView];
        baseImageView.sd_layout.
        topSpaceToView(self, 0).
        leftSpaceToView(self, 0).
        rightSpaceToView(self, 0).
        heightIs([UIImage imageNamed:@"TopBackImage"].size.height);
        
        [self dayView:baseImageView];
        
        UILabel *titleLabel = [UILabel new];
        titleLabel.textColor = [UIColor darkGrayColor];
        titleLabel.font = [UIFont systemFontOfSize:12];
        titleLabel.text = @"任务完成度";
        titleLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:titleLabel];
        titleLabel.sd_layout.
        topSpaceToView(baseImageView, 5).
        leftSpaceToView(self, 40).
        autoHeightRatio(0);
        titleLabel.sd_maxWidth = @320;
        
        UIView *progressView = [UIView new];
        progressView.backgroundColor = [UIColor colorWithRed:((246) / 255.0) green:((246) / 255.0) blue:((246) / 255.0)  alpha:1];
        [self addSubview:progressView];
        progressView.sd_layout.
        topSpaceToView(titleLabel, 5).
        leftSpaceToView(self, 40).
        rightSpaceToView(self, 40).
        heightIs(8);
        progressView.sd_cornerRadiusFromHeightRatio = @0.5;
        
        UIView *lineView = [UIView new];
        lineView.backgroundColor = [UIColor colorWithRed:((226) / 255.0) green:((226) / 255.0) blue:((226) / 255.0)  alpha:1];
        [self addSubview:lineView];
        lineView.sd_layout.
        topEqualToView(titleLabel).
        rightSpaceToView(titleLabel, 5).
        widthIs(1).
        heightIs(28);
        
        UIImageView *leftImageView = [UIImageView new];
        leftImageView.image = [UIImage imageNamed:@"finishaImage"];
        [self addSubview:leftImageView];
        leftImageView.sd_layout.
        centerYEqualToView(lineView).
        leftSpaceToView(self, 10).
        widthIs([UIImage imageNamed:@"finishaImage"].size.width).
        heightIs([UIImage imageNamed:@"finishaImage"].size.height);
        
        UILabel *proLabel = [UILabel new];
        proLabel.textColor = [UIColor colorWithRed:((255) / 255.0) green:((91) / 255.0) blue:((95) / 255.0)  alpha:1];
        proLabel.font = [UIFont systemFontOfSize:12];
        proLabel.text = @"0%";
        proLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:proLabel];
        proLabel.sd_layout.
        centerYEqualToView(progressView).
        rightSpaceToView(self, 10).
        autoHeightRatio(0);
        proLabel.sd_maxWidth = @320;
        
        [self setupAutoHeightWithBottomView:progressView bottomMargin:20];
    }
    
    return self;
}

- (void)dayView:(UIView*)superView{
    
    UIImageView *baseView = [UIImageView new];
    baseView.image = [UIImage imageNamed:@"SingImage"];
    [superView addSubview:baseView];
    baseView.sd_layout.
    centerXEqualToView(superView).
    widthIs([UIImage imageNamed:@"SingImage"].size.width).
    heightIs([UIImage imageNamed:@"SingImage"].size.height).
    bottomSpaceToView(superView, 20);
    
    UILabel *proLabel = [UILabel new];
    proLabel.textColor = [UIColor colorWithRed:((255) / 255.0) green:((91) / 255.0) blue:((95) / 255.0)  alpha:1];
    proLabel.font = [UIFont fontWithName:@"AmericanTypewriter" size:42];
    proLabel.textColor = [UIColor colorWithRed:((255) / 255.0) green:((91) / 255.0) blue:((95) / 255.0)  alpha:1];
    proLabel.text = @"7";
    proLabel.textAlignment = NSTextAlignmentCenter;
    [baseView addSubview:proLabel];
    proLabel.sd_layout.
    centerXEqualToView(baseView).
    centerYEqualToView(baseView).
    autoHeightRatio(0);
    proLabel.sd_maxWidth = @320;
    
    UIButton *singButton = [UIButton new];
    [singButton setTitle:@"学习天数" forState:UIControlStateNormal];
    singButton.titleLabel.font = [UIFont systemFontOfSize:13];
    [singButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    singButton.layer.masksToBounds = YES;
    singButton.backgroundColor = [UIColor colorWithRed:((255) / 255.0) green:((151) / 255.0) blue:((49) / 255.0)  alpha:1];
    [superView addSubview:singButton];
    singButton.sd_layout.
    bottomSpaceToView(superView, 0).
    centerXEqualToView(superView).
    heightIs(35).
    widthIs(95);
    singButton.sd_cornerRadius = @4;
    
}

@end
