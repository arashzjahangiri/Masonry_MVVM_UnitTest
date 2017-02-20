//
//  CustomButton.m
//  AdvisorsHealthCloud
//
//  Created by Arash on 11/21/15.
//  Copyright (c) 2015 Arash. All rights reserved.
//

#import "CustomButton.h"
#import "Header.h"
@implementation CustomButton

+ (UIButton *)initButtonWithTitle:(NSString *)title withTitleColor:(UIColor *)titleColor
                    withBackColor:(UIColor *)backgroundColor withFrame:(CGRect)frame{
    
    UIButton *customButton = [[UIButton alloc]initWithFrame:frame];
    [customButton setBackgroundColor:backgroundColor];
    [customButton setTitle:title forState:UIControlStateNormal];
    [customButton setTitleColor:titleColor forState:UIControlStateNormal];
    customButton.titleLabel.font = FONT_NORMAL(13);
    customButton.layer.cornerRadius = frame.size.height/2;
    
    return customButton;
    
}

+ (UIButton *)initButtonWithTitle:(NSString *)title withTitleColor:(UIColor *)titleColor
                    withBackColor:(UIColor *)backgroundColor isRounded:(BOOL)isRounded withFrame:(CGRect)frame{
    
    UIButton *customButton = [[UIButton alloc]initWithFrame:frame];
    [customButton setBackgroundColor:backgroundColor];
    [customButton setTitle:title forState:UIControlStateNormal];
    [customButton setTitleColor:titleColor forState:UIControlStateNormal];
    customButton.titleLabel.font = FONT_NORMAL(13);
    customButton.layer.borderColor = titleColor.CGColor;
    customButton.layer.borderWidth = 1.0;
    customButton.clipsToBounds = YES;
    customButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    customButton.titleLabel.minimumScaleFactor = 0.7;
    if (isRounded == YES) {
        customButton.layer.cornerRadius = frame.size.height/2;
    }
    
    
    return customButton;
    
}

+ (UIButton *)initButtonWithImage:(UIImage *)image withFrame:(CGRect)frame{
    
    UIButton *customButton = [[UIButton alloc]initWithFrame:frame];
    [customButton setBackgroundImage:image forState:UIControlStateNormal];
    customButton.layer.borderColor = [UIColor clearColor].CGColor;
    customButton.layer.borderWidth = 0.1;
    customButton.clipsToBounds = YES;
    return customButton;
    
}

@end
