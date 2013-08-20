//
//  ResultSimpleViewController.m
//  Tutorial
//
//  Created by Projet on 21/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import "ResultSimpleViewController.h"

#import "XMLParser.h"

#import "Informations.h"

#import "InformationsRequest.h"

#import "XMLParserRequest.h"

#import "ResultSimpleDetailViewController.h"

#import "XMLParserRequestPublication.h"


@interface ResultSimpleViewController ()


@end

@implementation ResultSimpleViewController

@synthesize indexSimpleReceive,informationReceive,sourceNameSimpleReceive,apiSessionReturn;
@synthesize xmlParserRequestLink,xmlParserRequestPublication,xmlParser,xmlParserRequest;

NSString *sourceNameEnter = @"default";
NSString *sourceNameBegin = @"&sourceName=";



NSString *tableNameEnter = @"UNIMARC";
NSString *tableNameBegin = @"&tableName=";


NSString * indexEnter =  @"UNIMARC28";

NSString * identifierBookId;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
         
    }
    return self;
}



-(NSString * )connectTo{

    xmlParser = [[XMLParser alloc] loadXMLtoURL:@"http://www.scd.uha.fr/*********/XAPI?&method=login&code=api_scd&password=api_scd"];
    
    for(int i = 0; i < [[xmlParser informations] count]; i++) {
        
        NSLog(@"Session: %@", [(Informations *)[[xmlParser informations] objectAtIndex:i] apiSession]);
        NSLog(@"Timeout: %@", [(Informations *)[[xmlParser informations] objectAtIndex:i] timeout]);
    }
    
         
    return self.apiSessionReturn = [(Informations *)[[xmlParser informations] objectAtIndex:0] apiSession];


}

