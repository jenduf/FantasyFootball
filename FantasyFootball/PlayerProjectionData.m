//
//  PlayerProjectionData.m
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/22/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import "PlayerProjectionData.h"

@implementation PlayerProjectionData

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if(self)
    {
        _week = dictionary[@"week"];
        
        _playerID = dictionary[@"playerId"];
        _playerName = dictionary[@"displayName"];
        _playerPositionType = [Utils getPositionTypeFromString:dictionary[@"position"]];
        _playerTeam = dictionary[@"team"];
        _passAttempts = [NSString stringWithFormat:@"%ld", (long)[dictionary[@"passAtt"] intValue]];
        _passCompletions = [NSString stringWithFormat:@"%ld", (long)[dictionary[@"passCmp"] intValue]];
        _passYards = [NSString stringWithFormat:@"%ld", (long)[dictionary[@"passYds"] intValue]];
        _passTouchdowns = [NSString stringWithFormat:@"%ld", (long)[dictionary[@"passTD"] intValue]];
        _passInterceptions = [NSString stringWithFormat:@"%ld", (long)[dictionary[@"passInt"] intValue]];
        
        _rushAttempts = [NSString stringWithFormat:@"%ld", (long)[dictionary[@"rushAtt"] intValue]];
        _rushYards = [NSString stringWithFormat:@"%ld", (long)[dictionary[@"rushYds"] intValue]];
        _rushTDs = [NSString stringWithFormat:@"%ld", (long)[dictionary[@"rushTD"] intValue]];
        _fumblesLost = [NSString stringWithFormat:@"%ld", (long)[dictionary[@"fumblesLost"] intValue]];
        
        _receptions = [NSString stringWithFormat:@"%ld", (long)[dictionary[@"receptions"] intValue]];
        _receivingYards = [NSString stringWithFormat:@"%ld", (long)[dictionary[@"recYds"] intValue]];
        _receivingTDs = [NSString stringWithFormat:@"%ld", (long)[dictionary[@"recTD"] intValue]];
        
        _fieldGoals = [NSString stringWithFormat:@"%ld", (long)[dictionary[@"fg"] intValue]];
        _fgAttempts = [NSString stringWithFormat:@"%ld", (long)[dictionary[@"fgAtt"] intValue]];
        _extraPoints = [NSString stringWithFormat:@"%ld", (long)[dictionary[@"xp"] intValue]];
        
        _defInterceptions = [NSString stringWithFormat:@"%ld", (long)[dictionary[@"defInt"] intValue]];
        _defFumblesForced = [NSString stringWithFormat:@"%ld", (long)[dictionary[@"defFF"] intValue]];
        _defFumblesRecovered = [NSString stringWithFormat:@"%ld", (long)[dictionary[@"defFR"] intValue]];
        _defSack = [NSString stringWithFormat:@"%ld", (long)[dictionary[@"defSack"] intValue]];
        _defTD = [NSString stringWithFormat:@"%ld", (long)[dictionary[@"defTD"] intValue]];
        _defPA = [NSString stringWithFormat:@"%ld", (long)[dictionary[@"defPA"] intValue]];
        _defYDSAllowed = [NSString stringWithFormat:@"%ld", (long)[dictionary[@"defYdsAllowed"] intValue]];
    }
    
    return self;
}


- (NSArray *)getDataArrayForPositionType:(PositionType)positionType
{
    NSArray *dataArray;
    
    switch (positionType)
    {
        case PositionTypeQB:
            dataArray = @[self.playerName, self.passAttempts, self.passCompletions, self.passYards, self.passTouchdowns, self.passInterceptions];
            break;
            
        case PositionTypeRB:
            dataArray = @[self.playerName, @"", self.rushAttempts, self.rushYards, self.rushTDs, self.fumblesLost];
            break;
            
        case PositionTypeWR:
        case PositionTypeTE:
            dataArray = @[self.playerName, @"", @"", self.receptions, self.receivingYards, self.receivingTDs];
            break;
            
        case PositionTypeK:
            dataArray = @[self.playerName, @"", @"", self.fieldGoals, self.fgAttempts, self.extraPoints];
            break;
            
        case PositionTypeDEF:
            dataArray = @[self.playerName, self.defInterceptions, self.defFumblesForced, self.defFumblesRecovered, self.defSack, self.defPA];
            break;
            
        default:
            break;
    }
    
    return dataArray;
}



@end
