//
//  PopupView.m
//  FantasyFootball
//
//  Created by Jennifer Duffey on 9/23/14.
//  Copyright (c) 2014 Jennifer Duffey. All rights reserved.
//

#import "PopupView.h"

@implementation PopupView

- (void)setPopupText:(NSString *)popupText
{
    _popupText = popupText;
    
    self.popupLabel = [[UILabel alloc] initWithFrame:self.frame];
    self.popupLabel.textColor = [UIColor darkGrayColor];
    self.popupLabel.backgroundColor = [UIColor clearColor];
    self.popupLabel.text = popupText;
    [self addSubview:self.popupLabel];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointZero];
    [path addLineToPoint:CGPointMake(rect.size.width, 0)];
    [path addLineToPoint:CGPointMake(rect.size.width, rect.size.height - ARROW_HEIGHT)];
    [path addLineToPoint:CGPointMake((rect.size.width / 2) + ARROW_HEIGHT, rect.size.height - ARROW_HEIGHT)];
    [path addLineToPoint:CGPointMake(rect.size.width / 2, rect.size.height)];
    [path addLineToPoint:CGPointMake((rect.size.width / 2) - ARROW_HEIGHT, rect.size.height - ARROW_HEIGHT)];
    [path addLineToPoint:CGPointMake(0, rect.size.height - ARROW_HEIGHT)];
    [path addLineToPoint:CGPointZero];
    // [path closePath];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(context);
    CGContextSetFillColorWithColor(context, [UIColor grayColor].CGColor);
    CGContextAddPath(context, path.CGPath);
    CGContextDrawPath(context, kCGPathFill);
    CGContextRestoreGState(context);
}


@end
