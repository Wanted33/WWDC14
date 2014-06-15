//
//  MyProjects.m
//  Quentin Rubini
//
//  Created by Quentin RUBINI on 08/04/2014.
//  Copyright (c) 2014 Quentin RUBINI. All rights reserved.
//

#import "MyProjects.h"
#import "Project.h"

@implementation MyProjects

- (id)init
{
    self = [super init];
    if (self) {
        
        //---------- Initalisation Array ----------
        _projects = [[NSMutableArray alloc]init];
        
        //---------- Initalisation Projects ----------
        
        //----------
        Project *filmotheque = [[Project alloc]init];
        filmotheque.titleText = @"Film'o Thèque";
        filmotheque.typeText = @"iOS App";
        filmotheque.descriptionText = @"Film'o Thèque is a mobile application for all those wishing to organize their DVD collection easily and ludique.Vous dreamed of taking on the role of a teller or cashier ? Can scan your products and get tons of information on them? Then this app is for you ... It allows you to enter in the role of a cashier but it will allow you to classify his films while having fun . Film'o Thèque is for all those wishing to organize their DVD collection (without of course forgetting the blu -ray) in a fun and effective. Indeed, this application allows you to scan barcodes of all your films present on their boxes to make a film library classified and ordered. You can come back as well on manually if the information obtained with the bar code are insufficient or if you prefer that all is personal . Finished redemptions movies double ended losses DVD, thanks to this application you will always have your list of movies in your pocket and you can view the movies you already have and those you lent so they'll be finally realized .";
        filmotheque.linkText = @"https://itunes.apple.com/fr/app/filmo-theque/id839561093?mt=8";
        filmotheque.bgImage = [UIImage imageNamed:@"filmo-app"];
        filmotheque.bgDetailImage = [UIImage imageNamed:@"filmo-app-detail"];
        
        [_projects addObject:filmotheque];
        
        //----------
        Project *apacheApp = [[Project alloc]init];
        apacheApp.titleText = @"Apachapps";
        apacheApp.typeText = @"OSX App";
        apacheApp.descriptionText = @"Apachapps is a little Mac app which allows to start, stop and restart your server apache present natively in OS X system.";
        apacheApp.linkText = @"https://github.com/Wanted33/Apachapps";
        apacheApp.bgImage = [UIImage imageNamed:@"apache-app"];
        apacheApp.bgDetailImage = [UIImage imageNamed:@"apache-app-detail"];
        
        [_projects addObject:apacheApp];
        
        //----------
        Project *rdvMedical = [[Project alloc]init];
        rdvMedical.titleText = @"Medical appointment";
        rdvMedical.typeText = @"Application";
        rdvMedical.descriptionText = @"I currently work on an application intended for the medical sector which allows the doctors to manage their appointments in a simple and intelligent way. This application would also allow the patients to make an appointment directly by internet and would allow the practitioners not to manage any more this boring spot. \"Medical appointment\" will be approachable via internet and through an native iOS and OSX applications.";
        rdvMedical.linkText = @"http://www.rdvmedical.com";
        rdvMedical.bgImage = [UIImage imageNamed:@"rdv-app"];
        rdvMedical.bgDetailImage = [UIImage imageNamed:@"rdv-app-detail"];
        
        [_projects addObject:rdvMedical];
        
        //----------
        Project *personalSite = [[Project alloc]init];
        personalSite.titleText = @"My personal website";
        personalSite.typeText = @"Website";
        personalSite.descriptionText = @"I have been creating my website to gain visibility on the web to expose all my projects and my skills.";
        personalSite.linkText = @"http://quentinrubini.fr";
        personalSite.bgImage = [UIImage imageNamed:@"personal-site"];
        personalSite.bgDetailImage = [UIImage imageNamed:@"personal-site-detail"];
        
        [_projects addObject:personalSite];
        
        
    }
    return self;
}

@end
