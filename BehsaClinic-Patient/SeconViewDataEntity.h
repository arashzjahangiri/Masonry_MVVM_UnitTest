//
// Created by Arash on 15/12/5.
// Copyright (c) 2015 Arash Z. Jahangiri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SeconViewDataEntity : NSObject
@property (copy, nonatomic) NSString *content;
@property (assign, nonatomic) BOOL expanded;
@property (assign, nonatomic) CGFloat cellHeight;
@end
