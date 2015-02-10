//
//  WeeklyPlayerRankings.h
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/21/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PositionRankingsList : NSObject

@property (nonatomic, strong) NSString *currentWeek;
@property (nonatomic, assign) PositionType positionType;
@property (nonatomic, strong) NSArray *rankings;

@end
