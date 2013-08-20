//
//  XMLParserConnectionUser.m
//  Tutorial
//
//  Created by Projet on 24/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import "XMLParserConnectionUser.h"

@implementation XMLParserConnectionUser


@synthesize informationsRequestConnectionUser;

-(id) loadXMLtoURL:(NSString *)urlString{
    
    //initialisation
    
    informationsRequestConnectionUser = [[NSMutableArray alloc] init];
    
    NSURL * url = [NSURL URLWithString:urlString];
    
    NSString * dataString = [ NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding   error:NULL];
    
    NSData * data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    
    parser          = [[NSXMLParser alloc] initWithData:data];
    
    parser.delegate = self;
    
    [parser parse];
    
    return self;
    
    
}


- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementname isEqualToString:@"ICOMM_LAON"])
    {
        NSLog(@"user element found – create a new instance of User class...");
        
        currentInformation = [[InformationsConnectionUser alloc] init];
    }
    
    if([elementname isEqualToString:@"CATALOG_SYSTEM_ID"]){
        
        currentInformation.catalogId = [attributeDict valueForKey:@"display"];
    }
    
    if([elementname isEqualToString:@"DUE_DATE"]){
        
        currentInformation.catalogId = [attributeDict valueForKey:@"display"];
    }
    

}




- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
     
    
    if ([elementname isEqualToString:@"ICOMM_LOAN"])
    {
        
        [informationsRequestConnectionUser addObject:currentInformation];
        
        currentInformation = nil;
        
        
        currentNodeContent = nil;
    }
    currentNodeContent = nil;
}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if(!currentNodeContent){
        
        currentNodeContent =[NSMutableString string];        
        
    }
    else{
        
        [currentNodeContent appendString:string];
    }
}


@end
