//
//  FSAlertMessageView.m
//  filimo
//
//  Created by Farzad Sharbafian on 2015-07-12.
//  Copyright (c) 2015 Amir Abbas Kashani. All rights reserved.
//

#import "AZJAlertView.h"
#import "AppDelegate.h"

const NSUInteger	kDefaultTimeInterval	= 4;

@interface AZJAlertView () {
	__strong UIView *messageView;
	NSTimer *timer;
}

@end

@implementation AZJAlertView

- (instancetype)init
{
	self = [super init];
	if (self) {
		timer = nil;
		messageView = nil;
	}
	return self;
}

+ (AZJAlertView *)sharedInstance {
	static AZJAlertView *sharedInstance;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedInstance = [AZJAlertView new];
	});
	return sharedInstance;
}

- (UIColor *)errorTextColor {
	return [UIColor colorWithRed:0.907 green:0.927 blue:0.931 alpha:1.000];
}
- (UIColor *)errorViewColor {
	return [UIColor colorWithRed:0.872 green:0.207 blue:0.182 alpha:0.900];
}


- (UIColor *)infoTextColor {
	return [UIColor colorWithRed:0.907 green:0.927 blue:0.931 alpha:1.000];
}
- (UIColor *)infoViewColor {
	return [UIColor colorWithRed:0.174 green:0.774 blue:0.368 alpha:0.900];
}


- (UIColor *)warningTextColor {
	return [UIColor colorWithRed:0.907 green:0.927 blue:0.931 alpha:1.000];
}
- (UIColor *)warningViewColor {
	return [UIColor colorWithRed:0.933 green:0.542 blue:0.069 alpha:0.900];
}

- (void)showMessage:(NSString *)message withType:(AZJAlertViewType)type {
	UIColor *tColor, *vColor;
	switch (type) {
		case AZJAlertMessageTypeInfo:
			tColor = [self infoTextColor];
			vColor = [self infoViewColor];
			break;
			
		case AZJAlertMessageTypeError:
			tColor = [self errorTextColor];
			vColor = [self errorViewColor];
			break;
			
		case AZJAlertMessageTypeWarning:
			tColor = [self warningTextColor];
			vColor = [self warningViewColor];
			break;
  default:
			break;
	}
	
	[self showMessage:message withTextColor:tColor withViewColor:vColor];
}

- (void)showMessage:(NSString *)message withTextColor:(UIColor *)tColor withViewColor:(UIColor *)vColor {
    if (!message || [message isKindOfClass:[NSNull class]])
		return;
	
	[self dismissMessageView];
	
	UIWindow *window = [(AppDelegate *)[[UIApplication sharedApplication] delegate] window];
	
	messageView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, window.frame.size.width, 0)];
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissMessageView)];
	[messageView addGestureRecognizer:tap];
	messageView.clipsToBounds = YES;
	UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
	
	[messageView addSubview:label];
	[window addSubview:messageView];
	
	label.text = message;
	label.numberOfLines = 0;
	label.font = FONT_NORMAL(13);
	label.textAlignment = NSTextAlignmentCenter;
	label.textColor = tColor;
	label.tag = 0;
	
	CGFloat imageHeight = 26.0;
	
	CGSize fitSize = [label sizeThatFits:CGSizeMake(screenWidth - imageHeight - 16, MAXFLOAT)];
	fitSize.width = window.frame.size.width - imageHeight - 16;
	fitSize.height += 20;
	CGFloat height = fitSize.height;
	CGRect newFrame = label.frame;
	newFrame.size = fitSize;
	label.frame = newFrame;
	label.textAlignment = NSTextAlignmentRight;
	messageView.backgroundColor = vColor;
    
	[UIView
	 animateWithDuration:0.4
	 delay:0.0
	 usingSpringWithDamping:1.0
	 initialSpringVelocity:12.0
	 options:0
	 animations:^{
		 CGRect frame = messageView.frame;
		 frame.size.height = height;
		 messageView.frame = frame;
		 
		 
	 } completion:nil];
	
	[timer invalidate];
	timer = nil;
	timer = [NSTimer scheduledTimerWithTimeInterval:kDefaultTimeInterval * 0.5 target:self selector:@selector(dismissMessageView) userInfo:nil repeats:NO];
}


- (void)dismissMessageView {
	[UIView
	 animateWithDuration:0.4
	 delay:0
	 usingSpringWithDamping:1.0
	 initialSpringVelocity:12.0
	 options:0
	 animations:^{
		 CGRect frame = messageView.frame;
		 frame.size.height = 0;
		 messageView.frame = frame;
		 
	 } completion:^(BOOL finished) {
	 }];
}


@end
