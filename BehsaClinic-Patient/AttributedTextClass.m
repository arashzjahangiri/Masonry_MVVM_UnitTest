//
//  AttributedTextClass.m
//  AdvisorsHealthCloud
//
//  Created by Arash on 12/21/15.
//  Copyright © 2015 Arash. All rights reserved.
//

#import "AttributedTextClass.h"
#import <UIKit/UIKit.h>
@implementation AttributedTextClass
+ (NSDictionary *)makeAttributedTextWithLineSpacing:(float)lineSpacing
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setAlignment:NSTextAlignmentRight];
    paragraphStyle.minimumLineHeight = lineSpacing;
    paragraphStyle.maximumLineHeight = lineSpacing;
    NSDictionary *attributtes = @{
                                  NSParagraphStyleAttributeName : paragraphStyle,
                                  };
    return attributtes;

}

+ (NSDictionary *)makeAttributedTextJustifiedWithLineSpacing:(float)lineSpacing
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setAlignment:NSTextAlignmentJustified];
    paragraphStyle.minimumLineHeight = lineSpacing;
    paragraphStyle.maximumLineHeight = lineSpacing;
    NSDictionary *attributtes = @{
                                  NSParagraphStyleAttributeName : paragraphStyle,
                                  };
    return attributtes;
    
}

@end
