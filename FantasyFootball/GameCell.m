//
//  GameCell.m
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/20/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import "GameCell.h"
#import "Game.h"
#import "Team.h"

@implementation GameCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setGame:(Game *)game
{
    _game = game;
    
    Team *team = [[TeamDataController sharedController] teamByTeamCode:game.awayTeam];
    self.team1Label.text = [team.teamMascotName uppercaseString];
    
    NSString *logo1ImageName = [NSString stringWithFormat:@"%@", [team.teamCode lowercaseString]];
    self.team1Logo.image = [UIImage imageNamed:logo1ImageName];
    
    Team *team2 = [[TeamDataController sharedController] teamByTeamCode:game.homeTeam];
    self.team2Label.text = [team2.teamMascotName uppercaseString];
    
     NSString *logo2ImageName = [NSString stringWithFormat:@"%@", [team2.teamCode lowercaseString]];
    self.team2Logo.image = [UIImage imageNamed:logo2ImageName];
    
    self.timelabel.text = game.gameTime;
    
    NSString *tvString = [NSString stringWithFormat:@"%@_logo", [game.tvStation lowercaseString]];
    
    self.tvLogo.image = [UIImage imageNamed:tvString];
}

- (UIEdgeInsets)layoutMargins
{
    return UIEdgeInsetsZero;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
