//
//  CustomButton.h
//  AdvisorsHealthCloud
//
//  Created by Arash on 11/21/15.
//  Copyright (c) 2015 Arash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomButton : UIButton

+ (UIButton *)initButtonWithTitle:(NSString *)title withTitleColor:(UIColor *)titleColor
                    withBackColor:(UIColor *)backgroundColor withFrame:(CGRect)frame;
+ (UIButton *)initButtonWithTitle:(NSString *)title withTitleColor:(UIColor *)titleColor
                    withBackColor:(UIColor *)backgroundColor isRounded:(BOOL)isRounded withFrame:(CGRect)frame;
+ (UIButton *)initButtonWithImage:(UIImage *)image withFrame:(CGRect)frame;
@end
