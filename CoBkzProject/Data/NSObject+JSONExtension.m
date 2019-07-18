//
//  NSObject+JSONExtension.m
//  CoBkzProject
//
//  Created by HSBC on 2019/7/17.
//  Copyright © 2019 leo. All rights reserved.
//

#import "NSObject+JSONExtension.h"
#import <objc/runtime.h>

@implementation NSObject (JSONExtension)


- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [self init];
    
    if (self) {
        unsigned int count;
     
        objc_property_t *propertyList = class_copyPropertyList([self class], &count);
        for (int i = 0; i<count; i++) {
            
            const char *propertyName = property_getName(propertyList[i]);
            NSString *name = [NSString stringWithUTF8String:propertyName];
            id value = dictionary[name];
            if (value) {
                
                [self setValue:value forKey:name];
            }
        }
        
        free(propertyList);
    }
    
    return self;
}
@end
