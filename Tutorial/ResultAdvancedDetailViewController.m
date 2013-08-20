//
//  ResultAdvancedDetailViewController.m
//  Tutorial
//
//  Created by Projet on 24/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import "ResultAdvancedDetailViewController.h"

#import "BuyAdvancedViewController.h"

@interface ResultAdvancedDetailViewController ()

@end

@implementation ResultAdvancedDetailViewController

@synthesize labelTitleReceiveAdvanced,labelSite;

@synthesize apiSessionReceive,identiferBookReceive;


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
    /*
     Display of informations received
     */
    self.labelTitleAdvanced.text=self.labelTitleReceiveAdvanced;
    self.labelAuthorAdvanced.text=self.labelAuthorReceiveAdvanced;
    self.labelTypeAdvanced.text=self.labelTypeReceiveAdvanced;
    self.labelEditorAdvanced.text=self.labelEditorReceiveAdvanced;
    self.labelYearAdvanced.text=self.labelYearReceiveAdvanced;

    
    self.labelTitleAdvanced.editable=NO;
    self.labelAuthorAdvanced.editable=NO;
    

	// Do any additional setup after loading the view.
    /*
     Launch request for listing the book's description
     */
    NSString * beginUrlId = @"http://www.scd.uha.fr/*********/XAPI?l&method=communication.getItems&catalogId=";
    
    NSString *totalUrlID = [NSString stringWithFormat:@"%@%@%@%@",beginUrlId,self.identiferBookReceive,@"&apiSession=",self.apiSessionReceive];
    
    NSLog(@"%@",totalUrlID);
    
    xmlParserRequestLoans = [[XMLParserRequestLoans alloc] loadXMLtoURL:totalUrlID];
    
    
    for(int i = 0; i < [[xmlParserRequestLoans informationsRequestLoans] count]; i++) {
    
    
        NSLog(@"status: %@", [(InformationsRequestLoans *)[[xmlParserRequestLoans informationsRequestLoans] objectAtIndex:i] statusLaon]);
        self.labelStatutAdvanced.text= [(InformationsRequestLoans *)[[xmlParserRequestLoans informationsRequestLoans] objectAtIndex:i] statusLaon];
            
        NSLog(@"code: %@", [(InformationsRequestLoans *)[[xmlParserRequestLoans informationsRequestLoans] objectAtIndex:i] codeBarre]);
        self.labelCodeBarreAdvanced.text=[(InformationsRequestLoans *)[[xmlParserRequestLoans informationsRequestLoans] objectAtIndex:i] codeBarre];
            
            
        NSLog(@"site: %@", [(InformationsRequestLoans *)[[xmlParserRequestLoans informationsRequestLoans] objectAtIndex:i] site]);
            self.labelSite.text=[(InformationsRequestLoans *)[[xmlParserRequestLoans informationsRequestLoans] objectAtIndex:i] site];
        
    }
    
}

/*
 Transition the title of books witch are selected
 */

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    id destination = segue.destinationViewController;
    
    if ([destination isKindOfClass:[BuyAdvancedViewController class]]) {
        
        
        
        BuyAdvancedViewController *destination = segue.destinationViewController;
        
        destination.titleToBuy = self.labelTitleReceiveAdvanced;
        
        NSLog(@"The book is:%@",destination.titleToBuy);
        
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
