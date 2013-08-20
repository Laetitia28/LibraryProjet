//
//  SearchAViewController.m
//  Tutorial
//
//  Created by Projet on 14/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import "SearchAViewController.h"
#import "AdvancedResearch.h"
#import "ResultAdvancedViewController.h"
#import "Reachability.h"

static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat PORTRAIT_KEYBOARD_HEIGHT = 216;



@interface SearchAViewController ()

@end

@implementation SearchAViewController

@synthesize tab1,tab2,label1,label2,label3,Field1,field2,et,ou,selectionsupportavancee;

@synthesize indexAdvancedBrute1,indexAdvancedBrute2,informationAdvancedBrute1,informationAdvancedBrute2,sourceNameAdvancedBrute,operatorAdvancedBrute;

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
    
    
    self.indexAdvancedBrute1=@"title";
    self.indexAdvancedBrute2=@"title";
    self.informationAdvancedBrute1=@"information";
    self.informationAdvancedBrute2=@"internationale";
    self.operatorAdvancedBrute=@"AND";
    self.sourceNameAdvancedBrute=@"Documents papiers";
    self.selectionsupportavancee.inputView =[[UIView alloc]initWithFrame:CGRectZero];
    
    [super viewDidLoad];
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
    // Dispose of any resources that can be recreated.
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == Field1 || textField == field2 ) {
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
    
   if (textField == Field1 || textField == field2 ) {
        
    CGRect viewFrame = self.view.frame;
    
    viewFrame.origin.y += animatedDistance;
    
    [UIView beginAnimations:nil context:NULL];
    
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    [self.view setFrame:viewFrame];
    
    [UIView commitAnimations];
}
}

- (IBAction)tabChanged1:(id)sender {
    
    
    if (tab1.selectedSegmentIndex == 0)
    {
        NSLog(@"Titre1");
        self.indexAdvancedBrute1= @"title";
        
        
        
    }
    if (tab1.selectedSegmentIndex == 1)
    {
        
        NSLog(@"Auteur1");
        self.indexAdvancedBrute1= @"author";
    }
    if (tab1.selectedSegmentIndex == 2)
    {
        NSLog(@"Sujet1");
        self.indexAdvancedBrute1= @"subject";
    }
}





- (IBAction)tabChanged2:(id)sender {
    
    if (tab2.selectedSegmentIndex == 0)
    {
        NSLog(@"Titre2");
        self.indexAdvancedBrute2= @"title";
        
    }
    if (tab2.selectedSegmentIndex == 1)
    {
        
        NSLog(@"Auteur2");
        self.indexAdvancedBrute2= @"author";
    }
    if (tab2.selectedSegmentIndex == 2)
    {
        NSLog(@"Sujet2");
        self.indexAdvancedBrute2= @"subject";
        
        
    }
}

- (IBAction)BtnEt:(id)sender {
    
    
    self.label2.text= @"AND" ;
    self.operatorAdvancedBrute=@"AND";
    
    
}

- (IBAction)BtnOu:(id)sender {
    
    
    self.label2.text=@"OR";
    self.operatorAdvancedBrute=@"OR";
    
    
    
    
}
- (IBAction)text1:(id)sender {
    label1.text = self.Field1.text;
    self.informationAdvancedBrute1=self.Field1.text;
   

    
}



- (IBAction)text2:(id)sender {
    label3.text = self.field2.text;
    self.informationAdvancedBrute2=self.field2.text;
 
    
}





-(BOOL)textFieldShouldReturn:(UITextField*)textField{
    [textField resignFirstResponder];
    
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender

{
    
    id destination = segue.destinationViewController;
    
    
    if ([destination isKindOfClass:[AdvancedResearch class]]) {
        
        ((AdvancedResearch *)destination).delegate = self; // mise a jour du delege de la classe SimpleResearch
    }
    if ([destination isKindOfClass:[ResultAdvancedViewController class]]) {
        
        ((ResultAdvancedViewController * )destination).informationReceive1 = self.informationAdvancedBrute1;
        ((ResultAdvancedViewController * )destination).informationReceive2 = self.informationAdvancedBrute2;
        ((ResultAdvancedViewController * )destination).sourceNameAdvancedReceive = self.sourceNameAdvancedBrute;
        ((ResultAdvancedViewController * )destination).operatorAdvanced = self.operatorAdvancedBrute;
        ((ResultAdvancedViewController * )destination).indexAdvancedReceive1 = self.indexAdvancedBrute1;
        ((ResultAdvancedViewController * )destination).indexAdvancedReceive2 = self.indexAdvancedBrute2;
    
    }
    
    
}

- (void)setLabelSupport:(NSString *)text
{
    self.selectionsupportavancee.text = text;
    self.sourceNameAdvancedBrute=self.selectionsupportavancee.text;
}


@end