- (void)viewDidLoad
{
    //Title 
    self.title = @"SimpleRequest";
    
    //Return apiSessionNumber
    apiSessionReturn = [self connectTo];
    
    
    if ([self.sourceNameSimpleReceive isEqual: @"Documents papiers"]){
        
        sourceNameEnter = @"default";
        NSLog(@"%@",sourceNameEnter);
        tableNameEnter = @"UNIMARC";
        NSLog(@"%@",tableNameEnter);
        
        if([self.indexSimpleReceive isEqual: @"title"]){
            indexEnter = @"UNIMARC28";
            NSLog(@"%@",indexEnter);
            
            
        }
        else if([self.indexSimpleReceive isEqual: @"author"]){
            
            
            indexEnter = @"UNIMARC18";
        }
        else if([self.indexSimpleReceive isEqual: @"subject"]){
            
            
            indexEnter = @"DLIV_BASIC";
        }

        
    }
   else if ([self.sourceNameSimpleReceive isEqual: @"Thèses numériques"]){
        
        sourceNameEnter = @"defaultfortmelectro";
        NSLog(@"%@",sourceNameEnter);
        tableNameEnter = @"TM_ELECTRO";
        NSLog(@"%@",tableNameEnter);
        
        if([self.indexSimpleReceive isEqual: @"title"]){
            indexEnter = @"TITLE";
            NSLog(@"%@",indexEnter);
            
            
        }
       else if([self.indexSimpleReceive isEqual: @"author"]){
            indexEnter = @"CREATORS";
            NSLog(@"%@",indexEnter);
            
            
        }

        else if([self.indexSimpleReceive isEqual: @"subject"]){
            
            
            indexEnter = @"DTM_ELECTRO_BASIC";
        }

        
    }
   

   else if ([self.sourceNameSimpleReceive isEqual: @"Liens web"]){
       
       sourceNameEnter = @"defaultforsignet";
       NSLog(@"%@",sourceNameEnter);
       tableNameEnter = @"SIGNET";
       NSLog(@"%@",tableNameEnter);
       
       if([self.indexSimpleReceive isEqual: @"title"]){
           indexEnter = @"TITRE";
           NSLog(@"%@",indexEnter);
           
       }
       if([self.indexSimpleReceive isEqual: @"subject"]){
           indexEnter = @"DSIGNET_MOTS";
           NSLog(@"%@",indexEnter);
           
       }
              
   }
   else if ([self.sourceNameSimpleReceive isEqual: @""]){
       
       sourceNameEnter = @"default";
       NSLog(@"%@",sourceNameEnter);
       tableNameEnter = @"UNIMARC";
       NSLog(@"%@",tableNameEnter);
       
       if([self.indexSimpleReceive isEqual: @"title"]){
           indexEnter = @"UNIMARC28";
           NSLog(@"%@",indexEnter);
           
       }
       else if([self.indexSimpleReceive isEqual: @"author"]){
           
           
           indexEnter = @"UNIMARC18";
       }
       else if([self.indexSimpleReceive isEqual: @"subject"]){
           
           
           indexEnter = @"DLIV_BASIC";
       }

   }
   else if ([self.sourceNameSimpleReceive isEqual: @"Livres numériques"]){
       
       sourceNameEnter = @"defaultforlivel";
       NSLog(@"%@",sourceNameEnter);
       tableNameEnter = @"LIVRE_ELECTRO";
       NSLog(@"%@",tableNameEnter);
       
       if([self.indexSimpleReceive isEqual: @"title"]){
           indexEnter = @"TITRE";
           NSLog(@"%@",indexEnter);
           
       }
       else if([self.indexSimpleReceive isEqual: @"author"]){
           
           
           indexEnter = @"AUTEUR";
       }
       else if([self.indexSimpleReceive isEqual: @"subject"]){
           
           
           indexEnter = @"DLIVRE_ELE_BASIC";
       }

   }
    
   else if([self.sourceNameSimpleReceive isEqual: @"Publications UHA"])
    {
       
       sourceNameEnter = @"publi_uha";
       NSLog(@"%@",sourceNameEnter);
       tableNameEnter = @"PUBLICATION";
       NSLog(@"%@",tableNameEnter);
       
        
       if([self.indexSimpleReceive isEqual: @"title"]){
           indexEnter = @"FIELD1";
           NSLog(@"%@",indexEnter);
           
       }
       else if([self.indexSimpleReceive isEqual: @"author"]){
           
           
           indexEnter = @"FIELD2";
       }
       else if([self.indexSimpleReceive isEqual: @"subject"]){
           
           
           indexEnter = @"PUBLICATION_ALL";
       }

   }
   else if ([self.sourceNameSimpleReceive isEqual: @"Thèses/Mémoires"]){
       
       sourceNameEnter = @"defaultformemoirepapier";
       NSLog(@"%@",sourceNameEnter);
       tableNameEnter = @"MEMOIRE_PAPIER";
       NSLog(@"%@",tableNameEnter);
       
       if([self.indexSimpleReceive isEqual: @"title"]){
           indexEnter = @"TITLE";
           NSLog(@"%@",indexEnter);
           
           
       }
       else if([self.indexSimpleReceive isEqual: @"author"]){
           
           
           indexEnter = @"CREATORS";
       }
       else if([self.indexSimpleReceive isEqual: @"subject"]){
           
           
           indexEnter = @"DMEM_PAPIER_BASIC";
       }
       
       
   }



    NSLog(@"Receive");
    
    NSLog(@"%@",self.informationReceive);
    NSLog(@"%@",self.indexSimpleReceive);
    NSLog(@"%@",self.sourceNameSimpleReceive);
            
    
    //Request
   
    NSString *sourceNameTotal = [NSString stringWithFormat:@"%@%@", sourceNameBegin, sourceNameEnter];
    

    NSString *tableNameTotal = [NSString stringWithFormat:@"%@%@", tableNameBegin, tableNameEnter];

    
    NSString * beginURL = @"http://www.scd.uha.fr/*********/XAPI?&method=publicaccess.query";

    NSString * bodyURLIndex =  @"&query=%5B";
    NSString * bodyURLLike =  @"%7Clike%7C";
    NSString * bodyURLApiSession =  @"%5D&apiSession=";
    NSString * bodyURLQueryConcaten;
    
    // URL Encoding
    NSString *originalString = [NSString stringWithCString:[informationReceive UTF8String] encoding:NSUTF8StringEncoding];
    CFStringRef encodedString = CFURLCreateStringByAddingPercentEscapes(
                                                                        kCFAllocatorDefault,
                                                                        (__bridge CFStringRef)(originalString),
                                                                        NULL,
                                                                        CFSTR(":/?#[]@!$&'()*+,;="),
                                                                        kCFStringEncodingUTF8);
    informationReceive = (__bridge NSString *)(encodedString);
    
    
    if (![indexSimpleReceive isEqual: @"subject"]) {
        
      
        if([sourceNameEnter isEqual: @"default"])
        {
            bodyURLQueryConcaten = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@", bodyURLIndex ,indexEnter , bodyURLLike,@"%25",informationReceive,@"%25",@"%5D%5BNOT%7CUNIMARC8%7Clike%7C22",bodyURLApiSession,apiSessionReturn];
        }
        else
        {
             bodyURLQueryConcaten = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@", bodyURLIndex ,indexEnter , bodyURLLike,@"%25",informationReceive,@"%25",bodyURLApiSession,apiSessionReturn];
        }
        

    }
    else{
        if([sourceNameEnter isEqual: @"default"])
        {
            bodyURLQueryConcaten = [NSString stringWithFormat:@"%@%@%@%@%@%@%@", bodyURLIndex ,indexEnter , bodyURLLike,informationReceive,@"%5D%5BNOT%7CUNIMARC8%7Clike%7C22",bodyURLApiSession,apiSessionReturn];
        }
        else
        {
        bodyURLQueryConcaten = [NSString stringWithFormat:@"%@%@%@%@%@%@", bodyURLIndex ,indexEnter , bodyURLLike,informationReceive,bodyURLApiSession,apiSessionReturn];
        }
        
    }
    
    
    NSString *totalUrl = [NSString stringWithFormat:@"%@%@%@%@", beginURL, sourceNameTotal,tableNameTotal,bodyURLQueryConcaten];
    
    
    
    NSLog(@"total URL %@",totalUrl);
    if([sourceNameEnter isEqual: @"defaultforsignet"]){
        
      
        
        xmlParserRequestLink = [[XMLParserRequestLink alloc] loadXMLtoURL:totalUrl];
        if(([[self.xmlParserRequestLink informationsRequestsLink] count]==0)){
            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Result" message:@"Not Found" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            
        }else{
            NSString * resultFound=[NSString stringWithFormat:@"Found: %d",[[xmlParserRequestLink informationsRequestsLink] count]];
            
            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Result" message:resultFound delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            
        }

        
        for(int i = 0; i < [[xmlParserRequestLink informationsRequestsLink] count]; i++) {
            
             NSLog(@"Type: %@", [(InformationRequestLink *)[[xmlParserRequestLink informationsRequestsLink] objectAtIndex:i] type]);
            
            NSLog(@"Title: %@", [(InformationRequestLink *)[[xmlParserRequestLink informationsRequestsLink] objectAtIndex:i] title]);
             NSLog(@"Author: %@", [(InformationRequestLink *)[[xmlParserRequestLink informationsRequestsLink] objectAtIndex:i] author]);
            NSLog(@"Editor: %@", [(InformationRequestLink *)[[xmlParserRequestLink informationsRequestsLink] objectAtIndex:i] editor]);
            
        }
        
    }
    else if([sourceNameEnter isEqual: @"publi_uha"]){
        
        NSLog(@"defaulforpublication %@", sourceNameEnter);
        
        xmlParserRequestPublication = [[XMLParserRequestPublication alloc] loadXMLtoURL:totalUrl];
        if(([[self.xmlParserRequestPublication informationsRequestsPublications] count] ==0)){
            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Result" message:@"Not Found" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            
        }else{
            NSString * resultFound=[NSString stringWithFormat:@"Found: %d",[[xmlParserRequestPublication informationsRequestsPublications] count]];
            
            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Result" message:resultFound delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            
        }


        
        for(int i = 0; i < [[xmlParserRequestPublication informationsRequestsPublications] count]; i++) {
            
            NSLog(@"Type: %@", [(InformationsRequest *)[[xmlParserRequestPublication informationsRequestsPublications] objectAtIndex:i] type]);
            
            NSLog(@"Title: %@",[(InformationsRequest *)[[xmlParserRequestPublication informationsRequestsPublications] objectAtIndex:i] title]);
            NSLog(@"Author: %@", [(InformationsRequest *)[[xmlParserRequestPublication informationsRequestsPublications] objectAtIndex:i]  author]);
            NSLog(@"YearEditor: %@", [(InformationsRequest *)[[xmlParserRequestPublication informationsRequestsPublications] objectAtIndex:i]  yearEdition]);
            
        }
        
    }
    else{
     
        xmlParserRequest = [[XMLParserRequest alloc] loadXMLtoURL:totalUrl];
        if(([[self.xmlParserRequest informationsRequests] count] ==0)){
            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Result" message:@"Not Found" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            
        }else{
            NSString * resultFound=[NSString stringWithFormat:@"Found: %d",[[xmlParserRequest informationsRequests] count]];
            
            UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Result" message:resultFound delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alert show];
            
        }


        for(int i = 0; i < [[xmlParserRequest informationsRequests] count]; i++) {
            
            NSLog(@"Type: %@", [(InformationsRequest *)[[xmlParserRequest informationsRequests] objectAtIndex:i] type]);
            
            NSLog(@"Title: %@", [(InformationsRequest *)[[xmlParserRequest informationsRequests] objectAtIndex:i] title]);
            NSLog(@"Author: %@", [(InformationsRequest *)[[xmlParserRequest informationsRequests] objectAtIndex:i] author]);
            NSLog(@"Editor: %@", [(InformationsRequest *)[[xmlParserRequest informationsRequests] objectAtIndex:i] editor]);
            NSLog(@"YearEdition: %@", [(InformationsRequest *)[[xmlParserRequest informationsRequests] objectAtIndex:i] yearEdition]);
            NSLog(@"IdentiferBook: %@", [(InformationsRequest *)[[xmlParserRequest informationsRequests] objectAtIndex:i] identifierBook]);
            
            
            
            
        }
    }

    [super viewDidLoad];


    
}

