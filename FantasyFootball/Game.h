//
//  Game.h
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/20/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Game : NSObject

@property (nonatomic, strong) NSString *gameID, *gameWeek, *awayTeam, *homeTeam, *gameTime, *tvStation, *winner;
@property (nonatomic, strong) NSDate *gameDate;

@end
