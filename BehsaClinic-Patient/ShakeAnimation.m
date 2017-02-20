//
//  ShakeAnimation.m
//  AdvisorsHealthCloud
//
//  Created by Arash Z. Jahangiri on 12/8/15.
//  Copyright (c) 2015 Arash Z. Jahangiri. All rights reserved.
//

#import "ShakeAnimation.h"

@implementation ShakeAnimation

+ (void) startShake:(UIView*)view
{
    CGAffineTransform leftShake = CGAffineTransformMakeTranslation(-6, 0);
    CGAffineTransform rightShake = CGAffineTransformMakeTranslation(6, 0);
    
    view.transform = leftShake;  // starting point
    
    [UIView beginAnimations:@"shake_button" context:(__bridge void *)(view)];
    [UIView setAnimationRepeatAutoreverses:YES]; // important
    [UIView setAnimationRepeatCount:5];
    [UIView setAnimationDuration:0.09];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(shakeEnded:finished:context:)];
    
    view.transform = rightShake; // end here & auto-reverse
    
    [UIView commitAnimations];
}

+ (void) shakeEnded:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    if ([finished boolValue]) {
        UIView* item = (__bridge UIView *)context;
        item.transform = CGAffineTransformIdentity;
    }
}

@end
