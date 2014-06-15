//
//  ProfileTableViewController.m
//  WWDC2014
//
//  Created by Quentin RUBINI on 07/04/2014.
//  Copyright (c) 2014 Quentin RUBINI. All rights reserved.
//

#import "ProfileTableViewController.h"
#import "FontAwesomeKit.h"
#import "CursusTableViewCell.h"
#import "HomeViewController.h"

@interface ProfileTableViewController ()

@end

@implementation ProfileTableViewController

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
    
    
    //---------- Setting the swipe for back to home view ----------
    UISwipeGestureRecognizer *swipeProject = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss:)];
    swipeProject.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeProject];
    
    //---------- Custom Back Button ----------
    FAKFontAwesome *userIcon = [FAKFontAwesome arrowCircleOLeftIconWithSize:20];
    [userIcon addAttribute:NSForegroundColorAttributeName value:[UIColor darkGrayColor]];
    UIImage *iconUser = [userIcon imageWithSize:CGSizeMake(20, 20)];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc]initWithImage:[iconUser imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backHome:)];
    
    self.navigationItem.leftBarButtonItem = backButton;
    
    //---------- Initialisation Cursus Array Title ----------
    _cursusArrayTitle = [[NSMutableArray alloc]init];
    [_cursusArrayTitle addObject:@"Prepa2 at school Ingesup (Bac +2)"];
    [_cursusArrayTitle addObject:@"Internship at the web agency Toile Design"];
    [_cursusArrayTitle addObject:@"Prepa1 at school Ingesup (Bac +1)"];
    [_cursusArrayTitle addObject:@"Job at the city green space service"];
    [_cursusArrayTitle addObject:@"Scientific Baccalaureate degree (Bac)"];
    [_cursusArrayTitle addObject:@"Workshop about cinema at F.Daguin"];
    [_cursusArrayTitle addObject:@"Internship at the Bordeaux Airport"];

    //---------- Initialisation Cursus Array Date ----------
    _cursusArrayDate = [[NSMutableArray alloc]init];
    [_cursusArrayDate addObject:@"2014"];
    [_cursusArrayDate addObject:@"2013"];
    [_cursusArrayDate addObject:@"2013"];
    [_cursusArrayDate addObject:@"2012"];
    [_cursusArrayDate addObject:@"2012"];
    [_cursusArrayDate addObject:@"2011"];
    [_cursusArrayDate addObject:@"2010"];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 4;
    }
    else if (section == 1) {
        return 7;
    }
    else {
        return 1;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 240;
        }
        else if (indexPath.row == 1) {
            return 88;
        }
        else if (indexPath.row == 3) {
            return 180;
        }
        else {
            return 44;
        }
    }
    else {
        return 44;
    }

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    else {
        return UITableViewAutomaticDimension;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        UIView *timelineTitleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 30)];
        UILabel *timelineTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, timelineTitleView.frame.size.width, timelineTitleView.frame.size.height)];
        [timelineTitle setFont:[UIFont boldSystemFontOfSize:18]];
        timelineTitle.text = @"My career";
        timelineTitle.textColor = [UIColor lightGrayColor];
        timelineTitle.textAlignment = NSTextAlignmentCenter;
        
        [timelineTitleView addSubview:timelineTitle];
        return timelineTitleView;
    }
    else {
        return nil;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //---------- Cell Identifier ----------
    
    UITableViewCell *resumeCell = [tableView dequeueReusableCellWithIdentifier:@"resumeCell"];
    UITableViewCell *profileCell = [tableView dequeueReusableCellWithIdentifier:@"profileCell"];
    UITableViewCell *menuCell = [tableView dequeueReusableCellWithIdentifier:@"menuCell"];
    UITableViewCell *infoCell = [tableView dequeueReusableCellWithIdentifier:@"infoCell"];
    UITableViewCell *mainCell = [tableView dequeueReusableCellWithIdentifier:@"mailCell"];
    CursusTableViewCell *cursusCell = [tableView dequeueReusableCellWithIdentifier:@"cursusCell"];
    
    
    //---------- Icones Attributes ----------
    
    FAKFontAwesome *userIcon = [FAKFontAwesome userIconWithSize:30];
    [userIcon addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor]];
    UIImage *iconUser = [userIcon imageWithSize:CGSizeMake(30, 30)];
    
    FAKFontAwesome *houseIcon = [FAKFontAwesome homeIconWithSize:30];
    [houseIcon addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor]];
    UIImage *iconHouse = [houseIcon imageWithSize:CGSizeMake(30, 30)];
    
    FAKFontAwesome *webIcon = [FAKFontAwesome globeIconWithSize:30];
    [webIcon addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor]];
    UIImage *iconWeb = [webIcon imageWithSize:CGSizeMake(30, 30)];
    
    FAKFontAwesome *bookIcon = [FAKFontAwesome bookIconWithSize:30];
    [bookIcon addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor]];
    UIImage *iconBook = [bookIcon imageWithSize:CGSizeMake(30, 30)];
    
    FAKFontAwesome *mailIcon2 = [FAKFontAwesome envelopeOIconWithSize:30];
    [mailIcon2 addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor]];
    UIImage *iconMail2 = [mailIcon2 imageWithSize:CGSizeMake(30, 30)];
    
    FAKFontAwesome *phoneIcon2 = [FAKFontAwesome phoneIconWithSize:30];
    [phoneIcon2 addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor]];
    UIImage *iconPhone2 = [phoneIcon2 imageWithSize:CGSizeMake(30, 30)];
    
    FAKFontAwesome *mailIcon = [FAKFontAwesome envelopeOIconWithSize:30];
    [mailIcon addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor]];
    UIImage *iconMail = [mailIcon imageWithSize:CGSizeMake(30, 30)];
    
    FAKFontAwesome *phoneIcon = [FAKFontAwesome phoneIconWithSize:30];
    [phoneIcon addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor]];
    UIImage *iconPhone = [phoneIcon imageWithSize:CGSizeMake(30, 30)];
    
    FAKFontAwesome *facebookIcon = [FAKFontAwesome facebookIconWithSize:30];
    [facebookIcon addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor]];
    UIImage *iconFacebook = [facebookIcon imageWithSize:CGSizeMake(30, 30)];
    
    FAKFontAwesome *twitterIcon = [FAKFontAwesome twitterIconWithSize:30];
    [twitterIcon addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor]];
    UIImage *iconTwitter = [twitterIcon imageWithSize:CGSizeMake(30, 30)];
    
    //---------- Custom profile Cell ----------
    
    UILabel *studentProfileLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, profileCell.frame.size.height-60, profileCell.frame.size.width, 30)];
    studentProfileLabel.text = @"Ingesup Student, Bordeaux (France)";
    studentProfileLabel.textColor = [UIColor whiteColor];
    studentProfileLabel.font = [UIFont italicSystemFontOfSize:14];
    studentProfileLabel.textAlignment = NSTextAlignmentCenter;

    [profileCell addSubview:studentProfileLabel];
    
    //---------- Custom infos Cell ----------
    
    UIImageView *userView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 11, 10, 10)];
    userView.image = iconUser;
    [infoCell addSubview:userView];
    
    UIImageView *adressView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 33, 10, 10)];
    adressView.image = iconHouse;
    [infoCell addSubview:adressView];
    
    UIImageView *phoneView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 68, 10, 10)];
    phoneView.image = iconPhone2;
    [infoCell addSubview:phoneView];
    
    UIImageView *mailView = [[UIImageView alloc]initWithFrame:CGRectMake(140, 11, 10, 10)];
    mailView.image = iconMail2;
    [infoCell addSubview:mailView];
    
    UIImageView *websiteView = [[UIImageView alloc]initWithFrame:CGRectMake(140, 39, 10, 10)];
    websiteView.image = iconWeb;
    [infoCell addSubview:websiteView];
    
    UIImageView *schoolView = [[UIImageView alloc]initWithFrame:CGRectMake(140, 68, 10, 10)];
    schoolView.image = iconBook;
    [infoCell addSubview:schoolView];
    
    
    //---------- Custom resume Cell ----------
    
    UILabel *introTitle = [[UILabel alloc]init];
    introTitle.frame = CGRectMake(0, 0, resumeCell.frame.size.width, 30);
    introTitle.text = @"ABOUT ME";
    introTitle.textColor = [UIColor whiteColor];
    introTitle.textAlignment = NSTextAlignmentCenter;
    introTitle.font = [UIFont boldSystemFontOfSize:18];
    [resumeCell addSubview:introTitle];
    
    UITextView *introTextView = [[UITextView alloc]init];
    introTextView.frame = CGRectMake(0, 30, resumeCell.frame.size.width, resumeCell.frame.size.height-30);
    introTextView.text = @"I'm a young developer who lives in Bordeaux, France. I work on many projects for mobile, the web or devices called \"desktop\". I currently studying in school Ingesup Bordeaux and I'm looking for training contracts. Development is not just a job for me, it's a passion. I'm also passionated by apple. I love to develop iOS and OSX application to change daily and I recently got the Mac Integration 10.9 certification. I also practice the sport shooting at national level for 5 years.";
    introTextView.textColor = [UIColor whiteColor];
    introTextView.backgroundColor = [UIColor clearColor];
    introTextView.textAlignment = NSTextAlignmentCenter;
    introTextView.editable = NO;
    introTextView.scrollEnabled = NO;
    [resumeCell addSubview:introTextView];
    resumeCell.backgroundColor = [UIColor colorWithRed:0.39 green:0.69 blue:0.56 alpha:1];
    
    //---------- Custom menu cell ----------
    
    UIButton *mailButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 0, 44, 44)];
    [mailButton addTarget:self action:@selector(mailButton:) forControlEvents:UIControlEventTouchUpInside];
    [mailButton setImage:iconMail forState:UIControlStateNormal];
    [menuCell addSubview:mailButton];
    
    UIButton *callButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 0, 44, 44)];
    [callButton addTarget:self action:@selector(phoneButton:) forControlEvents:UIControlEventTouchUpInside];
    [callButton setImage:iconPhone forState:UIControlStateNormal];
    [menuCell addSubview:callButton];
    
    UIButton *facebookButton = [[UIButton alloc]initWithFrame:CGRectMake(180, 0, 44, 44)];
    [facebookButton addTarget:self action:@selector(facebookButton:) forControlEvents:UIControlEventTouchUpInside];
    [facebookButton setImage:iconFacebook forState:UIControlStateNormal];
    [menuCell addSubview:facebookButton];
    
    UIButton *twitterButton = [[UIButton alloc]initWithFrame:CGRectMake(260, 0, 44, 44)];
    [twitterButton addTarget:self action:@selector(twitterButton:) forControlEvents:UIControlEventTouchUpInside];
    [twitterButton setImage:iconTwitter forState:UIControlStateNormal];
    [menuCell addSubview:twitterButton];
    
    menuCell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menuTableProfile"]];

    //---------- Custom cursus cell ----------
    
    UIImageView *timelineView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    [cursusCell.logoDateView addSubview:timelineView];
    
    //---------- Custom main cell (resume) ----------
    
    mainCell.textLabel.text = @"Download my resume";
    mainCell.textLabel.textAlignment = NSTextAlignmentCenter;
    mainCell.textLabel.textColor = [UIColor whiteColor];
    mainCell.backgroundColor = [UIColor colorWithRed:0.39 green:0.69 blue:0.56 alpha:1];
    
    //---------- Cell configuration ----------
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return profileCell;
        }
        else if (indexPath.row == 1) {
            return infoCell;
        }
        else if (indexPath.row == 2) {
            return menuCell;
        }
        else if (indexPath.row == 3) {
            return resumeCell;
        }
        else {
            return profileCell;
        }
    }
    else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            timelineView.image = [UIImage imageNamed:@"timeline-first"];
            cursusCell.dateCursusLabel.text = [NSString stringWithFormat:@"%@",[_cursusArrayDate objectAtIndex:indexPath.row]];
            cursusCell.detailCursusLabel.text = [NSString stringWithFormat:@"%@",[_cursusArrayTitle objectAtIndex:indexPath.row]];
            
        }
        else if (indexPath.row == (_cursusArrayTitle.count-1)) {
            timelineView.image = [UIImage imageNamed:@"timeline-last"];
            cursusCell.dateCursusLabel.text = [NSString stringWithFormat:@"%@",[_cursusArrayDate objectAtIndex:indexPath.row]];
            cursusCell.detailCursusLabel.text = [NSString stringWithFormat:@"%@",[_cursusArrayTitle objectAtIndex:indexPath.row]];
        }
        else {
            timelineView.image = [UIImage imageNamed:@"timeline-normal"];
            cursusCell.dateCursusLabel.text = [NSString stringWithFormat:@"%@",[_cursusArrayDate objectAtIndex:indexPath.row]];
            cursusCell.detailCursusLabel.text = [NSString stringWithFormat:@"%@",[_cursusArrayTitle objectAtIndex:indexPath.row]];
        }
        return cursusCell;
    }
    else {
        return mainCell;
    }
    

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 2) {
        NSString *resumeURLString = @"http://quentinrubini.fr/fichiers/cv_quentin_rubini_en.pdf";
        NSURL *resumeURL = [NSURL URLWithString:resumeURLString];
        [[UIApplication sharedApplication] openURL:resumeURL];
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

#pragma mark - Navigation

-(IBAction)backHome:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dismiss:(UIGestureRecognizer*)gesture {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Buttons action

-(IBAction)mailButton:(id)sender {
    
    // Email Subject
    NSString *emailTitle = @"Contact for the WWDC 2014";
    // Email Content
    NSString *messageBody = @"Dear Quentin Rubini,\n\n We have great news for you ! You have been selected to get your ticket for the WWDC 2014 !";
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"quentin.rubini@icloud.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:nil];
    
}

-(IBAction)phoneButton:(id)sender {
    
    NSString *phoneNumber = @"+33663380298"; // dynamically assigned
    NSString *phoneURLString = [NSString stringWithFormat:@"tel:%@", phoneNumber];
    NSURL *phoneURL = [NSURL URLWithString:phoneURLString];
    [[UIApplication sharedApplication] openURL:phoneURL];
    
}

-(IBAction)facebookButton:(id)sender {
    
    NSString *facebookURLString = @"https://www.facebook.com/quentin.rubini";
    NSURL *phoneURL = [NSURL URLWithString:facebookURLString];
    [[UIApplication sharedApplication] openURL:phoneURL];
    
}

-(IBAction)twitterButton:(id)sender {
    
    NSString *twitterURLString = @"https://twitter.com/RubiniQuentin";
    NSURL *phoneURL = [NSURL URLWithString:twitterURLString];
    [[UIApplication sharedApplication] openURL:phoneURL];
    
}


#pragma mark - Mail Send

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}





@end
