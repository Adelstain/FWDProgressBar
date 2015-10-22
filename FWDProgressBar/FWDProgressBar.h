//
//  FWDProgressBar.h
//  FWDProgressBar
//
//  Created by Adelstain on 15/8/24.
//  Copyright (c) 2015年 Adelstain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FWDProgressBtn.h"

@interface FWDProgressBar : UIView

@property (strong, nonatomic) FWDProgressBtn *btn1;
@property (strong, nonatomic) FWDProgressBtn *btn2;
@property (strong, nonatomic) FWDProgressBtn *btn3;

-(void)updateProgressBarWithFWDProgressBtnNum:(NSNumber *)num time1:(NSNumber *)time time2:(NSNumber *)time2 time3:(NSNumber *)time3;

@end
