//
//  ProjectionCell.h
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/22/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PlayerProjectionData;
@interface ProjectionCell : UITableViewCell

@property (nonatomic, strong) NSArray *projectionData;
@property (nonatomic, strong) IBOutletCollection(UILabel) NSArray *projectionLabels;

@end
