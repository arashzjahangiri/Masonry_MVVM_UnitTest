//
//  AttributedTextClass.h
//  AdvisorsHealthCloud
//
//  Created by Arash on 12/21/15.
//  Copyright © 2015 Arash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AttributedTextClass : NSObject
+ (NSDictionary *)makeAttributedTextWithLineSpacing:(float)lineSpacing;
+ (NSDictionary *)makeAttributedTextJustifiedWithLineSpacing:(float)lineSpacing;
@end
