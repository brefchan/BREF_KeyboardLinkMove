//
//  KeyBoardLinkMoveUtility.h
//  KeyBoardLinkMove
//
//  Created by bref on 15/4/13.
//  Copyright (c) 2015年 bref. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyBoardLinkMoveUtility : NSObject

+ (void)keyboardWillShow:(NSNotification *)notif linkView:(UIView *)view;

+ (void)keyboardWillHidden:(NSNotification *)notif linkView:(UIView *)view;

@end
