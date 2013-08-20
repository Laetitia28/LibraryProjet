//
//  XMLParserRequestLink.m
//  Library
//
//  Created by Projet on 29/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import "XMLParserRequestLink.h"

#import "InformationRequestLink.h"

@implementation XMLParserRequestLink

@synthesize informationsRequestsLink;

NSInteger  countLink =0;
NSInteger  numberLink = 0;

-(id) loadXMLtoURL:(NSString *)urlString{
    
    //initialisation
    
    informationsRequestsLink = [[NSMutableArray alloc] init];
    
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
    if ([elementname isEqualToString:@"digest"])
    {
      
        
        if(numberLink == 0){
            
            numberLink = [currentNodeContent intValue];
        }
        
        currentInformation = [[InformationRequestLink alloc] init];
        
        currentInformation.identifierBook=[attributeDict valueForKey:@"recordId"];
    }
 
}




- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementname isEqualToString:@"info"])
    {
        if(countLink==0){
            
            
            currentInformation.type = currentNodeContent;
            
            
            countLink = countLink+1;
            
        }
        else if(countLink==1){
            
            currentInformation.title = currentNodeContent;
            
            
            countLink = countLink+1;
            
        }
        else if(countLink==2){
            
            currentInformation.author = currentNodeContent;
            
            countLink = countLink+1;
            
        }
        else if(countLink==3){
            
            currentInformation.editor = currentNodeContent;
            
            countLink = 0;
        }
       
                 
        
    }
    
    
    
    if ([elementname isEqualToString:@"digest"])
    {
        
        [informationsRequestsLink addObject:currentInformation];
        
        currentInformation = nil;
        
    }
    currentNodeContent = nil;
}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
  
    if(!currentNodeContent){
        
        currentNodeContent =[NSMutableString string];
        
    }
    
    [currentNodeContent appendString:string];
}



@end
