//
//  QuestionRequestion.h
//  CoBkzProject
//
//  Created by leo on 2018/8/13.
//  Copyright © 2018年 leo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^dataBack)(NSDictionary *dict);

typedef void (^subMitQueBack)(NSDictionary *dict);

@interface QuestionRequestion : NSObject

+ (void)getQueStionData:(dataBack)dataBlock;

+ (void)submitQueDataForServer:(subMitQueBack)dataBlock;

@end
