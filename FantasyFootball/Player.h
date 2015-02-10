//
//  Player.h
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/20/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, strong) NSString *playerID, *firstName, *lastName, *displayName, *team, *position, *college, *dob;
@property (nonatomic, assign) NSInteger jersey, height, weight;
@property (nonatomic, assign) BOOL active;

@end
