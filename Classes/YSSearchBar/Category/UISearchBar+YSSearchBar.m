//
//  UISearchBar+YSSearchBar.m
//  YSSearchBarExample
//
//  Created by Yu Sugawara on 2016/02/26.
//  Copyright © 2016年 Yu Sugawara. All rights reserved.
//

#import "UISearchBar+YSSearchBar.h"

@implementation UISearchBar (YSSearchBar)

- (UITextField *)ys_textFiled
{
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
    return textFiled;
}

@end
