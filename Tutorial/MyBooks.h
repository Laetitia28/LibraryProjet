//
//  MyBooks.h
//  Tutorial
//
//  Created by Projet on 27/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLParser.h"
#import "XMLParserCompte.h"
#import "XMLParserCompteUser.h"


@interface MyBooks : UITableViewController <UITableViewDelegate>{
    
    XMLParser *xmlParser;
    XMLParserCompteUser * xmlParserCompteUser;
    
    
    NSString * userIdReceive;
}


@property(nonatomic,retain) NSString * userIdReceive;
@property(nonatomic,retain) NSString * apiSessionReturn;

-(NSString *)connectTo;

@end
