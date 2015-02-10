//
//  AlternatingHeaderView.m
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/22/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import "AlternatingHeaderView.h"

@implementation AlternatingHeaderView

- (void)setPositionType:(PositionType)positionType
{
    _positionType = positionType;
    
    switch (positionType)
    {
        case PositionTypeQB:
        {
            [self updateLabelsWithStringArray:QB_HEADER_TEXT];
        }
            break;
            
        case PositionTypeRB:
        {
            [self updateLabelsWithStringArray:RB_HEADER_TEXT];
        }
            break;
            
        case PositionTypeWR:
        {
            [self updateLabelsWithStringArray:WR_HEADER_TEXT];
        }
            break;
            
        case PositionTypeTE:
        {
            [self updateLabelsWithStringArray:WR_HEADER_TEXT];
        }
            break;
            
        case PositionTypeK:
        {
            [self updateLabelsWithStringArray:K_HEADER_TEXT];
        }
            break;
            
        case PositionTypeDEF:
        {
            [self updateLabelsWithStringArray:DEF_HEADER_TEXT];
        }
            break;
            
        default:
            break;
    }
}

- (void)updateLabelsWithStringArray:(NSArray *)stringArray
{
    NSInteger totalLabels = self.headerLabels.count;
    
    for(NSInteger i = 0; i < totalLabels; i++)
    {
        NSString *headerText = stringArray[i];
        UILabel *label = self.headerLabels[i];
        label.text = headerText;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
