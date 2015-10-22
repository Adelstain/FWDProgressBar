//
//  FWDProgressBtn.m
//  FWDProgressBar
//
//  Created by Adelstain on 15/8/24.
//  Copyright (c) 2015年 Adelstain. All rights reserved.
//

#import "FWDProgressBtn.h"

@implementation FWDProgressBtn

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = NO;
        
        _lineLeft = [[UIView alloc] initWithFrame:CGRectZero];
        _lineLeft.translatesAutoresizingMaskIntoConstraints = NO;
        _lineLeft.backgroundColor = [UIColor clearColor];
        [self addSubview:_lineLeft];
        
        _lineRight = [[UIView alloc] initWithFrame:CGRectZero];
        _lineRight.translatesAutoresizingMaskIntoConstraints = NO;
        _lineRight.backgroundColor = [UIColor clearColor];
        [self addSubview:_lineRight];
        
        _circleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _circleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _circleLabel.layer.cornerRadius = 2.5;
        _circleLabel.clipsToBounds = YES;
        _circleLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:_circleLabel];
        
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _timeLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        _timeLabel.textColor = [UIColor grayColor];
        _timeLabel.layer.borderColor = [UIColor grayColor].CGColor;
        _timeLabel.layer.borderWidth = 1.0f;
        [self addSubview:_timeLabel];
        
        NSDictionary *dictionary = NSDictionaryOfVariableBindings(_timeLabel,_circleLabel,_lineRight,_lineLeft);
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_lineLeft][_circleLabel(5)][_lineRight]|" options:0 metrics:nil views:dictionary]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-3-[_lineLeft(1)]" options:0 metrics:nil views:dictionary]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_circleLabel(5)]" options:0 metrics:nil views:dictionary]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-3-[_lineRight(1)]" options:0 metrics:nil views:dictionary]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_circleLabel]-5-[_timeLabel(30)]|" options:0 metrics:nil views:dictionary]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_timeLabel(60)]" options:0 metrics:nil views:dictionary]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.circleLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.timeLabel attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0]];
        
    }
    return self;
}

@end
