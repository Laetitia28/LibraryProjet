//
//  ResultSimpleDetailViewController.m
//  Tutorial
//
//  Created by Projet on 22/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import "ResultSimpleDetailViewController.h"
#import "ResultSimpleViewController.h"

#import "Informations.h"

#import "XMLParser.h"

#import "XMLParserRequest.h"

#import "XMLParserRequestLoans.h"

#import "InformationsRequestLoans.h"

#import "BuySimpleViewController.h"

@interface ResultSimpleDetailViewController ()


@end

@implementation ResultSimpleDetailViewController 


@synthesize labelauthor,labeleditor,labeltype,labelyear,labelStatut,labelCode,LabelSite,labeltitle;

@synthesize labelAuthorReceive,labelEditorReceive,labelTypeReceive,labelYearReceive,labelStatutReceive,labelCodeReceive,labelSiteReceive,labelTitleReceive;

@synthesize apiSessionReceive,IdentifierBookReceive;

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
     Display the informations 
     */
    self.labeltitle.text = self.labelTitleReceive;
    self.labelauthor.text = self.labelAuthorReceive;
    self.labeltype.text = self.labelTypeReceive;
    self.labeleditor.text = self.labelEditorReceive;
    self.labelyear.text = self.labelYearReceive;

    self.labeltitle.editable=NO;
    self.labelauthor.editable=NO;
    
     NSString * beginUrlId = @"http://www.scd.uha.fr/*********/XAPI?l&method=communication.getItems&catalogId=";
     
     NSString *totalUrlID = [NSString stringWithFormat:@"%@%@%@%@",beginUrlId,IdentifierBookReceive,@"&apiSession=",self.apiSessionReceive];
     
     
     xmlParserRequestLoan = [[XMLParserRequestLoans alloc] loadXMLtoURL:totalUrlID];
     
     
     for(int i = 0; i < [[xmlParserRequestLoan informationsRequestLoans] count]; i++) {
     
     
             NSLog(@"status: %@", [(InformationsRequestLoans *)[[xmlParserRequestLoan informationsRequestLoans] objectAtIndex:i] statusLaon]);
             
             self.labelStatut.text = [(InformationsRequestLoans *)[[xmlParserRequestLoan informationsRequestLoans] objectAtIndex:i] statusLaon];
             
             
             NSLog(@"code: %@", [(InformationsRequestLoans *)[[xmlParserRequestLoan informationsRequestLoans] objectAtIndex:i] codeBarre]);
             
             self.labelCode.text =  [(InformationsRequestLoans *)[[xmlParserRequestLoan informationsRequestLoans] objectAtIndex:i] codeBarre];
             
             
             
             
             
             NSLog(@"code: %@", [(InformationsRequestLoans *)[[xmlParserRequestLoan informationsRequestLoans] objectAtIndex:i] site]);
             self.LabelSite.text =  [(InformationsRequestLoans *)[[xmlParserRequestLoan informationsRequestLoans] objectAtIndex:i] site];
     }
    
    

    
     
	// Do any additional setup after loading the view.
}

 
-(void)viewWillAppear:(BOOL)animated{
   
    [super viewWillAppear:animated];


}


-(void)viewDidUnload{
        [super viewDidUnload];

}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    id destination = segue.destinationViewController;
    
    if ([destination isKindOfClass:[BuySimpleViewController class]]) {
        
        
        
        BuySimpleViewController *destination = segue.destinationViewController;
        
        destination.titleToBuy = self.labelTitleReceive;
        
        NSLog(@"The book is:%@",destination.titleToBuy);
        
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
