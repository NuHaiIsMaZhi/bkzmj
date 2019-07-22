//
//  AppDelegate.h
//  CoBkzProject
//
//  Created by leo on 2018/6/19.
//  Copyright © 2018年 leo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "basenavViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

- (void)changeMainVC;

@property (nonatomic,retain)basenavViewController *nav;

@property (strong, nonatomic) UIWindow *window;

@end

