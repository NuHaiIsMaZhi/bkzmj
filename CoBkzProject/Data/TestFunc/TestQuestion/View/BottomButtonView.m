//
//  BottomButtonView.m
//  CoBkzProject
//
//  Created by leo on 2018/8/16.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "BottomButtonView.h"

@implementation BottomButtonView{
    
    UIButton *actionButton;
    UIButton *nextButton;

}

- (id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        actionButton = [UIButton new];
        nextButton = [UIButton new];
        NSArray *buttonArray = @[actionButton,nextButton];
        
        for (int i = 0; i<buttonArray.count; i++) {
            
            UIButton *button = buttonArray[i];
            [button setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
            button.titleLabel.font = SixThenFont;
            [self addSubview:button];
            button.sd_layout.
            centerXEqualToView(self).
            centerYEqualToView(self).
            heightIs(40).
            widthIs(120);
            button.sd_cornerRadius = @4;
            if (i == 0) {
                
                button.backgroundColor = UIColor.redColor;
                [button setTitle:@"提交" forState:UIControlStateNormal];
                [button addTarget:self action:@selector(submitAction) forControlEvents:UIControlEventTouchUpInside];

            }else{
         
                button.hidden = YES;
                button.backgroundColor = UIColor.darkGrayColor;
                [button setTitle:@"下一道" forState:UIControlStateNormal];
                [button addTarget:self action:@selector(nextActiom) forControlEvents:UIControlEventTouchUpInside];
            }
        }
    }
    
    return self;
    
}

- (void)isFinishOver:(BOOL)finish{
    
    if (finish) {
        
        nextButton.hidden = NO;
        actionButton.hidden = YES;
    }else{
        
        nextButton.hidden = YES;
        actionButton.hidden = NO;
    }
}

- (void)submitAction{
    
    if (_submitBlock) {
        
        _submitBlock();
    }
}

- (void)nextActiom{
    
    if (_nextBlock) {
        
        _nextBlock();
    }
}
@end
