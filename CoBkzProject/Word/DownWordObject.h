//
//  DownWordObject.h
//  CoBkzProject
//
//  Created by leo on 2018/6/25.
//  Copyright © 2018年 leo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperation.h"

@interface DownWordObject : NSObject

+(DownWordObject*)singleDownObject;

- (void)downWordAction;

@property (nonatomic, retain) AFURLConnectionOperation *operation;

@property (nonatomic,strong)void(^downWordSuccess)(NSArray *wordArray);

@property (nonatomic,strong)void(^downWordFaile)();

- (void)checkDBFile;

@end
