//
//  QuestionRequestion.m
//  CoBkzProject
//
//  Created by leo on 2018/8/13.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "QuestionRequestion.h"
#import "NetWorkRequest.h"

@implementation QuestionRequestion

+ (void)getQueStionData:(dataBack)dataBlock{
    
    NSString *urlStr = @"https://tai.beikaozu.com//qlib/words/test/get?product=ielts&part=7&platform=ios&terminal=student&version=1.1.0&type=2&token=3d60ad21457d7a981e7ba3a01712559b&cid=9";
    [NetWorkRequest getDataShowHUD:YES withUrl:urlStr parameter:nil andResponse:^(NSInteger code, id contentData, NSDictionary *exData) {
        
        dataBlock(contentData);
    }];
}

+ (void)submitQueDataForServer:(subMitQueBack)dataBlock{

    NSString *urlStr = @"https://tai.beikaozu.com//qlib/words/test/answer?product=ielts&part=7&platform=ios&terminal=student&version=1.1.0&type=2&token=3d60ad21457d7a981e7ba3a01712559b&cid=9";
    [NetWorkRequest postataShowHUD:YES withUrl:urlStr parameter:nil andResponse:^(NSInteger code, id contentData, NSDictionary *exData) {
       
        
        dataBlock(contentData);
    }];
    
}

@end
