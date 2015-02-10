//
//  ProjectionsList.m
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/22/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import "ProjectionsList.h"
#import "PlayerProjectionData.h"

@implementation ProjectionsList

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if(self)
    {
        _currentWeek = dictionary[@"Week"];
        
        _positionType = [Utils getPositionTypeFromString:dictionary[@"Position"]];
        
        self.projections = [[NSArray alloc] initWithArray:[self getProjectionsFromArray:dictionary[@"Projections"]]];
    }
    
    return self;
}

- (NSArray *)getProjectionsFromArray:(NSArray *)projectionsArray
{
    NSMutableArray *allProjections = [NSMutableArray array];
    
    for(NSDictionary *dict in projectionsArray)
    {
        PlayerProjectionData *projectionData = [[PlayerProjectionData alloc] initWithDictionary:dict];
        [allProjections addObject:projectionData];
    }
    
    return allProjections;
}

@end
