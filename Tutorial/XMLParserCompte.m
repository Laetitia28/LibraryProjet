//
//  XMLParserCompte.m
//  Tutorial
//
//  Created by Projet on 27/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import "XMLParserCompte.h"

#import "InformationsUser.h" 

@implementation XMLParserCompte

@synthesize informationsUser;

//Methode
-(id) loadXMLtoURL:(NSString *)urlString{
    
    //initialisation
    
    informationsUser = [[NSMutableArray alloc] init];
    
    NSURL * url = [NSURL URLWithString:urlString];
    
    NSData * data = [[NSData alloc] initWithContentsOfURL:url];
    
    parser          = [[NSXMLParser alloc] initWithData:data];
    
    parser.delegate = self;
    
    [parser parse];
    
    return self;
    
    
}


- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementname isEqualToString:@"UTILISATEUR"])
    {
        NSLog(@"user element found – create a new instance of User class...");
       
        currentInformation = [[InformationsUser alloc] init];
        
        
    }
    if ([elementname isEqualToString:@"BIBLIOTHEQUE"])
    {
        
        currentInformation.library = [attributeDict valueForKey:@"display"];
        
    }
    if ([elementname isEqualToString:@"DATE_INSCRIPTION"])
    {
        currentInformation.dateInscription = [attributeDict valueForKey:@"display"];    }
    
    if ([elementname isEqualToString:@"DATE_SUSPENSION"])
    {
        currentInformation.dateSuspension = [attributeDict valueForKey:@"display"];
    }
    
    if ([elementname isEqualToString:@"DATE_NAISSANCE"])
    {
        currentInformation.dateBirth = [attributeDict valueForKey:@"display"];
    }


}




- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementname namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
  
    if([elementname isEqualToString:@"NOM"]){
        
        currentInformation.name = currentNodeContent;
        //NSLog(@"nom %@",currentNodeContent);
    }
    
    if ([elementname isEqualToString:@"NUMERO_CARTE"])
    {
        currentInformation.card = currentNodeContent;
        
    }
    if ([elementname isEqualToString:@"EMAIL"])
    {
        currentInformation.email = currentNodeContent;
    }
    if ([elementname isEqualToString:@"PRENOM"])
    {
        currentInformation.firstName = currentNodeContent;
    }


    if ([elementname isEqualToString:@"UTILISATEUR"])
    {
        [informationsUser addObject:currentInformation];
        
        
        
        currentInformation = nil;
        
        
        
        currentNodeContent = nil;
    }
    
    
    currentNodeContent=nil;
    
    
    
    
}




- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if(!currentNodeContent){
        currentNodeContent =[NSMutableString string];
        
        //NSLog(@"boucle,,,,,,,,,,,,,,,,,,,,,,,,");
        
    }
    
    [currentNodeContent appendString:string];

}



@end
