//
//  NetWorkRequest.m
//  CoBkzProject
//
//  Created by leo on 2018/6/26.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "NetWorkRequest.h"
#import "SVProgressHUD.h"
#import "AFNetworking.h"

@implementation NetWorkRequest

+(void)getDataShowHUD:(BOOL)show withUrl:(NSString *)urlString parameter:(NSDictionary *)parameterDictionary andResponse:(NetWorkToolsGetCompletionHandler)block{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 20;
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];    
    [SVProgressHUD showWithStatus:@"请求中"];
    [manager GET:urlString parameters:parameterDictionary success:^(NSURLSessionDataTask *task, id responseObject) {
        
        [SVProgressHUD dismiss];

        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];

        block([data[@"code"] integerValue],data[@"data"],data[@"exData"]);

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        [SVProgressHUD showErrorWithStatus:@"请求失败"];
        
    }];
    
}

+(void)postataShowHUD:(BOOL)show withUrl:(NSString *)urlString parameter:(NSDictionary *)parameterDictionary andResponse:(NetWorkToolsGetCompletionHandler)block{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 20;
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [manager POST:urlString parameters:parameterDictionary success:^(NSURLSessionDataTask *task, id responseObject) {
        
        [SVProgressHUD dismiss];
        
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        block([data[@"code"] integerValue],data[@"data"],data[@"exData"]);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        [SVProgressHUD showErrorWithStatus:@"请求失败"];
        
    }];
}
@end
