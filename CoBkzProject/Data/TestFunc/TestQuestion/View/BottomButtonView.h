//
//  BottomButtonView.h
//  CoBkzProject
//
//  Created by leo on 2018/8/16.
//  Copyright © 2018年 leo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BottomButtonView : UIView

- (void)isFinishOver:(BOOL)finish;

@property (nonatomic,copy)void(^submitBlock)(void);
@property (nonatomic,copy)void(^nextBlock)(void);

@end

