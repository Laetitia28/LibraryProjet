//
//  ResultSimpleDetailViewController.h
//  Tutorial
//
//  Created by Projet on 22/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XMLParserRequestLoans.h"

#import "InformationsRequestLoans.h"


@interface ResultSimpleDetailViewController : UIViewController <UISplitViewControllerDelegate>{

    XMLParserRequestLoans * xmlParserRequestLoan;



}

- (IBAction)BtnBuy:(id)sender;

@property (strong, nonatomic) IBOutlet UITextView *labeltitle;
@property (strong, nonatomic) IBOutlet UILabel *LabelSite;
@property (strong, nonatomic) IBOutlet UITextView *labelauthor;


@property (strong, nonatomic) IBOutlet UILabel *labeltype;
@property (strong, nonatomic) IBOutlet UILabel *labelCode;
@property (strong, nonatomic) IBOutlet UILabel *labeleditor;
@property (strong, nonatomic) IBOutlet UILabel *labelyear;
@property (strong, nonatomic) IBOutlet UILabel *labelStatut;

@property (nonatomic,retain)  NSString * labelTitleReceive;
@property (nonatomic,retain)  NSString * labelAuthorReceive;
@property (nonatomic,retain)  NSString * labelTypeReceive;
@property (nonatomic,retain)  NSString * labelEditorReceive;
@property (nonatomic,retain)  NSString * labelYearReceive;
@property (nonatomic,retain)  NSString * labelStatutReceive;
@property (nonatomic,retain)  NSString * labelCodeReceive;
@property (nonatomic,retain)  NSString * labelSiteReceive;

@property(nonatomic ,retain) NSString * apiSessionReceive;
@property(nonatomic ,retain) NSString * IdentifierBookReceive;

@property (strong, nonatomic) id detailItem;




 
@end
