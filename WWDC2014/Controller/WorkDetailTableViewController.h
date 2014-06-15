//
//  WorkDetailTableViewController.h
//  WWDC2014
//
//  Created by Quentin RUBINI on 07/04/2014.
//  Copyright (c) 2014 Quentin RUBINI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Project.h"

@interface WorkDetailTableViewController : UITableViewController

@property (strong, nonatomic) Project *project;

@property (strong, nonatomic) UIImage *imageDetail;
@property (strong, nonatomic) UITextView *descriptionView;
@property CGFloat heightDescriptionView;

@end
