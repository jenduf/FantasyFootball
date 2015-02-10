//
//  Team.m
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/20/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import "Team.h"

@implementation Team

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if(self)
    {
        _teamCode = dictionary[@"code"];
        _teamShortName = dictionary[@"shortName"];
        _teamFullName = dictionary[@"fullName"];
        
        NSArray *teamSplice = [self.teamFullName componentsSeparatedByString:@" "];
        
        _teamMascotName = [teamSplice lastObject];
    }
    
    return self;
}

@end
