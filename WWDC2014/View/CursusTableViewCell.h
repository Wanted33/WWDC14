//
//  CursusTableViewCell.h
//  WWDC2014
//
//  Created by Quentin RUBINI on 07/04/2014.
//  Copyright (c) 2014 Quentin RUBINI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CursusTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *detailCursusLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateCursusLabel;

@property (strong, nonatomic) IBOutlet UIView *logoDateView;
@end
