//
//  DownWordObject.m
//  CoBkzProject
//
//  Created by leo on 2018/6/25.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "DownWordObject.h"
#import "SVProgressHUD.h"
#import "WordDBObject.h"

static DownWordObject *downObject = nil;

@implementation DownWordObject

+(DownWordObject*)singleDownObject{
    
    if (downObject == nil) {
        
        downObject = [[DownWordObject alloc]init];
    }
    
    return downObject;
}

- (void)downWordAction{
    
    [SVProgressHUD showProgress:0.0 status:@"下载中..." ];
    
    NSString* currentURL  = @"http://mv.beikaozu.com/lxbkz/db/words/bkzwords_ielts_vt3.db";
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:currentURL]];
    
    _operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    NSString* filePath = [self dbPathStringByURL:currentURL];
    
    _operation.outputStream = [NSOutputStream outputStreamToFileAtPath:filePath append:NO];
    
    [_operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
        
        CGFloat rate = (totalBytesRead*1.0) / totalBytesExpectedToRead;
        [SVProgressHUD showProgress:rate status:@"下载中..." ];
        
        NSLog(@"%f",rate);
    }];
    
    __block DownWordObject *pointer = [DownWordObject singleDownObject];
    
    [_operation setCompletionBlock:^{
        
        [SVProgressHUD dismiss];
        [pointer didFinishDownloadDBFileWithPath:filePath];
    }];
    
    [_operation start];

}

#pragma mark ----获取到单词数据
-(void)didFinishDownloadDBFileWithPath:(NSString*)filePath{
    
    WordDBObject *dbMgr = [WordDBObject database];
    BOOL result = [dbMgr openDataBaseWithPath:filePath];
    if (result == NO) {
        
        if (_downWordFaile) {
            _downWordFaile();
        }
        
    }else{
        
        NSString* indexString = [self getWordIndex];
        NSMutableString* sqlString = [NSMutableString stringWithFormat:@"select * from bkzword limit "];
        [sqlString appendString:indexString];
        NSArray* resultArray;
        
        resultArray = [dbMgr getWordArrayBySQLString:sqlString identifuer:@"coreWord"];
        if (resultArray) {
            
            if (_downWordSuccess) {
                _downWordSuccess(resultArray);
            }
        }else{
            
            if (_downWordFaile) {
                _downWordFaile();
            }
        }
    }
}

-(NSString*)dbPathStringByURL:(NSString*)theURL{
    
    NSRange range = [theURL rangeOfString:@"/" options:NSBackwardsSearch];
    NSInteger location = range.location + 1;
    NSRange fileNameRange = NSMakeRange(location, theURL.length - location );
    NSString *urlFileName = [theURL substringWithRange:fileNameRange];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"words"];
    NSMutableString *dbfilePath = [NSMutableString stringWithString:filePath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:dbfilePath])
        [[NSFileManager defaultManager] createDirectoryAtPath:dbfilePath withIntermediateDirectories:NO attributes:nil error:nil]; //Create folder
    [dbfilePath appendString:@"/"];
    [dbfilePath appendString:urlFileName];
    return dbfilePath;
}

-(NSString*)getWordIndex
{
    WordDBObject *dbMgr = [WordDBObject database];
    NSInteger count = [dbMgr totalWordsCount];
    NSMutableString* result = [NSMutableString stringWithFormat:@"%d", 0];
    [result appendString:@", "];
    [result appendString:[NSString stringWithFormat:@"%ld", (long)count]];
    return result;
}

- (void)checkDBFile{
    
    NSString* theURL  = @"http://mv.beikaozu.com/lxbkz/db/words/bkzwords_ielts_vt3.db";

    NSString* filePath = [self dbPathStringByURL:theURL];
    
    BOOL fileExists = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    if (fileExists)
    {
        [self didFinishDownloadDBFileWithPath:filePath];
    }
    else
    {
        if (_downWordFaile) {
            _downWordFaile();
        }
    }
}

@end
