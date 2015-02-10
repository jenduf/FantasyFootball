//
//  ProjectionsList.h
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/22/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProjectionsList : NSObject

@property (nonatomic, strong) NSString *currentWeek;
@property (nonatomic, assign) PositionType positionType;
@property (nonatomic, strong) NSArray *projections;

@end
