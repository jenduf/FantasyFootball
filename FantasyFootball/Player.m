//
//  Player.m
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/20/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if(self)
    {
        _playerID = dictionary[@"playerId"];
        _active = [dictionary[@"active"] boolValue];
        _jersey = [dictionary[@"jersey"] intValue];
        _firstName = dictionary[@"fname"];
        _lastName = dictionary[@"lname"];
        _displayName = dictionary[@"displayName"];
        _team = dictionary[@"team"];
        _position = dictionary[@"position"];
        _height = [dictionary[@"height"] intValue];
        _weight = [dictionary[@"weight"] intValue];
        _dob = dictionary[@"dob"];
        _college = dictionary[@"college"];
    }
    
    return self;
}

@end
