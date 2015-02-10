//
//  PlayerCell.h
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/23/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Player;
@interface PlayerCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *position, *number, *playerName;
@property (nonatomic, weak) IBOutlet UIImageView *teamImageView;
@property (nonatomic, strong) Player *player;

@end
