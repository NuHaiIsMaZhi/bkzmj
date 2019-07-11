//
//  WordCollectionViewCell.m
//  CoBkzProject
//
//  Created by leo on 2018/6/25.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "WordCollectionViewCell.h"
#import "SDAutoLayout.h"

@implementation WordCollectionViewCell

- (id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        _grouplabel = [UILabel new];
        _grouplabel.textColor = [UIColor darkGrayColor];
        _grouplabel.font = [UIFont systemFontOfSize:14];
        _grouplabel.text = @"今日任务";
        _grouplabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_grouplabel];
        _grouplabel.sd_layout.
        topSpaceToView(self, 10).
        centerXEqualToView(self).
        autoHeightRatio(0);
        _grouplabel.sd_maxWidth = @(frame.size.width-20);

        _startIcon = [UIImageView new];
        _startIcon.image = [UIImage imageNamed:@"medwasmory_start"];
        [self addSubview:_startIcon];
        _startIcon.sd_layout.
        topSpaceToView(_grouplabel, 10).
        centerXEqualToView(self).
        widthIs(60).
        heightIs(60);

    }
    
    return self;
}

@end
