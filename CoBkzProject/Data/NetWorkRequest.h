//
//  NetWorkRequest.h
//  CoBkzProject
//
//  Created by leo on 2018/6/26.
//  Copyright © 2018年 leo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkRequest : NSObject

typedef void(^NetWorkToolsGetCompletionHandler)(NSInteger code, id contentData, NSDictionary *exData);

+(void)getDataShowHUD:(BOOL)show withUrl:(NSString *)urlString parameter:(NSDictionary *)parameterDictionary andResponse:(NetWorkToolsGetCompletionHandler)block;

+(void)postataShowHUD:(BOOL)show withUrl:(NSString *)urlString parameter:(NSDictionary *)parameterDictionary andResponse:(NetWorkToolsGetCompletionHandler)block;

@end
