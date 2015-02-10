//
//  Utils.m
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/20/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (NSString *)getDocumentPathWithFilename:(NSString *)filename
{
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:filename];
    
    return filePath;
}

+ (NSString *)getStringFromPositionType:(PositionType)positionType
{
    NSString *positionString;
    
    switch (positionType)
    {
        case PositionTypeNone:
            positionString = @"";
            break;
            
        case PositionTypeQB:
            positionString = POSITION_QB;
            break;
            
        case PositionTypeRB:
            positionString = POSITION_RB;
            break;
            
        case PositionTypeWR:
            positionString = POSITION_WR;
            break;
            
        case PositionTypeTE:
            positionString = POSITION_TE;
            break;
            
        case PositionTypeK:
            positionString = POSITION_K;
            break;
            
        case PositionTypeDEF:
            positionString = POSITION_DEF;
            break;
            
        default:
            break;
    }
    
    return positionString;
}

+ (PositionType)getPositionTypeFromString:(NSString *)string
{
    PositionType positionType;
    
    if([string isEqualToString:POSITION_QB])
        positionType = PositionTypeQB;
    else if([string isEqualToString:POSITION_RB])
        positionType = PositionTypeRB;
    else if([string isEqualToString:POSITION_WR])
        positionType = PositionTypeWR;
    else if([string isEqualToString:POSITION_TE])
        positionType = PositionTypeTE;
    else if([string isEqualToString:POSITION_K])
        positionType = PositionTypeK;
    else if([string isEqualToString:POSITION_DEF])
        positionType = PositionTypeDEF;
    
    return positionType;
}

+ (NSDate *)dateFromString:(NSString *)str withFormat:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    
    return [formatter dateFromString:str];
}

+ (NSString *)stringFromDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:WEEKDAY_FORMAT_STRING];
    
    //[dateFormatter setDateStyle:NSDateFormatterFullStyle];
   // [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
    
    return [dateFormatter stringFromDate:date];
}

+ (BOOL)isNull:(id)obj
{
    return ( ( obj == nil ) || [obj isEqual:[NSNull null]] );
}

+ (BOOL)isNullString:(NSString *)str
{
    BOOL returnBOOL = [Utils isNull:str];
    
    return (returnBOOL || [str isEqualToString:@"<null>"] || [str isEqualToString:@"(null)"]);
}

+ (NSString *)replaceIfNullString:(NSString *)str
{
    if([self isNullString:str])
        return @"";
    
    return str;
}

+ (id)replaceIfNullValue:(id)value
{
    if ([value isKindOfClass:[NSNull class]])
        return 0;
    
    return value;
}

@end
