//
//  QuestionView.h
//  CoBkzProject
//
//  Created by leo on 2018/8/13.
//  Copyright © 2018年 leo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  SaveObjeModel;

@interface QuestionView : UIView

@property (nonatomic,copy)void(^nextBlock)(void);

- (void)setDictWithData:(NSDictionary*)dict;

- (void)setSaveModelData:(SaveObjeModel*)model;

@end
