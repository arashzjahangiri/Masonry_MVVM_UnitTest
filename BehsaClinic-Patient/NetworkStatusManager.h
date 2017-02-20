//
//  NetworkStatusManager.h
//  BehsaClinic-Patient
//
//  Created by Arash on 16/6/3.
//  Copyright © 2016 Arash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworkReachabilityManager.h"
typedef NS_ENUM(NSInteger, NetworkStatusType) {
    NetworkStatusUnknown = -1,        // Not recognized
    NetworkStatusNotReachable = 0,    // not connected
    NetworkStatusWWAN,                // 3G
    NetworkStatusWiFi                 // WiFi
    
};

@interface NetworkStatusManager : NSObject

@property (nonatomic, assign)NSInteger networkStatus;
+ (instancetype)sharedManager;

@end
