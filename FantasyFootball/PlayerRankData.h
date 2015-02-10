//
//  PlayerRankData.h
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/21/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayerRankData : NSObject

@property (nonatomic, strong) NSString *week, *playerID, *playerName, *playerTeam;
@property (nonatomic, assign) PositionType playerPositionType;
@property (nonatomic, assign) float standardPoints, lowPoints, highPoints, ppr, lowPPR, highPPR;
@property (nonatomic, strong) NSString *injury, *practiceStatus, *gameStatus;
@property (nonatomic, strong) NSDate *lastUpdate;
@property (nonatomic, assign) NSInteger rank;

@end
