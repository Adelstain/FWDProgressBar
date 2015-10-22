//
//  FWDProgressBtn.h
//  FWDProgressBar
//
//  Created by Adelstain on 15/8/24.
//  Copyright (c) 2015年 Adelstain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FWDProgressBtn : UIButton

@property(nonatomic,strong) UIView *lineLeft;
@property (strong, nonatomic) UIView *lineRight;
@property (strong,nonatomic) UILabel *circleLabel;
@property (retain, nonatomic) UILabel *timeLabel;

@end
