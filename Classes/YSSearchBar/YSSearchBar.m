//
//  YSSearchBar.m
//  YSSearchBarExample
//
//  Created by Yu Sugawara on 2016/02/25.
//  Copyright © 2016年 Yu Sugawara. All rights reserved.
//

#import "YSSearchBar.h"

static CGFloat const kDefaultHorizontalMargin = 8.;

@interface YSSearchBar ()

@end

@implementation YSSearchBar

- (void)setLeftButton:(UIButton *)leftButton
{
    [_leftButton removeFromSuperview];
    _leftButton = leftButton;
    
    if (leftButton) {
        [leftButton sizeToFit];
        [self addSubview:leftButton];
    }
}

- (void)setRightButton:(UIButton *)rightButton
{
    [_rightButton removeFromSuperview];
    _rightButton = rightButton;
    self.forceCancelButtonHidden = NO;
    
    if (rightButton) {
        self.forceCancelButtonHidden = YES;
        
        [rightButton sizeToFit];
        [self addSubview:rightButton];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.forceCancelButtonHidden) {
        [self setShowsCancelButton:NO animated:NO];
    }
    
    if (self.leftButton) {
        CGRect frame = self.leftButton.frame;
        frame.origin.x = kDefaultHorizontalMargin;
        frame.origin.y = 0.;
        frame.size.height = self.bounds.size.height;
        self.leftButton.frame = frame;
    }
    
    if (self.rightButton) {
        CGRect frame = self.rightButton.frame;
        frame.origin.x = self.bounds.size.width - self.rightButton.bounds.size.width - kDefaultHorizontalMargin;
        frame.origin.y = 0.;
        frame.size.height = self.bounds.size.height;
        self.rightButton.frame = frame;
    }
    
    if (self.leftButton || self.rightButton) {
        UITextField *textFiled;
        for (UIView *subView in self.subviews) {
            for (UITextField *tf in subView.subviews) {
                if ([tf isKindOfClass:[UITextField class]]) {
                    textFiled = tf;
                    break;
                }
            }
            if (textFiled) {
                break;
            }
        }
        NSParameterAssert(textFiled);
        if (textFiled) {
            CGRect frame = textFiled.frame;
            CGFloat x = CGRectGetMaxX(self.leftButton.frame) + kDefaultHorizontalMargin;
            frame.origin.x = x;
            frame.size.width = self.bounds.size.width - x - kDefaultHorizontalMargin - (self.rightButton ? self.rightButton.bounds.size.width + kDefaultHorizontalMargin : 0.);
            textFiled.frame = frame;
        }
    }
}

@end
