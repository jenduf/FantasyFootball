//
//  Game.m
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/20/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import "Game.h"

@implementation Game

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if(self)
    {
        _gameID = dictionary[@"gameId"];
        _gameWeek = dictionary[@"gameWeek"];
        _gameDate = [Utils dateFromString:dictionary[@"gameDate"] withFormat:DATE_FORMAT_STRING];
        _awayTeam = dictionary[@"awayTeam"];
        _homeTeam = dictionary[@"homeTeam"];
        _gameTime = dictionary[@"gameTimeET"];
        _tvStation = dictionary[@"tvStation"];
        _winner = dictionary[@"winner"];
    }
    
    return self;
}

@end
