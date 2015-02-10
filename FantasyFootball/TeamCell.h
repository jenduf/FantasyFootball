//
//  TeamCell.h
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/20/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Team;
@interface TeamCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *teamCode, *teamFullName;
@property (nonatomic, weak) IBOutlet UIImageView *teamImageView;
@property (nonatomic, strong) Team *team;

@end
