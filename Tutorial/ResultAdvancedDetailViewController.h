//
//  ResultAdvancedDetailViewController.h
//  Tutorial
//
//  Created by Projet on 24/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "InformationsRequestLoans.h"

#import "XMLParserRequestLoans.h"

@interface ResultAdvancedDetailViewController : UIViewController<UISplitViewControllerDelegate>{

    XMLParserRequestLoans * xmlParserRequestLoans;


}




@property (strong, nonatomic) IBOutlet UILabel *labelSite;
@property (strong, nonatomic) IBOutlet UITextView *labelTitleAdvanced;

@property (strong, nonatomic) IBOutlet UITextView *labelAuthorAdvanced;


@property (strong, nonatomic) IBOutlet UILabel *labelTypeAdvanced;

@property (strong, nonatomic) IBOutlet UILabel *labelEditorAdvanced;

@property (strong, nonatomic) IBOutlet UILabel *labelYearAdvanced;

@property (strong, nonatomic) IBOutlet UILabel *labelStatutAdvanced;

@property (strong, nonatomic) IBOutlet UILabel *labelCodeBarreAdvanced;







@property (nonatomic,retain)  NSString * labelTitleReceiveAdvanced;
@property (nonatomic,retain)  NSString * labelAuthorReceiveAdvanced;
@property (nonatomic,retain)  NSString * labelTypeReceiveAdvanced;
@property (nonatomic,retain)  NSString * labelEditorReceiveAdvanced;
@property (nonatomic,retain)  NSString * labelYearReceiveAdvanced;
@property (nonatomic,retain)  NSString * apiSessionReceive;
@property (nonatomic,retain)  NSString * identiferBookReceive;
@property (nonatomic,retain)  NSString * labelSiteReceive;

@property (strong, nonatomic) id detailItem;

@end
