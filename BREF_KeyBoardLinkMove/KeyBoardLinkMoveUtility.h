//
//  KeyBoardLinkMoveUtility.h
//  KeyBoardLinkMove
//
//  Created by bref on 15/4/13.
//  Copyright (c) 2015年 bref. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyBoardLinkMoveUtility : NSObject

+ (KeyBoardLinkMoveUtility *)sharedInstance;

- (void)addObserverWithLinkView:(UIView *)view;

@end
