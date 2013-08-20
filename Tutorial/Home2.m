//
//  Accueil2.m
//  Tutorial
//
//  Created by Projet on 14/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//
#import "Home2.h"
#import "Compte.h"
#import "ConnectionViewController.h"
#import "Reachability.h"

@interface Home2 ()

@end

@implementation Home2

@synthesize NameLogin, login;



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
    
    self.NameLogin.text = self.login;
    
        
    [super viewDidLoad];
    if ([[Reachability reachabilityWithHostName:@"google.com"] currentReachabilityStatus] == ReachableViaWiFi) {
        // Do something that requires wifi
    } else if ([[Reachability reachabilityWithHostName:@"google.com"] currentReachabilityStatus] == ReachableViaWWAN) {
        // Do something that doesnt require wifi
    } else if ([[Reachability reachabilityWithHostName:@"google.com"] currentReachabilityStatus] == NotReachable) {
        self.myAccount.enabled=FALSE;
        [self.myAccount setBackgroundImage:[UIImage imageNamed:@"gray2.png"] forState:UIControlStateNormal];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Network Unavailable"
                                                        message:@"App content may be limited without a network connection!"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    }

	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender

{
  
    id destination = segue.destinationViewController;
    
    
        if ([destination isKindOfClass:[Compte class]]) {
        
           
        
        ((Compte * )destination).loginReceive = self.login;
            NSLog(@"%@", ((Compte * )destination).loginReceive);
        
        
        
        }
        
    }
    


@end
