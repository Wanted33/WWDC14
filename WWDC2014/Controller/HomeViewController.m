//
//  HomeViewController.m
//  WWDC2014
//
//  Created by Quentin RUBINI on 06/04/2014.
//  Copyright (c) 2014 Quentin RUBINI. All rights reserved.
//

#import "HomeViewController.h"
#import "FontAwesomeKit.h"
#import "WorksTableViewController.h"
#import "ProfileTableViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //---------- Personnalisation des éléments ----------
    _homeProfileImage.image = [UIImage imageNamed:@"home-profile"];
    _introProfileImage.image = [UIImage imageNamed:@"intro-profile"];
    
    FAKFontAwesome *starIcon = [FAKFontAwesome starIconWithSize:15];
    [starIcon addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor]];
    
    //---------- Transition manager ----------
    self.transitionManager = [[TransitionManager alloc]init];
    
    //---------- Swipe for Projects View ----------
    UISwipeGestureRecognizer *swipeProject = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(showProjects:)];
    swipeProject.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeProject];
    
    //---------- Swipe for Intro View ----------
    UISwipeGestureRecognizer *swipeIntro = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(showIntros:)];
    swipeIntro.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeIntro];
    
}

#pragma mark - View delegate

-(void)showProjects:(UIGestureRecognizer*)gesture {
    
    [self setLeftView:NO];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    WorksTableViewController *projectView = [storyboard instantiateViewControllerWithIdentifier:@"WorksTableViewController"];
    projectView.transitioningDelegate = self;
    projectView.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:projectView animated:YES completion:nil];
    
}

-(void)showIntros:(UIGestureRecognizer*)gesture {
    
    [self setLeftView:YES];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ProfileTableViewController *profileView = [storyboard instantiateViewControllerWithIdentifier:@"ProfileTableViewController"];
    profileView.transitioningDelegate = self;
    profileView.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:profileView animated:YES completion:nil];
    
}

#pragma mark - Navigation delegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                   presentingController:(UIViewController *)presenting
                                                                       sourceController:(UIViewController *)source {
    if (_leftView) {
        self.transitionManager.transitionTo = LEFT;
        return self.transitionManager;
    }
    else {
        self.transitionManager.transitionTo = RIGHT;
        return self.transitionManager;
    }

}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    self.transitionManager.transitionTo = INITIAL;
    return self.transitionManager;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
