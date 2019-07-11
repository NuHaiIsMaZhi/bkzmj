//
//  WordDBObject.h
//  CoBkzProject
//
//  Created by leo on 2018/6/21.
//  Copyright © 2018年 leo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <string.h>
#import <sqlite3.h>

@interface WordDBObject : NSObject

@property (nonatomic, assign) sqlite3 *mybase;

@property(nonatomic,assign)NSInteger count;

+(WordDBObject*)database;

- (BOOL)openDataBaseWithPath:(NSString*)path;
- (NSMutableArray*)getWordArrayBySQLString:(NSString*)sqlString identifuer:(NSString*)identifier;
- (NSInteger)totalWordsCount;


-(BOOL)openAudioDataBaseWithPath:(NSString*)path;
- (NSMutableArray*)getAudioArrayBySQLString:(NSString*)sqlString;
-(NSInteger)totalAudiosCount;


-(void)closeDataBase;

@end
