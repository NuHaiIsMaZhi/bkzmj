//
//  WordDBObject.m
//  CoBkzProject
//
//  Created by leo on 2018/6/21.
//  Copyright © 2018年 leo. All rights reserved.
//

#import "WordDBObject.h"
#import "SVProgressHUD.h"

@implementation WordDBObject

static WordDBObject *dataMgr;

+(WordDBObject*)database{
    
    if (dataMgr == nil) {
        
        dataMgr = [[WordDBObject alloc]init];
    }
    
    return dataMgr;
}

- (id)init{
    
    if (self = [super init]) {
        
    }
    
    return self;
}

- (void)dealloc{
    
    sqlite3_close(_mybase);
}

- (BOOL)openDataBaseWithPath:(NSString*)path{
    
    sqlite3_stmt *statement;
    
    NSString *testStr = @"select * from bkzword limit 0,1";
    BOOL resut = NO;
    if (path.length > 0) {
        
        if (sqlite3_open([path UTF8String], &_mybase) == SQLITE_OK) {
            int statue = sqlite3_prepare_v2(_mybase, [testStr UTF8String], -1, &statement, nil);
            if (statue == SQLITE_OK) {
                
                resut = YES;
            }
        }
    }
    
    return resut;
}

- (void)closeData{
    
    sqlite3_close(_mybase);
}

- (NSMutableArray*)getWordArrayBySQLString:(NSString*)sqlString identifuer:(NSString*)identifier
{
    sqlite3_stmt *statement;
    NSMutableArray* resultArray = [[NSMutableArray alloc] init];
    int status = sqlite3_prepare_v2(_mybase, [sqlString UTF8String], -1, &statement, nil);
    if (status == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            char *word;
            char *phonetic;
            char *base;
            char *engToEng;
            char *english;
            char *chinese;
            char *baseShort;
            char *etyma;
            char *helptxt;
            char *degree;
            
            word = (char *)sqlite3_column_text(statement, 0);
            phonetic = (char *) sqlite3_column_text(statement, 1);
            base = (char *) sqlite3_column_text(statement, 2);
            engToEng = (char *) sqlite3_column_text(statement, 3);
            english = (char *) sqlite3_column_text(statement, 4);
            chinese = (char *) sqlite3_column_text(statement, 5);
            baseShort = (char *) sqlite3_column_text(statement, 6);
            etyma =  (char *) sqlite3_column_text(statement, 7);
            helptxt =  (char *) sqlite3_column_text(statement, 8);
            degree = (char *) sqlite3_column_text(statement, 10);
            
            NSString* wordString;
            if(word != nil)
                wordString = [[NSString alloc] initWithUTF8String:word] ;
            
            NSString* phoneticString;
            if(phonetic != nil)
                phoneticString = [[NSString alloc] initWithUTF8String:phonetic] ;
            
            NSString* baseString;
            if(base != nil)
                baseString = [[NSString alloc] initWithUTF8String:base] ;
            
            NSString* englishString;
            if (english != nil)
                englishString = [[NSString alloc] initWithUTF8String:english] ;
            
            NSString* chineseString;
            if (chinese != nil)
                chineseString = [[NSString alloc] initWithUTF8String:chinese] ;
            
            NSString* engToEngString;
            if(engToEng != nil)
                engToEngString = [[NSString alloc] initWithUTF8String:engToEng] ;
            
            NSString* baseShortString;
            if(baseShort != nil)
                baseShortString = [[NSString alloc] initWithUTF8String:baseShort] ;
            
            NSString* etymaString;
            if(etyma != nil)
                etymaString = [[NSString alloc] initWithUTF8String:etyma] ;
            
            NSString* helptxtString;
            if(helptxt != nil)
                helptxtString = [[NSString alloc] initWithUTF8String:helptxt] ;
            
            NSString* degreeStr;
            if(degree != nil)
                degreeStr = [[NSString alloc] initWithUTF8String:degree] ;
            
            
            NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
            
            if (wordString != nil && wordString != (id)[NSNull null])
                dict[@"word"] = wordString;
            if (phoneticString != nil && phoneticString != (id)[NSNull null])
                dict[@"phonetic"] = phoneticString;
            if (baseString != nil && baseString != (id)[NSNull null])
                dict[@"base"] = baseString;
            if (englishString != nil && englishString != (id)[NSNull null])
                dict[@"english"] = englishString;
            if (chineseString != nil && chineseString != (id)[NSNull null])
                dict[@"chinese"] = chineseString;
            if(engToEngString != nil && engToEngString != (id)[NSNull null])
                dict[@"engToEng"] = engToEngString;
            if(baseShortString != nil && baseShortString !=(id)[NSNull null])
                dict[@"baseShort"] = baseShortString;
            if(etymaString != nil && etymaString != (id)[NSNull null])
                dict[@"etyma"] = etymaString;
            if(helptxtString != nil && helptxtString != (id)[NSNull null])
                dict[@"helptxt"] = helptxtString;
            if(degreeStr != nil && degreeStr != (id)[NSNull null])
                dict[@"degree"] = degreeStr;
            
            [resultArray addObject:dict];
        }
        
        sqlite3_finalize(statement);
    }
    return resultArray;
}

