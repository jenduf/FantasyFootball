//
//  ProjectionCell.m
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/22/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import "ProjectionCell.h"
#import "PlayerProjectionData.h"

@implementation ProjectionCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setProjectionData:(NSArray *)projectionData
{
    _projectionData = projectionData;
    
    NSInteger totalLabels = self.projectionLabels.count;
    
    for(NSInteger i = 0; i < totalLabels; i++)
    {
        UILabel *label = self.projectionLabels[i];
        label.text = projectionData[i];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
