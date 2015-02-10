//
//  Schedule.h
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/20/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Schedule : NSObject

@property (nonatomic, strong) NSString *currentWeek;
@property (nonatomic, strong) NSMutableDictionary *gameDictionary;

- (NSDictionary *)sortCurrentWeekGamesByDay;

@end
