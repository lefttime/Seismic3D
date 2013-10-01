//
//  PhotoWheelViewCell.m
//  Seismic3D
//
//  Created by Biaoqin Wen on 5/9/13.
//  Copyright (c) 2013 Biaoqin Wen. All rights reserved.
//

#import "PhotoWheelViewCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation PhotoWheelViewCell

- (void)setImage:(UIImage *)newImage
{
    CALayer* layer = [self layer];
    id imageRef = (__bridge id)[newImage CGImage];
    [layer setContents:imageRef];
    
    [layer setBorderColor:[UIColor colorWithWhite:1.0 alpha:1.0f].CGColor];
    [layer setBorderWidth:5.0];
    [layer setShadowOffset:CGSizeMake(0, 3)];
    [layer setShadowOpacity:0.7];
    [layer setShouldRasterize:YES];
}

@end