#pragma mark -
#pragma  mark Table View Data Source Methodes

-(NSInteger)tableView:(UITableView * )tableView numberOfRowsInSection:(NSInteger)section{
    
    
    
    
    if([sourceNameEnter isEqual: @"defaultforsignet"]){
        NSLog(@"%lu",(unsigned long)[[self.xmlParserRequestLink informationsRequestsLink] count]);
        return  [[self.xmlParserRequestLink informationsRequestsLink] count];
        
    }
    if([sourceNameEnter isEqual: @"publi_uha"]){
        return  [[self.xmlParserRequestPublication informationsRequestsPublications] count];
        NSLog(@"%lu",(unsigned long)[[self.xmlParserRequestPublication informationsRequestsPublications] count]);
    }
    else
    {
        return  [[self.xmlParserRequest informationsRequests] count];
        NSLog(@"%lu",(unsigned long)[[self.xmlParserRequest informationsRequests] count]);
    }
    

    
    



}


-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:@"Test"];

NSUInteger row =[indexPath row];




if([sourceNameEnter isEqual: @"defaultforsignet"]){
    
    NSLog(@"defaultforsignet table %@", sourceNameEnter);
    cell.textLabel.text = [(InformationRequestLink *)[[xmlParserRequestLink informationsRequestsLink] objectAtIndex:row] title];
    
    cell.detailTextLabel.text = [(InformationRequestLink *)[[xmlParserRequestLink informationsRequestsLink] objectAtIndex:row] type];
}

