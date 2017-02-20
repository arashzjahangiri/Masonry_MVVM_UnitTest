//
//  ImageResizer.m
//  AdvisorsHealthCloud
//
//  Created by Arash Z. Jahangiri on 11/21/15.
//  Copyright (c) 2015 Arash Z. Jahangiri. All rights reserved.
//

#import "ImageResizer.h"

@implementation ImageResizer

+(UIImageView *)resizeImageWithImage:(UIImage *)image withWidth:(CGFloat)width withPoint:(CGPoint)point{
    
    if (image) {
        CGFloat imageRatio = width / image.size.width;
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(point.x, point.y, width, image.size.height * imageRatio)];
        imageView.image = image;
        return imageView;
    }else{
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        imageView.image = [UIImage imageNamed:@""];
        return imageView;
    }
    
}

+(UIImageView *)resizeImageWithImage:(UIImage *)image withHeight:(CGFloat)height withPoint:(CGPoint)point{
    if (image) {
        CGFloat imageRatio = height / image.size.height;
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(point.x, point.y, image.size.width * imageRatio, height)];
        imageView.image = image;
        return imageView;
    } else {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        imageView.image = [UIImage imageNamed:@""];
        return imageView;
    }
    
}


@end
