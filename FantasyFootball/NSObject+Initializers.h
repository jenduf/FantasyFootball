//
//  NSObject+Initializers.h
//  Toric
//
//  Created by Jennifer Duffey on 8/6/13.
//  Copyright (c) 2013 Jennifer Duffey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Initializers)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

+ (instancetype)loadData;
- (void)save;

@end
