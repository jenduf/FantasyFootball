//
//  TeamDataController.h
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/20/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Team;
@interface TeamDataController : NSObject

@property (nonatomic, strong) NSMutableArray *masterTeamList;

+ (TeamDataController *)sharedController;

- (Team *)teamByTeamCode:(NSString *)teamCode;
- (NSUInteger)countOfList;
- (Team *)objectInListAtIndex:(NSUInteger)index;

@end