-(NSInteger)totalWordsCount
{
    sqlite3_stmt *statement;
    NSString *sqlString = @"SELECT COUNT(*) FROM bkzword";
    NSInteger count = 0;
    int status = sqlite3_prepare_v2(_mybase, [sqlString UTF8String], -1, &statement, nil);
    if (status == SQLITE_OK)
    {
        while( sqlite3_step(statement) == SQLITE_ROW )
        {
            count = sqlite3_column_int(statement, 0);
        }
        
        sqlite3_finalize(statement);
    }
    return count;
}

#pragma mark 读取语音文件
-(BOOL)openAudioDataBaseWithPath:(NSString*)path
{
    sqlite3_stmt *statement;
    
    NSString* testSQLString = @"select * from bkzword limit 0,1";
    BOOL result = NO;
    if ([path length] > 0)
        if (sqlite3_open([path UTF8String], &_mybase) == SQLITE_OK)
        {
            int status = sqlite3_prepare_v2(_mybase, [testSQLString UTF8String], -1, &statement, nil);
            if (status == SQLITE_OK)
                result = YES;
        }
    
    return result;
}

- (NSMutableArray*)getAudioArrayBySQLString:(NSString*)sqlString {
    sqlite3_stmt *statement;
    NSMutableArray* resultArray = [[NSMutableArray alloc] init];
    int status = sqlite3_prepare_v2(_mybase, [sqlString UTF8String], -1, &statement, nil);
    if (status == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            char *word;
            
            word = (char *)sqlite3_column_text(statement, 0);
            
            NSString* wordString;
            if(word != nil)
                wordString = [[NSString alloc] initWithUTF8String:word] ;
            
            NSMutableDictionary* dict = [[NSMutableDictionary alloc] init];
            
            if (wordString != nil && wordString != (id)[NSNull null])
                dict[@"word"] = wordString;
            
            
            int audiobytes = sqlite3_column_bytes(statement, 1);
            Byte* audiovalue = (Byte*)sqlite3_column_blob(statement, 1);
            if (audiobytes !=0 && audiovalue != NULL)
            {
                NSData * data = [NSData dataWithBytes:audiovalue length:audiobytes];
                dict[@"audio"] = data;
            }
            else
            {
                dict[@"audio"] = [[NSData alloc] init];
            }
            
            [resultArray addObject:dict];
        }
        sqlite3_finalize(statement);
    }
    return resultArray;
}

-(NSInteger)totalAudiosCount
{
    sqlite3_stmt *statement;
    NSString *sqlString = @"SELECT COUNT(*) FROM bkzword";
    NSInteger count = 0;
    int status = sqlite3_prepare_v2(_mybase, [sqlString UTF8String], -1, &statement, nil);
    if (status == SQLITE_OK)
    {
        while( sqlite3_step(statement) == SQLITE_ROW )
        {
            count = sqlite3_column_int(statement, 0);
        }
        
        sqlite3_finalize(statement);
    }
    return count;
}
































@end










