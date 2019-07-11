//
//  SaveObjeModel.h
//  CoBkzProject
//
//  Created by leo on 2018/8/17.
//  Copyright © 2018年 leo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SaveObjeModel : NSObject

@property (nonatomic, copy) NSString *optionIDStr;
@property (nonatomic, copy) NSString *rightOptionIDStr;
@property (nonatomic, assign) NSInteger typeInt;
@property (nonatomic, assign) NSInteger partInt;
@property (nonatomic, assign) NSInteger cidInt;
@property (nonatomic, assign) NSInteger wordInt;
@property (nonatomic, assign) BOOL isSubMit;

@end
