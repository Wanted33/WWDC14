//
//  HomeViewController.h
//  WWDC2014
//
//  Created by Quentin RUBINI on 06/04/2014.
//  Copyright (c) 2014 Quentin RUBINI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
#import "TransitionManager.h"

@interface HomeViewController : UIViewController <UIViewControllerTransitioningDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *introProfileImage;
@property (strong, nonatomic) IBOutlet UIImageView *homeProfileImage;

@property (nonatomic, strong) TransitionManager *transitionManager;
@property BOOL leftView;

@end
