//
//  WorksTableViewController.h
//  WWDC2014
//
//  Created by Quentin RUBINI on 07/04/2014.
//  Copyright (c) 2014 Quentin RUBINI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransitionManager.h"
#import "MyProjects.h"

@interface WorksTableViewController : UITableViewController <UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) MyProjects *allProjects;
@property (nonatomic, strong) TransitionManager *transitionManager;
@property (nonatomic, assign) BOOL *leftView;

@end
