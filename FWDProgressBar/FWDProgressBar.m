//
//  FWDProgressBar.m
//  FWDProgressBar
//
//  Created by Adelstain on 15/8/24.
//  Copyright (c) 2015年 Adelstain. All rights reserved.
//

#import "FWDProgressBar.h"
#define UI_SCREEN_WIDTH                ([[UIScreen mainScreen] bounds].size.width)

@implementation FWDProgressBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"--");
        _btn1 = [[FWDProgressBtn alloc] initWithFrame:CGRectZero];
        _btn1.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_btn1];
        
        _btn2 = [[FWDProgressBtn alloc] initWithFrame:CGRectZero];
        _btn2.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_btn2];
        
        _btn3 = [[FWDProgressBtn alloc] initWithFrame:CGRectZero];
        _btn3.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_btn3];
        
        NSDictionary *dictionary = NSDictionaryOfVariableBindings(_btn3,_btn2,_btn1);
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_btn1(_btn2)][_btn2(_btn3)][_btn3(_btn1)]-10-|" options:0 metrics:nil views:dictionary]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_btn1]|" options:0 metrics:nil views:dictionary]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_btn2]|" options:0 metrics:nil views:dictionary]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_btn3]|" options:0 metrics:nil views:dictionary]];
    }
    return self;
}

-(void)updateProgressBarWithFWDProgressBtnNum:(NSNumber *)num time1:(NSNumber *)time1 time2:(NSNumber *)time2 time3:(NSNumber *)time3
{
    NSDate *now = [NSDate date];
    NSDate *deadtime1 = [NSDate dateWithTimeIntervalSince1970:time1.doubleValue/1000];
    NSDate *deadtime2 = [NSDate dateWithTimeIntervalSince1970:time2.doubleValue/1000];
    NSDate *deadtime3 = [NSDate dateWithTimeIntervalSince1970:time3.doubleValue/1000];
    
    if ([num  isEqual: @1]) {
        self.btn2.hidden = YES;
        self.btn3.hidden = YES;
        self.btn1.timeLabel.text = time1.stringValue;
        self.btn1.timeLabel.textColor = [UIColor redColor];
        self.btn1.lineLeft.backgroundColor = [UIColor redColor];
        self.btn1.circleLabel.backgroundColor = [UIColor redColor];
    }
    
    if ([num isEqual:@2]) {
        self.btn3.hidden = YES;
        self.btn1.timeLabel.text = time1.stringValue;
        self.btn2.timeLabel.text = time2.stringValue;
        if ([now compare:deadtime1]==NSOrderedAscending && [deadtime1 compare:deadtime2]==NSOrderedAscending) {
            self.btn1.lineLeft.backgroundColor = [UIColor redColor];
            self.btn1.circleLabel.backgroundColor = [UIColor redColor];
            self.btn1.timeLabel.textColor = [UIColor redColor];
        }
        else if([now compare:deadtime1]==NSOrderedDescending && [now compare:deadtime2]==NSOrderedAscending){
            self.btn1.lineRight.backgroundColor = [UIColor redColor];
            self.btn2.lineLeft.backgroundColor = [UIColor redColor];
            self.btn2.circleLabel.backgroundColor = [UIColor redColor];
            self.btn2.timeLabel.textColor = [UIColor redColor];
        }
    }
    
    if ([num isEqual:@3]) {
        self.btn1.timeLabel.text = time1.stringValue;
        self.btn2.timeLabel.text = time2.stringValue;
        self.btn3.timeLabel.text = time3.stringValue;
        if ([deadtime1 compare:deadtime2]==NSOrderedAscending && [deadtime2 compare:deadtime3]==NSOrderedAscending && [now compare:deadtime1]==NSOrderedAscending) {
            self.btn1.lineLeft.backgroundColor = [UIColor redColor];
            self.btn1.circleLabel.backgroundColor = [UIColor redColor];
            self.btn1.timeLabel.textColor = [UIColor redColor];
        }else if ([deadtime1 compare:deadtime2]==NSOrderedAscending && [deadtime2 compare:deadtime3]==NSOrderedAscending && [now compare:deadtime2]==NSOrderedAscending && [now compare:deadtime1]==NSOrderedDescending){
            self.btn1.lineRight.backgroundColor = [UIColor redColor];
            self.btn2.lineLeft.backgroundColor = [UIColor redColor];
            self.btn2.circleLabel.backgroundColor = [UIColor redColor];
            self.btn2.timeLabel.textColor = [UIColor redColor];
        }else if ([deadtime1 compare:deadtime2]==NSOrderedAscending && [deadtime2 compare:deadtime3]==NSOrderedAscending && [now compare:deadtime3]==NSOrderedAscending && [now compare:deadtime2]==NSOrderedDescending){
            self.btn2.lineRight.backgroundColor = [UIColor redColor];
            self.btn3.lineLeft.backgroundColor = [UIColor redColor];
            self.btn3.circleLabel.backgroundColor = [UIColor redColor];
            self.btn3.timeLabel.textColor = [UIColor redColor];
        }
    }
    
    [self updateViewsConstraints];
}

-(void)updateViewsConstraints
{
    if (self.btn2.hidden && self.btn3.hidden) {
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.btn1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0 constant:-20.0f]];
    }
    
    if (self.btn3.hidden) {
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.btn1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0.f]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.btn2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.btn1 attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0.f]];
    }
}

@end
