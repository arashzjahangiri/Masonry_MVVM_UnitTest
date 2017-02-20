//
//  DocumentDirectoy.m
//  AdvisorsHealthCloud
//
//  Created by Arash on 12/15/15.
//  Copyright (c) 2015 Arash. All rights reserved.
//

#import "DocumentDirectoy.h"

@implementation DocumentDirectoy
+ (NSString *)getDocuementsDirectory{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *appDocumentsDirectory = [paths objectAtIndex:0];
    return appDocumentsDirectory;
}
@end
