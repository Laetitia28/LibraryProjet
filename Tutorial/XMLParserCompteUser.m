//
//  XMLParserCompteUser.m
//  Tutorial
//
//  Created by Projet on 27/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import "XMLParserCompteUser.h"
#import "InformationsCompteUsers.h"


@implementation XMLParserCompteUser

@synthesize informationsCompteUsers;



-(id) loadXMLtoURL:(NSString *)urlString{
    
    //initialisation
    
    informationsCompteUsers = [[NSMutableArray alloc] init];
    
    NSURL * url = [NSURL URLWithString:urlString];
    
    
    NSString * dataString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:NULL];
    
    NSData *dataStringSuite =[dataString dataUsingEncoding:NSUTF8StringEncoding];
    
    parser = [[NSXMLParser alloc] initWithData:dataStringSuite];
    
    
    parser.delegate = self;
    
    
    
    [parser parse];
    
    return self;
}

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementname isEqualToString:@"ICOMM_LOAN"])
    {
        
        NSLog(@"user element found – create a new instance of User class...");
        
        
        currentInformation = [[InformationsCompteUsers alloc] init];
        
        
        
        
    }
    
    if ([elementname isEqualToString:@"CATALOG_SYSTEM_ID"])
    {
        
        currentInformation.catalogSystemId= [attributeDict valueForKey:@"display"];
     
    }
    if ([elementname isEqualToString:@"DUE_DATE"])
    {
        
        currentInformation.dueDate= [attributeDict valueForKey:@"display"];
      
    }
}




- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    

    
    if ([elementname isEqualToString:@"ICOMM_LOAN"])
    {
        
        
        
        [informationsCompteUsers addObject:currentInformation];
        
        currentInformation = nil;
        
        
        currentNodeContent = nil;
    }
    currentNodeContent=nil;
}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if(!currentNodeContent){
        currentNodeContent =[NSMutableString string];
        
       
        
    }
    
    [currentNodeContent appendString:string];

}






@end
