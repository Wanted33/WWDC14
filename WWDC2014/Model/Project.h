//
//  Project.h
//  Quentin Rubini
//
//  Created by Quentin RUBINI on 08/04/2014.
//  Copyright (c) 2014 Quentin RUBINI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Project : NSObject

@property (strong, nonatomic) UIImage *bgImage;
@property (strong, nonatomic) UIImage *bgDetailImage;
@property (strong, nonatomic) NSString *descriptionText;
@property (strong, nonatomic) NSString *titleText;
@property (strong, nonatomic) NSString *linkText;
@property (strong, nonatomic) NSString *typeText;

@end
