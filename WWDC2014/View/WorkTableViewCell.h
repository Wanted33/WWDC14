//
//  WorkTableViewCell.h
//  WWDC2014
//
//  Created by Quentin RUBINI on 07/04/2014.
//  Copyright (c) 2014 Quentin RUBINI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorkTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *bgImageView;
@property (strong, nonatomic) IBOutlet UIView *typeWorkView;
@property (strong, nonatomic) IBOutlet UILabel *typeWorkText;
@property (strong, nonatomic) IBOutlet UILabel *titleWorkLabel;
@property (strong, nonatomic) IBOutlet UILabel *websiteWorkLabel;

@end
