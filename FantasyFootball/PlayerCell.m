//
//  PlayerCell.m
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/23/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import "PlayerCell.h"
#import "Team.h"
#import "Player.h"

@implementation PlayerCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setPlayer:(Player *)player
{
    _player = player;
    
    self.position.text = player.position;
    self.number.text = [NSString stringWithFormat:@"%ld", (long)player.jersey];
    self.playerName.text = player.displayName;
    
    Team *team = [[TeamDataController sharedController] teamByTeamCode:player.team];
    
    NSString *logoImageName = [NSString stringWithFormat:@"%@_logo", [team.teamCode lowercaseString]];
    self.teamImageView.image = [UIImage imageNamed:logoImageName];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
