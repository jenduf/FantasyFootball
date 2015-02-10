//
//  RankingCell.m
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/21/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import "RankingCell.h"
#import "PlayerRankData.h"

@implementation RankingCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setPlayerRankData:(PlayerRankData *)playerRankData
{
    _playerRankData = playerRankData;
    
    self.rank.text = [NSString stringWithFormat:@"%ld", (long)playerRankData.rank];
    self.teamName.text = playerRankData.playerTeam;
    self.playerName.text = playerRankData.playerName;
    self.projectedPoints.text = [NSString stringWithFormat:@"%ld", (long)playerRankData.standardPoints];
    
    if(playerRankData.injury.length > 0)
    {
        self.injuryButton.hidden = NO;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
