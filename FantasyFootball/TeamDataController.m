//
//  TeamDataController.m
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/20/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import "TeamDataController.h"
#import "Team.h"

@implementation TeamDataController

static TeamDataController *sharedController = nil;

+ (TeamDataController *)sharedController
{
    static dispatch_once_t pred;
    
    dispatch_once(&pred, ^
    {
        sharedController = [[self alloc] init];
    });
    
    return sharedController;
}

- (id)init
{
    self = [super init];
    
    if(self)
    {
        
    }
    
    return self;
}

- (void)setMasterTeamList:(NSMutableArray *)masterTeamList
{
    _masterTeamList = masterTeamList;
}

- (Team *)teamByTeamCode:(NSString *)teamCode
{
    for(Team *team in self.masterTeamList)
    {
        if([team.teamCode isEqualToString:teamCode])
        {
            return team;
        }
    }
    
    return nil;
}

- (NSUInteger)countOfList
{
    return self.masterTeamList.count;
}

- (Team *)objectInListAtIndex:(NSUInteger)index
{
    return self.masterTeamList[index];
}

@end
