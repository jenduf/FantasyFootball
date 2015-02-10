//
//  Utils.h
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/20/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

+ (NSString *)getDocumentPathWithFilename:(NSString *)filename;
+ (NSString *)getStringFromPositionType:(PositionType)positionType;
+ (PositionType)getPositionTypeFromString:(NSString *)string;
+ (NSDate *)dateFromString:(NSString *)str withFormat:(NSString *)format;
+ (NSString *)stringFromDate:(NSDate *)date;

+ (BOOL)isNull:(id)obj;
+ (BOOL)isNullString:(NSString *)str;
+ (NSString *)replaceIfNullString:(NSString *)str;
+ (id)replaceIfNullValue:(id)value;

@end
