//
//  ImageResizer.h
//  AdvisorsHealthCloud
//
//  Created by Arash Z. Jahangiri on 11/21/15.
//  Copyright (c) 2015 Arash Z. Jahangiri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageResizer : UIImageView

+(UIImageView *)resizeImageWithImage:(UIImage *)image withWidth:(CGFloat)width withPoint:(CGPoint)point;
+(UIImageView *)resizeImageWithImage:(UIImage *)image withHeight:(CGFloat)height withPoint:(CGPoint)point;
@end
