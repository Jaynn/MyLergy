//
//  NewView.m
//  MyView
//
//  Created by JayLam on 15/10/16.
//  Copyright © 2015年 JayLam. All rights reserved.
//

#import "NewView.h"

@implementation NewView
-(void)drawRect:(CGRect)rect
{
    CGPoint  centre;
    CGRect  bounds = [self bounds];
    centre.x = bounds.origin.x + bounds.size.width/2.0;
    centre.y = bounds.origin.y + bounds.size.height/2.0;
    
    float maxRadius = hypotf(bounds.size.width, bounds.size.width)/2.0;
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor lightGrayColor] setStroke];
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -=20 ) {
        CGContextAddArc(context, centre.x, centre.y, currentRadius, 0.0, M_PI*2.0, YES);
        CGContextStrokePath(context);
    }
}
@end
