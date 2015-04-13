//
//  KeyBoardLinkMoveUtility.m
//  KeyBoardLinkMove
//
//  Created by bref on 15/4/13.
//  Copyright (c) 2015年 bref. All rights reserved.
//

#import "KeyBoardLinkMoveUtility.h"

@implementation KeyBoardLinkMoveUtility

+ (void)keyboardWillShow:(NSNotification *)notif linkView:(UIView *)view
{
    
    NSDictionary *userInfo = [notif userInfo];
    NSValue *value = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    CGRect keyboardRect = [value CGRectValue];
    
    CGRect newTextViewFrame = view.frame;
    newTextViewFrame.origin.y = keyboardRect.origin.y - view.frame.size.height;
    
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    
    //整个动画是变速的,设定与其完全保持一致
    NSValue *animationCurveObject = [userInfo valueForKey:UIKeyboardAnimationCurveUserInfoKey];
    NSUInteger animationCurve;
    [animationCurveObject getValue:&animationCurve];
    
    //动画开始
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:(UIViewAnimationCurve)animationCurve];
    view.frame = newTextViewFrame;
    [UIView commitAnimations];

}

+ (void)keyboardWillHidden:(NSNotification *)notif linkView:(UIView *)view
{
    CGRect newTextViewFrame = view.frame;
    newTextViewFrame.origin.y = [view superview].frame.size.height - view.frame.size.height;
    
    NSDictionary *userInfo = [notif userInfo];
    //键盘的动画时间,设定与其完全一致
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    
    //键盘的动画是变速的,设定与其完全保持一致
    NSValue *animationCurveObject = [userInfo valueForKey:UIKeyboardAnimationCurveUserInfoKey];
    NSUInteger animationCurve;
    [animationCurveObject getValue:&animationCurve];
    
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:(UIViewAnimationCurve)animationCurve];
    view.frame = newTextViewFrame;
    [UIView commitAnimations];
}

@end
