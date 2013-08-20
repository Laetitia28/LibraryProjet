//
//  ConnexionViewController.m
//  Tutorial
//
//  Created by Projet on 13/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import "ConnectionViewController.h"


#import "Home2.h"

/* lead to up and down view */
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;



@interface ConnectionViewController ()

@end

@implementation ConnectionViewController


@synthesize login;
@synthesize  password;



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
        
    // Do any additional setup after loading the view from its nib.
    self.login.delegate = self;
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ConnectTo:(id)sender {
    
  
  //  NSString *log=self.login.text;
   
    
  
}
/*
 Get the rects of the text field being edited and the view that we're going to scroll.
 
 We convert everything to window coordinates
 */
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
   
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
/*
 
animation return to his inital position
 
 */

- (void)textFieldDidEndEditing:(UITextField *)textField
{
   
        CGRect viewFrame = self.view.frame;
        
        viewFrame.origin.y += animatedDistance;
        
        [UIView beginAnimations:nil context:NULL];
        
        [UIView setAnimationBeginsFromCurrentState:YES];
        
        [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
        
        [self.view setFrame:viewFrame];
        
        [UIView commitAnimations];
    
    
}

/*
 popViewControllerAnimated
 */
- (IBAction)cancel:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField{
    
    [textField resignFirstResponder];
    
    return YES;
}
/*
 Transition of login from ConnectionViewController to Acceuil2 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    id destination = segue.destinationViewController;
    
    if ([destination isKindOfClass:[Home2 class]]) {
    
    Home2 *destination = segue.destinationViewController;
    
    destination.login = self.login.text;
        
       
    }
}


@end
