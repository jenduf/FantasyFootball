//
//  TeamCell.m
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/20/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import "TeamCell.h"
#import "Team.h"

@implementation TeamCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setTeam:(Team *)team
{
    _team = team;
    
    self.teamCode.text = team.teamCode;
    self.teamFullName.text = team.teamFullName;
    
    NSString *logo1ImageName = [NSString stringWithFormat:@"%@_logo", [team.teamCode lowercaseString]];
    self.teamImageView.image = [UIImage imageNamed:logo1ImageName];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
