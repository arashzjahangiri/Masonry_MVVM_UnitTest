//
//  AZJAlertView.h
//
//  Created by Arash Z. Jahangiri on 2017-03-13.
//  Copyright (c) 2017 Arash Z. Jahangiri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AZJAlertView : NSObject


typedef enum{
    AZJAlertMessageTypeError,
    AZJAlertMessageTypeInfo,
    AZJAlertMessageTypeWarning
}AZJAlertViewType;

- (void)showMessage:(NSString *)message withType:(AZJAlertViewType)type;
+ (AZJAlertView *)sharedInstance;

@end
