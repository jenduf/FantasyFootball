//
//  PlayerProjectionData.h
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/22/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayerProjectionData : NSObject

@property (nonatomic, strong) NSString *playerID, *playerName, *playerTeam, *week;
@property (nonatomic, assign) PositionType playerPositionType;
@property (nonatomic, strong) NSString *passAttempts, *passCompletions, *passYards, *passTouchdowns, *passInterceptions;
@property (nonatomic, strong) NSString *rushAttempts, *rushYards, *rushTDs, *fumblesLost;
@property (nonatomic, strong) NSString *receptions, *receivingYards, *receivingTDs;
@property (nonatomic, strong) NSString *fieldGoals, *fgAttempts, *extraPoints;
@property (nonatomic, strong) NSString *defInterceptions, *defFumblesForced, *defFumblesRecovered, *defSack, *defTD, *defPA, *defYDSAllowed;

- (NSArray *)getDataArrayForPositionType:(PositionType)positionType;

@end
