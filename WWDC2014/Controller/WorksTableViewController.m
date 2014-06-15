//
//  WorksTableViewController.m
//  WWDC2014
//
//  Created by Quentin RUBINI on 07/04/2014.
//  Copyright (c) 2014 Quentin RUBINI. All rights reserved.
//

#import "WorksTableViewController.h"
#import "HomeViewController.h"
#import "WorkTableViewCell.h"
#import "FontAwesomeKit.h"
#import "WorkDetailTableViewController.h"
#import "Project.h"

@interface WorksTableViewController ()

@end

@implementation WorksTableViewController

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
    
    //---------- Transition manager ----------
    self.transitionManager = [[TransitionManager alloc]init];
    
    //---------- Initialisation ----------
    self.allProjects = [[MyProjects alloc]init];
    
    //---------- Simple gesture recognizer for Swipe left ----------
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(showHome:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
    
    //---------- Custom Table View ----------
    self.tableView.backgroundColor = [UIColor colorWithRed:0.9 green:0.88 blue:0.88 alpha:1];
    
    //---------- Custom Back Button ----------
    FAKFontAwesome *userIcon = [FAKFontAwesome arrowCircleOLeftIconWithSize:20];
    [userIcon addAttribute:NSForegroundColorAttributeName value:[UIColor darkGrayColor]];
    UIImage *iconUser = [userIcon imageWithSize:CGSizeMake(20, 20)];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]initWithImage:[iconUser imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backHome:)];
    
    self.navigationItem.leftBarButtonItem = backButton;
    
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
    return _allProjects.projects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WorkTableViewCell *workCell = [tableView dequeueReusableCellWithIdentifier:@"workCell"];
    
    //---------- Custom workCell ----------
    workCell.backgroundColor = [UIColor clearColor];
    
    //---------- Cell configuration ----------
    workCell.bgImageView.image = [[_allProjects.projects objectAtIndex:indexPath.row]bgImage];
    workCell.titleWorkLabel.text = [[_allProjects.projects objectAtIndex:indexPath.row]titleText];
    workCell.typeWorkText.text = [[_allProjects.projects objectAtIndex:indexPath.row]typeText];
    workCell.websiteWorkLabel.text = [[_allProjects.projects objectAtIndex:indexPath.row]linkText];
    
    return workCell;
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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    if ([[segue identifier] isEqualToString:@"detailSegue"])
    {
        NSIndexPath *path = [self.tableView indexPathForSelectedRow];
        WorkDetailTableViewController *detailView = [segue destinationViewController];
        Project *selectedProject = [_allProjects.projects objectAtIndex:path.row];
        detailView.project = selectedProject;
        
    }

}

#pragma mark - Navigation Delegate

-(void)showHome:(UIGestureRecognizer*)gesture {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    HomeViewController *homeView = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    homeView.transitioningDelegate = self;
    homeView.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:homeView animated:YES completion:nil];
    
}

-(IBAction)backHome:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    HomeViewController *homeView = [storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
    homeView.transitioningDelegate = self;
    homeView.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:homeView animated:YES completion:nil];
    
}


#pragma mark - Transitions delegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                   presentingController:(UIViewController *)presenting
                                                                       sourceController:(UIViewController *)source {
    
    self.transitionManager.transitionTo = LEFT;
    return self.transitionManager;
    
}

@end
