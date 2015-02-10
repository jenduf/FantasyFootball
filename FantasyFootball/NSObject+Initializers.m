//
//  NSObject+Initializers.m
//  Toric
//
//  Created by Jennifer Duffey on 8/6/13.
//  Copyright (c) 2013 Jennifer Duffey. All rights reserved.
//

#import "NSObject+Initializers.h"

@implementation NSObject (Initializers)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    return self;
}

+ (instancetype)loadData
{
    NSData *decodedData = [NSData dataWithContentsOfFile:[Utils getDocumentPathWithFilename:NSStringFromClass([self class])]];
    
    if(decodedData)
    {
        id newObject = [NSKeyedUnarchiver unarchiveObjectWithData:decodedData];
        
        return newObject;
    }
    
    return [[[self class] alloc] init];
}

- (void)save
{
    NSData *encodedData = [NSKeyedArchiver archivedDataWithRootObject:self];
    [encodedData writeToFile:[Utils getDocumentPathWithFilename:NSStringFromClass([self class])] atomically:YES];
}

@end
