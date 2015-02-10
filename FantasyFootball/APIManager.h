//
//  APIManager.h
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/19/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol APIManagerDelegate;

@interface APIManager : NSObject

@property (nonatomic, weak) id <APIManagerDelegate> delegate;
@property (nonatomic, assign) RequestType requestType;

+ (APIManager *)sharedManager;

- (void)getTeamsWithDelegate:(id)delegate;
- (void)getScheduleWithDelegate:(id)delegate;
- (void)getPlayersForPositionType:(PositionType)positionType withDelegate:(id)delegate;
- (void)getDraftRankingsWithDelegate:(id)delegate;
- (void)getWeeklyRankingsByPositionType:(PositionType)positionType forWeekNumber:(NSInteger)weekNumber withDelegate:(id)delegate;
- (void)getWeeklyProjectionsByPositionType:(PositionType)positionType forWeekNumber:(NSInteger)weekNumber withDelegate:(id)delegate;

@end


@protocol APIManagerDelegate

- (void)apiManager:(APIManager *)apiManager didReturnData:(id)data;
- (void)apiManager:(APIManager *)apiManager didReturnError:(NSString *)errorMessage;

@end
