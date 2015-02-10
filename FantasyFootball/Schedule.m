//
//  Schedule.m
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/20/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import "Schedule.h"
#import "Game.h"

@implementation Schedule

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if(self)
    {
        _currentWeek = dictionary[@"currentWeek"];
        
        NSArray *schedule = dictionary[@"Schedule"];
        
        self.gameDictionary = [[NSMutableDictionary alloc] init];
        
        [self createScheduleFromArray:schedule];
    }
    
    return self;
}

- (void)createScheduleFromArray:(NSArray *)scheduleArray
{
    for(NSDictionary *dict in scheduleArray)
    {
        Game *game = [[Game alloc] initWithDictionary:dict];
        
        if(!self.gameDictionary[game.gameWeek])
        {
            NSMutableArray *weekArray = [NSMutableArray arrayWithObject:game];
            self.gameDictionary[game.gameWeek] = weekArray;
        }
        else
        {
            NSMutableArray *weekArray = self.gameDictionary[game.gameWeek];
            [weekArray addObject:game];
        }
    }
}

- (NSDictionary *)sortCurrentWeekGamesByDay
{
    NSMutableDictionary *weekDictionary = [NSMutableDictionary dictionary];
    
    NSArray *games = self.gameDictionary[self.currentWeek];
    
    for(Game *game in games)
    {
        NSString *dayString = [Utils stringFromDate:game.gameDate];
        
        if(!weekDictionary[dayString])
        {
            NSMutableArray *dayArray = [NSMutableArray arrayWithObject:game];
            weekDictionary[dayString] = dayArray;
        }
        else
        {
            NSMutableArray *dayArray = weekDictionary[dayString];
            [dayArray addObject:game];
        }
    }
    
    return weekDictionary;
}

@end
