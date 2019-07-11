//
//  AnalysisView.h
//  CoBkzProject
//
//  Created by leo on 2018/8/16.
//  Copyright © 2018年 leo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SaveObjeModel;

@interface AnalysisView : UIView

- (void)setAnalysisDict:(NSDictionary*)dict withMoel:(SaveObjeModel*)model;
- (void)isFinishOver:(BOOL)finish;

@end
