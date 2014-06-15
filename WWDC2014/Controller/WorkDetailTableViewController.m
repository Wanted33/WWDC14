//
//  WorkDetailTableViewController.m
//  WWDC2014
//
//  Created by Quentin RUBINI on 07/04/2014.
//  Copyright (c) 2014 Quentin RUBINI. All rights reserved.
//

#import "WorkDetailTableViewController.h"
#import "SliderTableViewCell.h"

@interface WorkDetailTableViewController ()

@end

@implementation WorkDetailTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //---------- Initilisation ----------
    _imageDetail = [[UIImage alloc]init];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 400;
    }
    if (indexPath.row == 2) {
        
        NSAttributedString *attributedText = [[NSAttributedString alloc]initWithString:_project.descriptionText attributes:@ {
            NSFontAttributeName:[UIFont systemFontOfSize:14],
        }];
        CGRect rect = [attributedText boundingRectWithSize:(CGSize){self.tableView.frame.size.width, CGFLOAT_MAX} options:NSStringDrawingUsesLineFragmentOrigin context:nil];
        CGSize size = rect.size;
        
        _heightDescriptionView = size.height + 40;
        
        return _heightDescriptionView;
        
    }
    else {
        return 44;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SliderTableViewCell *sliderCell = [tableView dequeueReusableCellWithIdentifier:@"mainCell"];
    UITableViewCell *titleCell = [tableView dequeueReusableCellWithIdentifier:@"titleCell"];
    UITableViewCell *descriptionCell = [tableView dequeueReusableCellWithIdentifier:@"descriptionCell"];
    UITableViewCell *linkCell = [tableView dequeueReusableCellWithIdentifier:@"linkCell"];
    
    
    //---------- Custom Cell ----------
    sliderCell.imageSlider.image = _project.bgDetailImage;
    
    //---------- Title Cell ----------
    titleCell.textLabel.text = _project.titleText;
    titleCell.textLabel.textAlignment = NSTextAlignmentCenter;
    titleCell.textLabel.font = [UIFont boldSystemFontOfSize:20];
    titleCell.textLabel.textColor = [UIColor lightGrayColor];

    //---------- Description Cell ----------
    _descriptionView = [[UITextView alloc]init];
    _descriptionView.editable = NO;
    _descriptionView.scrollEnabled = NO;
    _descriptionView.textAlignment = NSTextAlignmentJustified;
    _descriptionView.textColor = [UIColor lightGrayColor];
    _descriptionView.frame = CGRectMake(0, 0, linkCell.frame.size.width, _heightDescriptionView);
    _descriptionView.text = _project.descriptionText;
    _descriptionView.font = [UIFont systemFontOfSize:14];
    [descriptionCell addSubview:_descriptionView];
    
    //---------- Link Cell ----------
    linkCell.textLabel.text = @"View project";
    linkCell.textLabel.textAlignment = NSTextAlignmentCenter;
    linkCell.textLabel.textColor = [UIColor whiteColor];
    linkCell.backgroundColor = [UIColor colorWithRed:0.39 green:0.69 blue:0.56 alpha:1];
    
    
    //---------- Configuration Cell ----------
    if (indexPath.row == 0) {
        return sliderCell;
    }
    else if (indexPath.row == 1) {
        return titleCell;
    }
    else if (indexPath.row == 2) {
        return descriptionCell;
    }
    else if (indexPath.row == 3) {
        return linkCell;
    }
    else {
        return titleCell;
    }
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 3) {
        NSString *linkURLString = _project.linkText;
        NSURL *projectURL = [NSURL URLWithString:linkURLString];
        [[UIApplication sharedApplication] openURL:projectURL];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
