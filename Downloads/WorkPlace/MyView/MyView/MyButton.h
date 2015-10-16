//
//  MyButton.h
//  MyView
//
//  Created by JayLam on 15/10/16.
//  Copyright © 2015年 JayLam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MyButton : UIButton
@property (assign,nonatomic) CGPoint titleOffset;
@property (assign,nonatomic) CGPoint imageOffset;

-(void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

-(void)setContentHorizontalAlignment:(UIControlContentHorizontalAlignment)contentHorizontalAlignment
__attribute__((unavailable("Use titleOffset and imageOffset instead")));

-(UIControlContentHorizontalAlignment)contentHorizontalAlignment
__attribute__((unavailable("Use titleOffset and imageOffset instead")));

-(void)setContentVerticalAlignment:(UIControlContentVerticalAlignment)contentVerticalAlignment
__attribute__((unavailable("Use titleOffset and imageOffset instead")));

-(UIControlContentVerticalAlignment)contentVerticalAlignment
__attribute__((unavailable("Use titleOffset and imageOffset instead")));

-(void)setTitleEdgeInsets:(UIEdgeInsets)titleEdgeInsets
__attribute__((unavailable("Use titleOffset and imageOffset instead")));

-(UIEdgeInsets)titleEdgeInsets
__attribute__((unavailable("Use titleOffset and imageOffset instead")));

-(void)setImageEdgeInsets:(UIEdgeInsets)imageEdgeInsets
__attribute__((unavailable("Use titleOffset and imageOffset instead")));

-(UIEdgeInsets)imageEdgeInsets
__attribute__((unavailable("Use titleOffset and imageOffset instead")));
@end
