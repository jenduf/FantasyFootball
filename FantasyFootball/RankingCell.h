//
//  RankingCell.h
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/21/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PlayerRankData;
@interface RankingCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *rank, *teamName, *playerName, *projectedPoints;
@property (nonatomic, weak) IBOutlet UIButton *injuryButton;
@property (nonatomic, strong) PlayerRankData *playerRankData;

@end