else if([sourceNameEnter isEqual: @"publi_uha"]){
    
    NSLog(@"defaultforsignet table %@", sourceNameEnter);
    cell.textLabel.text = [(InformationsRequest *)[[xmlParserRequestPublication informationsRequestsPublications] objectAtIndex:row] title];
    
    cell.detailTextLabel.text = [(InformationsRequest *)[[xmlParserRequestPublication informationsRequestsPublications]objectAtIndex:row] author];
}

else
{
    cell.textLabel.text = [(InformationsRequest *)[[xmlParserRequest informationsRequests] objectAtIndex:row] title];
    cell.detailTextLabel.text = [(InformationsRequest *)[[xmlParserRequest informationsRequests] objectAtIndex:row] author];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
   /* NSUInteger row =[indexPath row];
    
    ResultSimpleDetailViewController * nextController = [self.xmlParserRequest.informationsRequests objectAtIndex:row];
    
    [self.navigationController pushViewController:nextController animated:YES];
    
    
    NSString * rowValue = [[[xmlParserRequest informationsRequests] objectAtIndex:row ] title];
    
    NSString * message = [[NSString alloc] initWithFormat:@"Vous avez selectionnez : %@", rowValue];
   
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Ligne selectionnée" message:message delegate:nil cancelButtonTitle:@"Oui" otherButtonTitles:nil];
    
    [alert show];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];*/
                    

}




- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{


id destination = segue.destinationViewController;

if ([destination isKindOfClass:[ResultSimpleDetailViewController class]]) {
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    if([sourceNameEnter isEqual: @"defaultforsignet"]){
        
        ((ResultSimpleDetailViewController * )destination).labelTitleReceive = [(InformationRequestLink *)[[xmlParserRequestLink informationsRequestsLink] objectAtIndex:indexPath.row] title];
        ((ResultSimpleDetailViewController * )destination).labelAuthorReceive= [(InformationRequestLink *)[[xmlParserRequestLink informationsRequestsLink]  objectAtIndex:indexPath.row ] author];
        ((ResultSimpleDetailViewController * )destination).labelTypeReceive = [(InformationRequestLink *)[[xmlParserRequestLink informationsRequestsLink]  objectAtIndex:indexPath.row ] type];
        ((ResultSimpleDetailViewController * )destination).labelEditorReceive = [(InformationRequestLink *)[[xmlParserRequestLink informationsRequestsLink]  objectAtIndex:indexPath.row ]editor];
    }
    
    else if([sourceNameEnter isEqual: @"publi_uha"]){
        
        ((ResultSimpleDetailViewController * )destination).labelTitleReceive = [(InformationsRequest *)[[xmlParserRequestPublication informationsRequestsPublications] objectAtIndex:indexPath.row] title];
        
        ((ResultSimpleDetailViewController * )destination).labelAuthorReceive = [(InformationsRequest *)[[xmlParserRequestPublication informationsRequestsPublications] objectAtIndex:indexPath.row ] author];
        
        ((ResultSimpleDetailViewController * )destination).labelTypeReceive = [(InformationsRequest *)[[xmlParserRequestPublication informationsRequestsPublications]  objectAtIndex:indexPath.row ] type];
        
        ((ResultSimpleDetailViewController * )destination).labelYearReceive = [(InformationsRequest *)[[xmlParserRequestPublication informationsRequestsPublications] objectAtIndex:indexPath.row ]yearEdition];
        
    }
    else
    {
        
        
        
        ((ResultSimpleDetailViewController * )destination).labelTitleReceive = [(InformationsRequest *)[[xmlParserRequest informationsRequests] objectAtIndex:indexPath.row] title];
        ((ResultSimpleDetailViewController * )destination).labelAuthorReceive= [(InformationsRequest *)[[xmlParserRequest informationsRequests] objectAtIndex:indexPath.row ] author];
        ((ResultSimpleDetailViewController * )destination).labelTypeReceive = [(InformationsRequest *)[[xmlParserRequest informationsRequests] objectAtIndex:indexPath.row ] type];
        ((ResultSimpleDetailViewController * )destination).labelEditorReceive = [(InformationsRequest *)[[xmlParserRequest informationsRequests] objectAtIndex:indexPath.row ]editor];
        ((ResultSimpleDetailViewController * )destination).labelYearReceive = [(InformationsRequest *)[[xmlParserRequest informationsRequests] objectAtIndex:indexPath.row ]yearEdition];
        
        ((ResultSimpleDetailViewController * )destination).IdentifierBookReceive = [(InformationsRequest *)[[xmlParserRequest informationsRequests] objectAtIndex:indexPath.row ] identifierBook  ];
    }
    
    ((ResultSimpleDetailViewController * )destination).apiSessionReceive = self.apiSessionReturn;
    
}

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
