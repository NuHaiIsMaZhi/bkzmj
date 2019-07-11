//
//  WordListTableViewCell.m
//  CoBkzProject
//
//  Created by leo on 2018/6/25.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "WordListTableViewCell.h"
#import "SDAutoLayout.h"

@implementation WordListTableViewCell{
    
    BOOL isOpen;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self buildSomeControl];
    }
    return self;
}

- (void)buildSomeControl{
    
    self.backgroundColor = [UIColor whiteColor];
    
    _oneLabel = [UILabel new];
    _oneLabel.textColor = [UIColor blackColor];
    _oneLabel.font = [UIFont systemFontOfSize:16];
    [self addSubview:_oneLabel];
    _oneLabel.sd_layout.
    topSpaceToView(self, 10).
    leftSpaceToView(self, 20).
    rightSpaceToView(self, 20).
    autoHeightRatio(0);
    
    _twoLabel = [UILabel new];
    _twoLabel.text = @"释义";
    _twoLabel.userInteractionEnabled = YES;
    _twoLabel.textColor = [UIColor colorWithRed:((255) / 255.0) green:((91) / 255.0) blue:((96) / 255.0)  alpha:1];
    _twoLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:_twoLabel];
    _twoLabel.sd_layout.
    topSpaceToView(_oneLabel, 10).
    leftSpaceToView(self, 20).
    rightSpaceToView(self, 20).
    autoHeightRatio(0);
    
    UITapGestureRecognizer * openTap  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openTheWord)];
    [_twoLabel addGestureRecognizer:openTap];
    
    isOpen = NO;
}

- (void)openTheWord{
    
    NSString *baseStr = [_dict objectForKey:@"base"];
    _twoLabel.text = baseStr;
}

- (void)setDict:(NSDictionary *)dict{
    
    _dict = dict;
    
    NSString *wordTextStr = [dict objectForKey:@"word"];
    _oneLabel.text = wordTextStr;
}

@end
