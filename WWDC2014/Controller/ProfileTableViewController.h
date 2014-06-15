//
//  ProfileTableViewController.h
//  WWDC2014
//
//  Created by Quentin RUBINI on 07/04/2014.
//  Copyright (c) 2014 Quentin RUBINI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>


@interface ProfileTableViewController : UITableViewController <UIViewControllerTransitioningDelegate,MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray *cursusArrayTitle;
@property (strong, nonatomic) NSMutableArray *cursusArrayDate;

@end
