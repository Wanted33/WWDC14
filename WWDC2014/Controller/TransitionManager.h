//
//  TransitionManager.h
//  WWDC2014
//
//  Created by Quentin RUBINI on 06/04/2014.
//  Copyright (c) 2014 Quentin RUBINI. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, TransitionStep){
    INITIAL = 0,
    LEFT,
    RIGHT
};

@interface TransitionManager : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) TransitionStep transitionTo;

@end
