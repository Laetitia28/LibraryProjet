//
//  BuyAdvancedViewController.m
//  Library
//
//  Created by Projet on 31/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import "BuyAdvancedViewController.h"

@interface BuyAdvancedViewController ()

@end

@implementation BuyAdvancedViewController

@synthesize titleToBuy,labelNoSelection;

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
    
    self.webView.delegate=self;
    
    //Alert Window
    UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Choose a store " message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Fnac",@"Amazon",@"Gilbert Jeune", nil];
    [alert show];
    
    //Encoding URL
    NSString *originalString = [NSString stringWithCString:[titleToBuy UTF8String] encoding:NSUTF8StringEncoding];
    CFStringRef encodedString = CFURLCreateStringByAddingPercentEscapes(
                                                                        kCFAllocatorDefault,
                                                                        (__bridge CFStringRef)(originalString),
                                                                        NULL,
                                                                        CFSTR(":/?#[]@!$&'()*+,;="),
                                                                        kCFStringEncodingUTF8);
    titleToBuy = (__bridge NSString *)(encodedString);
    
    NSLog(@"title to Buy%@",titleToBuy);

}

//Action associate with each button of alert window
-(void)alertView:( UIAlertView*) alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        
        
        
        
        
        NSString *urlStringfnac = [NSString stringWithFormat:@"%@%@%@",@"http://recherche.fnac.com/Search/SearchResult.aspx?SCat=2%211&Search=",titleToBuy,@"&sft=1&submitbtn=OK"];
        NSLog(@"%@",urlStringfnac);
        
        NSURL * url=[NSURL URLWithString:urlStringfnac];
        
        NSLog(@"%@",url);
        
        NSURLRequest * requestURL = [NSURLRequest requestWithURL:url];
        
        [self.webView loadRequest:requestURL];
        
       
        
    }
    else if(buttonIndex == 2) {
        
      //  titleToBuy = [titleToBuy stringByReplacingOccurrencesOfString:@" " withString:@"+"];
        NSString *urlStringAmazon = [NSString stringWithFormat:@"%@%@%@%@",@"http://www.amazon.fr/s/ref=nb_sb_noss?__mk_fr_FR=%C3%85M%C3%85Z%C3%95%C3%91&url=search-alias%3Dstripbooks&field-keywords=",titleToBuy,@"&rh=n%3A301061%2Ck%3A",titleToBuy];
        NSLog(@"%@",urlStringAmazon);
       
        NSURL * url=[NSURL URLWithString:urlStringAmazon];
        
        NSLog(@"%@",url);
        
        NSURLRequest * requestURL = [NSURLRequest requestWithURL:url];
        
        [self.webView loadRequest:requestURL];
        
        
        
    }
    else if(buttonIndex == 3) {
        
        
        NSString *urlStringGibert = [NSString stringWithFormat:@"%@%@%@",@"http://librairie-en-ligne.gibertjeune.fr/GIBERTJ/fr/search/Default.aspx?cleanparam=&titre=&ne=&n=0&auteur=&peopleId=&quicksearch=",titleToBuy,@"&editeur=&reference=&plng=&optSearch=ALL&beginDate=&endDate=&mot_cle=&prix=&themeId=&collection=&subquicksearch=&page=1"];
        NSLog(@"%@",urlStringGibert);
       
        NSURL * url=[NSURL URLWithString:urlStringGibert];
        
        NSURLRequest * requestURL = [NSURLRequest requestWithURL:url];
       
        NSLog(@"%@",url);
        
        [self.webView loadRequest:requestURL];
        
        
    }
    else{
        
        NSLog(@"Cancel");
        
        self.labelNoSelection.text=@"No Selection!Get Back";
        
        
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
