//
//  PlayerRankData.m
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/21/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import "PlayerRankData.h"

@implementation PlayerRankData

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if(self)
    {
        _week = dictionary[@"week"];
        _playerID = dictionary[@"playerId"];
        _playerName = dictionary[@"name"];
        _playerPositionType = [Utils getPositionTypeFromString:dictionary[@"position"]];
        _playerTeam = dictionary[@"team"];
        _standardPoints = [dictionary[@"standard"] floatValue];
        _lowPoints = [dictionary[@"standardLow"] floatValue];
        _highPoints = [dictionary[@"standardHigh"] floatValue];
        _ppr = [dictionary[@"ppr"] floatValue];
        _lowPPR = [dictionary[@"pprLow"] floatValue];
        _highPPR = [dictionary[@"pprHigh"] floatValue];
        _injury = [Utils replaceIfNullString:dictionary[@"injury"]];
        _practiceStatus = [Utils replaceIfNullString:dictionary[@"practiceStatus"]];
        _gameStatus = [Utils replaceIfNullString:dictionary[@"gameStatus"]];
        
        _lastUpdate = [Utils dateFromString:[Utils replaceIfNullString:dictionary[@"lastUpdate"]] withFormat:DATE_FORMAT_STRING];
    }
    
    return self;
}

@end
