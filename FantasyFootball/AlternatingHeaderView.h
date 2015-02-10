//
//  AlternatingHeaderView.h
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/22/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AlternatingHeaderView : UIView

@property (nonatomic, strong) IBOutletCollection(UILabel) NSArray *headerLabels;
@property (nonatomic, assign) PositionType positionType;

@end
