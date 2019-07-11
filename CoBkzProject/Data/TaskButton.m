//
//  TaskButton.m
//  CoBkzProject
//
//  Created by leo on 2018/6/19.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "TaskButton.h"
#import "SDAutoLayout.h"
#import "JIjiViewController.h"

@implementation TaskButton{
    
    NSDictionary *jijDict;
    UIViewController *superVCC;
}

- (id)initWithFrame:(CGRect)frame withArray :(NSDictionary *)dict withSuperView:(UIViewController*)superVC wthTag:(NSInteger)tagInt{
    
    if (self = [super initWithFrame:frame]) {
        
        jijDict = dict;
        superVCC = superVC;
        
        NSInteger testNum = tagInt;
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        formatter.numberStyle = kCFNumberFormatterRoundHalfDown;
        NSString *string = [formatter stringFromNumber:[NSNumber numberWithInteger: testNum]];
        
        UILabel *titleLabel = [UILabel new];
        titleLabel.textColor = [UIColor darkGrayColor];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.text = [NSString stringWithFormat:@"机经练习 %@",string];
        titleLabel.textAlignment = NSTextAlignmentLeft;
        [self addSubview:titleLabel];
        titleLabel.sd_layout.
        topSpaceToView(self, 15).
        leftSpaceToView(self, 10).
        autoHeightRatio(0);
        titleLabel.sd_maxWidth = @320;
        
        UIImageView *arrowImageView = [UIImageView new];
        arrowImageView.image = [UIImage imageNamed:@"arrowImage"];
        [self addSubview:arrowImageView];
        arrowImageView.sd_layout.
        centerYEqualToView(self).
        rightSpaceToView(self, 10).
        heightIs([UIImage imageNamed:@"arrowImage"].size.height).
        widthIs([UIImage imageNamed:@"arrowImage"].size.width);
        
        UIView *lineView = [UIView new];
        lineView.backgroundColor = [UIColor colorWithRed:((226) / 255.0) green:((226) / 255.0) blue:((226) / 255.0)  alpha:1];
        [self addSubview:lineView];
        lineView.sd_layout.
        leftSpaceToView(self, 10).
        rightSpaceToView(self, 0).
        heightIs(1).
        bottomSpaceToView(self, 0);
        
        [self addTarget:self action:@selector(gotoAciton) forControlEvents:UIControlEventTouchUpInside];
        
        [self setupAutoHeightWithBottomView:titleLabel bottomMargin:15];
    }
    
    return self;
}

- (void)gotoAciton{
    
    JIjiViewController *VC = [[JIjiViewController alloc]init];
    VC.url = [NSURL URLWithString:[jijDict objectForKey:@"h5Url"]];
    [superVCC.navigationController pushViewController:VC animated:YES];
}

@end
