//
//  MyButton.m
//  MyView
//
//  Created by JayLam on 15/10/16.
//  Copyright © 2015年 JayLam. All rights reserved.
//

#import "MyButton.h"
@interface MyButton()
@property (assign,nonatomic,getter=isShowing)BOOL showing;
@end
@implementation MyButton
-(instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.layer.anchorPoint = CGPointMake(0.5, 0.5);
        
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        _titleOffset = CGPointZero;
        _imageOffset = CGPointZero;
    }
        return self;
}

-(void)drawRect:(CGRect)rect
{
    CGPoint  centre;
    CGRect  bounds = [self bounds];
    centre.x = bounds.origin.x + bounds.size.width/2.0;
    centre.y = bounds.origin.y + bounds.size.height/2.0;
    
    float maxRadius = hypotf(bounds.size.width, bounds.size.width)/2.0;
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor lightGrayColor] setStroke];
    CGContextAddArc(context, centre.x, centre.y, maxRadius - 120, 0.0, M_PI*2.0, YES);
    CGContextStrokePath(context);
}

#pragma mark -
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat scaleX = [[self.layer valueForKeyPath:@"transform.scale.x"] floatValue];
    CGFloat scaleY = [[self.layer valueForKeyPath:@"transform.scale.y"] floatValue];
    
    CGRect selfFrame = CGRectMake(0.0f, 0.0f, self.frame.size.width/scaleX, self.frame.size.height/scaleY);
    
    CGSize sizeToFit = CGSizeMake(selfFrame.size.width - self.contentEdgeInsets.left - self.contentEdgeInsets.right, selfFrame.size.height - self.contentEdgeInsets.top - self.contentEdgeInsets.bottom);
    
    if (self.titleLabel.text.length) {
        CGSize titleLebelSize = [self.titleLabel sizeThatFits:sizeToFit];
        CGRect titleLabelFrame = CGRectMake(selfFrame.size.width/2 - titleLebelSize.width/2 + _titleOffset.x,
                                            selfFrame.size.height/2 - titleLebelSize.height/2 + _titleOffset.y,
                                            titleLebelSize.width, titleLebelSize.height);
        
        if ([UIScreen mainScreen].scale == 1.f) {
            titleLabelFrame = CGRectIntegral(titleLabelFrame);
            self.titleLabel.frame = titleLabelFrame;
        }
        
    }
    if (self.imageView.image) {
        CGSize imageViewSize = [self.imageView sizeThatFits:sizeToFit];
        CGRect imageViewFrame = CGRectMake(selfFrame.size.width/2 - imageViewSize.width/2 + _titleOffset.x,
                                           selfFrame.size.height/2 - imageViewSize.height/2 + _titleOffset.y,
                                           imageViewSize.width, imageViewSize.height);
        
        if ([UIScreen mainScreen].scale == 1.f) {
            imageViewFrame = CGRectIntegral(imageViewFrame);
            self.imageView.frame = imageViewFrame;
        }
    }
}

-(CGSize) sizeThatFits:(CGSize)size
{
    CGSize titleLabelSize = (self.titleLabel.text.length ? [self.titleLabel sizeThatFits:size] : CGSizeZero);
    CGSize imageViewSize = (self.imageView.image ? [self.imageView sizeThatFits:size] : CGSizeZero);
    
    CGSize resultSize = CGSizeMake(MAX(titleLabelSize.width, imageViewSize.width), MAX(titleLabelSize.height, imageViewSize.height));

    return resultSize;
}

-(void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state
{
    [self setBackgroundImage:[MyButton image1x1WithColor:backgroundColor]forState:state];
}

-(void)setTitleOffset:(CGPoint)titleOffset
{
    if (!CGPointEqualToPoint(_titleOffset, titleOffset)) {
        _titleOffset = titleOffset;
        [self layoutSubviews];
    }
}

-(void)setImageOffset:(CGPoint)imageOffset
{
    if (!CGPointEqualToPoint(_imageOffset, imageOffset)) {
        _imageOffset = imageOffset;
        [self layoutSubviews];
    }
}

#pragma mark - support

+(UIImage *)image1x1WithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.f, 0.f, 1.f, 1.f);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
    
}
@end
