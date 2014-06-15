//
//  TransitionManager.m
//  WWDC2014
//
//  Created by Quentin RUBINI on 06/04/2014.
//  Copyright (c) 2014 Quentin RUBINI. All rights reserved.
//

#import "TransitionManager.h"

@implementation TransitionManager

#pragma mark - UIViewControllerAnimatedTransitioning

//---------- Define the transition duration ----------
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 1.5;
}


//---------- Define the transition ----------
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
    //---------- View Initalisation ----------
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CGRect sourceRect = [transitionContext initialFrameForViewController:fromVC];
    
    
    //---------- Swipe from Left ----------
    if(self.transitionTo == LEFT){
        
        //---------- Settings for the fromVC ----------
        CGAffineTransform rotation;
        rotation = CGAffineTransformMakeRotation(M_PI);
        fromVC.view.frame = sourceRect;
        fromVC.view.layer.anchorPoint = CGPointMake(0.5, 0.0);
        fromVC.view.layer.position = CGPointMake(160.0, 0);
        
        //---------- Settings for the toVC ----------
        UIView *container = [transitionContext containerView];
        [container addSubview:toVC.view];
        [container insertSubview:toVC.view belowSubview:fromVC.view];
        CGPoint final_toVC_Center = toVC.view.center;
        
        toVC.view.center = CGPointMake(-sourceRect.size.width, sourceRect.size.height);
        toVC.view.transform = CGAffineTransformMakeRotation(M_PI/2);
        toVC.view.backgroundColor = [UIColor whiteColor];
        
        //---------- Settings Animations ----------
        [UIView animateWithDuration:1.0
                              delay:0.0
             usingSpringWithDamping:.8
              initialSpringVelocity:6.0
                            options:UIViewAnimationOptionCurveEaseIn
         
                         animations:^{

                             fromVC.view.transform = rotation;
                             toVC.view.center = final_toVC_Center;
                             toVC.view.transform = CGAffineTransformMakeRotation(0);
                         } completion:^(BOOL finished) {
                             
                             //When the animation is completed call completeTransition
                             [transitionContext completeTransition:YES];
                             
                         }];
    }
    
    //---------- Swipe from Right or to Back ----------
    else{
        
        //---------- Settings for the fromVC ----------
        CGAffineTransform rotation;
        rotation = CGAffineTransformMakeRotation(M_PI);
        UIView *container = [transitionContext containerView];
        fromVC.view.frame = sourceRect;
        fromVC.view.layer.anchorPoint = CGPointMake(0.5, 0.0);
        fromVC.view.layer.position = CGPointMake(160.0, 0);
        
        //---------- Settings for the toVC ----------
        [container insertSubview:toVC.view belowSubview:fromVC.view];
        
        toVC.view.layer.anchorPoint = CGPointMake(0.5, 0.0);
        toVC.view.layer.position = CGPointMake(160.0, 0);
        toVC.view.transform = CGAffineTransformMakeRotation(-M_PI);
        
        //---------- Settings Animations ----------
        [UIView animateWithDuration:1.0
                              delay:0.0
             usingSpringWithDamping:0.8
              initialSpringVelocity:6.0
                            options:UIViewAnimationOptionCurveEaseIn
         
                         animations:^{

                             fromVC.view.center = CGPointMake(fromVC.view.center.x - 320, fromVC.view.center.y);
                             toVC.view.transform = CGAffineTransformMakeRotation(-0);
                             
                         } completion:^(BOOL finished) {
                             
                             //When the animation is completed call completeTransition
                             [transitionContext completeTransition:YES];
                         }];
    }
    
    
}

@end
