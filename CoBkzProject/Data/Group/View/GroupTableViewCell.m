//
//  GroupTableViewCell.m
//  CoBkzProject
//
//  Created by leo on 2018/8/9.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "GroupTableViewCell.h"

@implementation GroupTableViewCell{
    
    UIImageView *heatImageView;
    UILabel *nameLabel;
    UILabel *timeLabel;
    UILabel *titleLabel;
    UILabel *contentLabel;
    
    UIView *lineView;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self buildControl];
    }    
    
    return self;
}


- (void)buildControl{
    
    lineView = [UIView new];
    lineView.backgroundColor = Line_COLOR;
    [self addSubview:lineView];
    lineView.sd_layout.
    leftSpaceToView(self, 0).
    rightSpaceToView(self, 0).
    heightIs(1).
    bottomSpaceToView(self, 1);
    
    heatImageView = [[UIImageView alloc]init];
    [self addSubview:heatImageView];
    heatImageView.backgroundColor = RANDOM_COLOR;
    heatImageView.sd_layout.
    topSpaceToView(self, 15).
    leftSpaceToView(self, 15).
    heightIs(45).
    widthIs(45);
    heatImageView.sd_cornerRadiusFromWidthRatio = @0.5;
    
    timeLabel = [UILabel new];
    timeLabel.text = @"2018-10-01";
    timeLabel.font = TeoFont;
    timeLabel.textColor = UIColor.clearColor;
    timeLabel.backgroundColor = RANDOM_COLOR;
    timeLabel.textAlignment = RightText;
    [self addSubview:timeLabel];
    timeLabel.sd_layout.
    centerYEqualToView(heatImageView).
    rightSpaceToView(self, 10).
    autoHeightRatio(0);
    timeLabel.sd_maxWidth = @320;

    
    nameLabel = [UILabel new];
    nameLabel.text = @"userName";
    nameLabel.font = FourThenFont;
    nameLabel.textColor = UIColor.clearColor;
    nameLabel.backgroundColor = RANDOM_COLOR;
    nameLabel.textAlignment = LeftText;
    [self addSubview:nameLabel];
    nameLabel.sd_layout.
    centerYEqualToView(heatImageView).
    leftSpaceToView(heatImageView, 10).
    autoHeightRatio(0);
    nameLabel.sd_maxWidth = @320;
    
    titleLabel = [UILabel new];
    titleLabel.text = @"this is a very long title String and copy me";
    titleLabel.font = SixThenFont;
    titleLabel.textColor = UIColor.clearColor;
    titleLabel.backgroundColor = RANDOM_COLOR;
    titleLabel.textAlignment = LeftText;
    [self addSubview:titleLabel];
    titleLabel.sd_layout.
    topSpaceToView(heatImageView, 15).
    rightSpaceToView(self, 15).
    leftSpaceToView(self, 15).
    autoHeightRatio(0);
    
    contentLabel = [UILabel new];
    contentLabel.text = @"this is a very long content String and copy me/this is a very long content String and copy me/this is a very long content String and copy me/this is a very long content String and copy me";
    contentLabel.font = SixThenFont;
    contentLabel.textColor = UIColor.clearColor;
    contentLabel.backgroundColor = RANDOM_COLOR;
    contentLabel.textAlignment = LeftText;
    [self addSubview:contentLabel];
    contentLabel.sd_layout.
    topSpaceToView(titleLabel, 15).
    leftSpaceToView(self, 15).
    rightSpaceToView(self, 15).
    autoHeightRatio(0);

}

@end
