//
//  KeyBoardLinkMoveUtility.m
//  KeyBoardLinkMove
//
//  Created by bref on 15/4/13.
//  Copyright (c) 2015年 bref. All rights reserved.
//

#import "KeyBoardLinkMoveUtility.h"

static KeyBoardLinkMoveUtility *_shareInstance = nil;

@interface KeyBoardLinkMoveUtility()

@property (weak, nonatomic) UIView *linkView;

@end

@implementation KeyBoardLinkMoveUtility

+ (KeyBoardLinkMoveUtility *)sharedInstance
{
    @synchronized([KeyBoardLinkMoveUtility class]){
        if (!_shareInstance) {
            _shareInstance = [[KeyBoardLinkMoveUtility alloc] init];
        }
        return _shareInstance;
    }
    return nil;
}

+ (id)alloc
{
    @synchronized([KeyBoardLinkMoveUtility class])
    {
        if (!_shareInstance) {
            _shareInstance = [super alloc];
        }
        return _shareInstance;
    }
    return nil;
}


- (void)addObserverWithLinkView:(UIView *)view
{
    self.linkView = view;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHidden:) name:UIKeyboardWillHideNotification object:nil];
}


- (void)keyboardWillShow:(NSNotification *)notif
{
    
    NSDictionary *userInfo = [notif userInfo];
    NSValue *value = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    
    CGRect keyboardRect = [value CGRectValue];
    
    CGRect newTextViewFrame = _linkView.frame;
    newTextViewFrame.origin.y = keyboardRect.origin.y - _linkView.frame.size.height;
    
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
    _linkView.frame = newTextViewFrame;
    [UIView commitAnimations];

}

- (void)keyboardWillHidden:(NSNotification *)notif
{
    CGRect newTextViewFrame = _linkView.frame;
    newTextViewFrame.origin.y = [_linkView superview].frame.size.height - _linkView.frame.size.height;
    
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
    _linkView.frame = newTextViewFrame;
    [UIView commitAnimations];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
