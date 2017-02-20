//
//  ToastView.m
//  BehsaClinic-Patient
//
//  Created by Arash Z. Jahangiri on 2/11/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

#import "ToastView.h"

@implementation ToastView

+(UIView *)message:(NSString *)message{
    UIView *aview = [[UIView alloc]initWithFrame:CGRectMake(0, -64, screenWidth, 64)];
    aview.backgroundColor = [UIColor redColor];
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 15, screenWidth, 45)];
    titleLabel.text = message;
    titleLabel.font = FONT_NORMAL(15);
    titleLabel.numberOfLines = 2;
    titleLabel.minimumScaleFactor = 0.5;
    titleLabel.adjustsFontSizeToFitWidth = YES;
    titleLabel.baselineAdjustment = YES;
    titleLabel.clipsToBounds = YES;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [aview addSubview:titleLabel];
    
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        CGRect rect = aview.frame;
        rect.origin.y = 0;
        [aview setFrame:rect];
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.2 delay:3.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            CGRect rect = aview.frame;
            rect.origin.y = -64;
            [aview setFrame:rect];
            aview.backgroundColor = [UIColor clearColor];
            
        } completion:^(BOOL finished) {
            
        }];
    }];
    return aview;
}

@end
