//
//  TaskListView.m
//  CoBkzProject
//
//  Created by leo on 2018/6/19.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "TaskListView.h"
#import "TaskButton.h"
#import "SDAutoLayout.h"

@implementation TaskListView

- (id)initWithFrame:(CGRect)frame withArray:(NSArray *)array  withSuperView:(UIViewController*)superVC{
    
    if (self = [super initWithFrame:frame]) {
        
        UIView *tempView = self;
        
        for (int i = 0; i < 5; i++) {
            
            TaskButton *button = [[TaskButton alloc]initWithFrame:CGRectMake(0, 0, 0, 0) withArray:array[i] withSuperView:superVC wthTag:i + 1];
            button.tag = i + 100;
            button.backgroundColor = [UIColor whiteColor];
            [self addSubview:button];
            button.sd_layout.
            topSpaceToView(tempView, 0).
            leftSpaceToView(self, 0).
            rightSpaceToView(self, 0);

            tempView = button;
        }
        
        [self setupAutoHeightWithBottomView:tempView bottomMargin:0];
    }
    
    return self;
}

@end
