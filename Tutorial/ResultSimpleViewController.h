//
//  ResultSimpleViewController.h
//  Tutorial
//
//  Created by Projet on 21/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ResultSimpleDetailViewController;

#import "InformationsRequest.h"

#import "Informations.h"

#import "XMLParser.h"

#import "XMLParserRequest.h"



#import "ResultSimpleDetailViewController.h"
#import "XMLParserRequestPublication.h"
#import "XMLParserRequestLink.h"

@interface ResultSimpleViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>


{
    

    IBOutlet UITableView *tableView;
    
    XMLParser *xmlParser;    
    XMLParserRequest *xmlParserRequest;
    XMLParserRequestLink *xmlParserRequestLink;
    XMLParserRequestPublication *xmlParserRequestPublication;
    

    
    
}

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property(nonatomic ,retain) ResultSimpleDetailViewController * resultSimpleDetailViewController;

@property (nonatomic , retain) XMLParser *xmlParser;
@property (nonatomic , retain) XMLParserRequest *xmlParserRequest;
@property (nonatomic , retain) XMLParserRequestPublication *xmlParserRequestPublication;
@property (nonatomic , retain) XMLParserRequestLink *xmlParserRequestLink;

@property(nonatomic ,strong) NSString *informationReceive;

@property(nonatomic ,retain) NSString *sourceNameSimpleReceive;

@property(nonatomic ,retain) NSString *indexSimpleReceive;

@property(nonatomic ,retain) NSString * apiSessionReturn;


-(NSString * )connectTo;

@end
