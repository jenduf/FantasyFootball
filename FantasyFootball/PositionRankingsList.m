//
//  WeeklyPlayerRankings.m
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/21/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import "PositionRankingsList.h"
#import "PlayerRankData.h"

@implementation PositionRankingsList

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if(self)
    {
        _currentWeek = dictionary[@"Week"];
        
        _positionType = [Utils getPositionTypeFromString:dictionary[@"Position"]];
        
        self.rankings = [[NSArray alloc] initWithArray:[self getRankingsFromArray:dictionary[@"Rankings"]]];
    }
    
    return self;
}

- (NSArray *)getRankingsFromArray:(NSArray *)rankingsArray
{
    NSMutableArray *allRankings = [NSMutableArray array];
    
    for(NSDictionary *dict in rankingsArray)
    {
        PlayerRankData *playerData = [[PlayerRankData alloc] initWithDictionary:dict];
        [allRankings addObject:playerData];
    }
    
    return allRankings;
}

@end
