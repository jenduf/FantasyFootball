//
//  GameCell.h
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/20/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Game;
@interface GameCell : UITableViewCell

@property (nonatomic, strong) Game *game;
@property (nonatomic, weak) IBOutlet UILabel *team1Label, *team2Label, *timelabel;
@property (nonatomic, weak) IBOutlet UIImageView *team1Logo, *team2Logo, *tvLogo;

@end
