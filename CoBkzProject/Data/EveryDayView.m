//
//  EveryDayView.m
//  CoBkzProject
//
//  Created by leo on 2018/6/19.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "EveryDayView.h"
#import "SDAutoLayout.h"

@implementation EveryDayView

- (id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        UIImageView *leftImageView = [UIImageView new];
        leftImageView.image = [UIImage imageNamed:@"strengtheningImage"];
        [self addSubview:leftImageView];
        leftImageView.sd_layout.
        leftSpaceToView(self, 10).
        heightIs([UIImage imageNamed:@"strengtheningImage"].size.height).
        widthIs([UIImage imageNamed:@"strengtheningImage"].size.width).
        topSpaceToView(self, 10);
        
        UILabel *leftTitleLabel = [UILabel new];
        leftTitleLabel.textColor = [UIColor darkGrayColor];
        leftTitleLabel.font = [UIFont systemFontOfSize:14];
        leftTitleLabel.text = @"强化练习";
        leftTitleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:leftTitleLabel];
        leftTitleLabel.sd_layout.
        centerYEqualToView(leftImageView).
        leftSpaceToView(leftImageView, 10).
        autoHeightRatio(0);
        leftTitleLabel.sd_maxWidth = @320;
        /*
         
         
         */
        UIView *lineView = [UIView new];
        lineView.backgroundColor = [UIColor colorWithRed:((226) / 255.0) green:((226) / 255.0) blue:((226) / 255.0)  alpha:1];
        [self addSubview:lineView];
        lineView.sd_layout.
        topSpaceToView(leftImageView, 10).
        leftSpaceToView(self, 0).
        rightSpaceToView(self, 0).
        heightIs(1);
        
        UIButton *leftButton = [UIButton new];
        leftButton.backgroundColor = [UIColor whiteColor];
        leftButton.layer.masksToBounds = YES;
        leftButton.layer.borderColor = [UIColor redColor].CGColor;
        leftButton.layer.borderWidth = 0;
        [leftButton setImage:[UIImage imageNamed:@"CTKImage"] forState:UIControlStateNormal];
        [leftButton setTitle:@"专项练习" forState:UIControlStateNormal];
        [leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        leftButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:leftButton];
        leftButton.sd_layout.
        topSpaceToView(lineView, 25).
        leftSpaceToView(self, 57).
        widthIs([UIScreen mainScreen].bounds.size.width/2 - 40*2).
        heightEqualToWidth();
        leftButton.sd_cornerRadius = @4;
        leftButton.imageView.sd_layout.
        widthIs([UIImage imageNamed:@"CTKImage"].size.width).
        heightIs([UIImage imageNamed:@"CTKImage"].size.height).
        topSpaceToView(leftButton, 10).
        centerXEqualToView(leftButton);
        leftButton.titleLabel.sd_layout.
        bottomSpaceToView(leftButton, 15).
        centerXEqualToView(leftButton).
        autoHeightRatio(0);
        leftButton.titleLabel.sd_maxWidth = @320;
        
        UIButton *rightButton = [UIButton new];
        rightButton.backgroundColor = [UIColor whiteColor];
        rightButton.layer.masksToBounds = YES;
        rightButton.layer.borderColor = [UIColor yellowColor].CGColor;
        rightButton.layer.borderWidth = 0;
        [rightButton setImage:[UIImage imageNamed:@"ZXTImage"] forState:UIControlStateNormal];
        [rightButton setTitle:@"错题库" forState:UIControlStateNormal];
        [rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        rightButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:rightButton];
        rightButton.sd_layout.
        topSpaceToView(lineView, 25).
        rightSpaceToView(self, 57).
        widthRatioToView(leftButton, 1).
        heightEqualToWidth();
        rightButton.sd_cornerRadius = @4;
        rightButton.imageView.sd_layout.
        widthIs([UIImage imageNamed:@"ZXTImage"].size.width).
        heightIs([UIImage imageNamed:@"ZXTImage"].size.height).
        topSpaceToView(rightButton, 10).
        centerXEqualToView(rightButton);
        rightButton.titleLabel.sd_layout.
        bottomSpaceToView(rightButton, 15).
        centerXEqualToView(rightButton).
        autoHeightRatio(0);
        rightButton.titleLabel.sd_maxWidth = @320;

        [self setupAutoHeightWithBottomView:leftButton bottomMargin:20];
    }
    
    return self;
}

@end
