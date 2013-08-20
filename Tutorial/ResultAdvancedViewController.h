//
//  ResultAdvancedViewController.h
//  Tutorial
//
//  Created by Projet on 23/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "InformationsRequest.h"

#import "Informations.h"

#import "XMLParser.h"

#import "XMLParserRequest.h"

#import "XMLParserRequestLink.h"

#import "InformationRequestLink.h"

#import "XMLParserRequestPublication.h"

@interface ResultAdvancedViewController : UITableViewController{
    
    
  
    
    XMLParser *xmlParser;
    
    XMLParserRequest *xmlParserRequest;

    XMLParserRequestLink * xmlParserRequestLink;
  
    XMLParserRequestPublication *xmlParserRequestPublication;
    
    NSString * sourceNameEnter;
    
}

@property (nonatomic , retain) XMLParser *xmlParser;
@property (nonatomic , retain) XMLParserRequest *xmlParserRequest;
@property (nonatomic , retain) XMLParserRequestLink * xmlParserRequestLink;
@property (nonatomic , retain) XMLParserRequestPublication *xmlParserRequestPublication;


@property(nonatomic ,strong) NSString *informationReceive1;
@property(nonatomic ,strong) NSString *informationReceive2;

@property(nonatomic ,retain) NSString *sourceNameAdvancedReceive;
@property(nonatomic,retain)  NSString  *operatorAdvanced;


@property(nonatomic ,retain) NSString *indexAdvancedReceive1;
@property(nonatomic ,retain) NSString *indexAdvancedReceive2;


@property(nonatomic ,retain) NSString * apiSessionReturn;
@property(nonatomic ,retain) NSString * sourceNameEnter;


-(NSString * )connectTo;

@end
