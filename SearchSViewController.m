//
//  SearchSViewController.m
//  Tutorial
//
//  Created by Projet on 14/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import "SearchSViewController.h"

#import "SimpleResearch.h"

#import "ResultSimpleViewController.h"

#import "Reachability.h"

static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;


@interface SearchSViewController ()

@end

@implementation SearchSViewController

@synthesize tabSimple,sourceNameSimpleBrut,indexSimpleBrut,informationSimple,information,selectionSupport;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    //initialisation des variables par default
    
    self.indexSimpleBrut= @"title";
    self.informationSimple = @"papa";
   //not display keyboard
    self.selectionSupport.inputView = [[UIView alloc]initWithFrame:CGRectZero];
    
    if ([[Reachability reachabilityWithHostName:@"google.com"] currentReachabilityStatus] == ReachableViaWiFi) {
        // Do something that requires wifi
    } else if ([[Reachability reachabilityWithHostName:@"google.com"] currentReachabilityStatus] == ReachableViaWWAN) {
        // Do something that doesnt require wifi
    } else if ([[Reachability reachabilityWithHostName:@"google.com"] currentReachabilityStatus] == NotReachable) {
        self.buttonGo.enabled=FALSE;
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
   
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == information) {
        CGRect textFieldRect =[self.view.window convertRect:textField.bounds fromView:textField];
        
        CGRect viewRect =[self.view.window convertRect:self.view.bounds fromView:self.view];
        
        CGFloat midline = textFieldRect.origin.y + 0.5 * textFieldRect.size.height;
        
        CGFloat numerator =midline - viewRect.origin.y- MINIMUM_SCROLL_FRACTION * viewRect.size.height;
        
        CGFloat denominator =(MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION)* viewRect.size.height;
        
        CGFloat heightFraction = numerator / denominator;
        
        if (heightFraction < 0.0)
        {
            heightFraction = 0.0;
        }
        else if (heightFraction > 1.0)
        {
            heightFraction = 1.0;
        }
        animatedDistance = floor(PORTRAIT_KEYBOARD_HEIGHT * heightFraction);
        
        CGRect viewFrame = self.view.frame;
        
        viewFrame.origin.y -= animatedDistance;
        
        [UIView beginAnimations:nil context:NULL];
        
        [UIView setAnimationBeginsFromCurrentState:YES];
        
        [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
        
        [self.view setFrame:viewFrame];
        
        [UIView commitAnimations];
    }
    
   
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if(textField == information){
        CGRect viewFrame = self.view.frame;
        
        viewFrame.origin.y += animatedDistance;
        
        [UIView beginAnimations:nil context:NULL];
        
        [UIView setAnimationBeginsFromCurrentState:YES];
        
        [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
        
        [self.view setFrame:viewFrame];
        
        [UIView commitAnimations];
    }
   
}

- (IBAction)tabChangedSimple:(id)sender {
    
    if (tabSimple.selectedSegmentIndex == 0)
    {
        
        self.indexSimpleBrut =@"title";
       // NSLog(@"%@",self.indexSimple);
        
        
    }
    if (tabSimple.selectedSegmentIndex == 1)
    {
        
        self.indexSimpleBrut = @"author";
 
    }
    if (tabSimple.selectedSegmentIndex == 2)
    {
    
        self.indexSimpleBrut =@"subject";

    }

    
    
}

- (IBAction)addButon:(id)sender {
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField{
    
    
    [textField resignFirstResponder];
    self.informationSimple = self.information.text;

    return YES;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 
 {
     
     id destination = segue.destinationViewController;
     
     if ([destination isKindOfClass:[SimpleResearch class]]) {
         
         ((SimpleResearch *)destination).delegate = self; // mise a jour du delege de la classe SimpleResearch
     }
     
      if ([destination isKindOfClass:[ResultSimpleViewController class]]) {
   
     
     ((ResultSimpleViewController * )destination).informationReceive = self.informationSimple;
     ((ResultSimpleViewController * )destination).sourceNameSimpleReceive = self.sourceNameSimpleBrut;
     ((ResultSimpleViewController * )destination).indexSimpleReceive = self.indexSimpleBrut;
      }
  
 }

- (void)setLabelSupport:(NSString *)text
{
    self.selectionSupport.text = text;
    self.sourceNameSimpleBrut=self.selectionSupport.text;

}

@end
