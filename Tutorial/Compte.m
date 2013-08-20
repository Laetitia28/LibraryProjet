//
//  Compte.m
//  Tutorial
//
//  Created by Projet on 14/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import "Compte.h"

#import "XMLParser.h"
#import "Informations.h"

#import "XMLParserCompte.h"
#import "InformationsUser.h"

#import "MyBooks.h"
#import <QuartzCore/QuartzCore.h>

@interface Compte ()


@end


@implementation Compte

//XML PARSER
@synthesize xmlParser,xmlParserCompte,xmlParserFindUserId;

@synthesize loginReceive;
//UILABEL
@synthesize NomUtilisateur,PrenomUtilisateur,dateInscription,dateNaissance,Librairie,NumCarte,dateSuspension,emailLabel;

@synthesize  userId,name,fistName,numberCard,DateBirth,date_Suspension,date_Inscription,eMail,libraryName,buttonGo;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}




- (void)viewDidLoad
{
    
    /*
     Connect to library server and retrieve the number of apiSession
     */
    
    
    NSString *apiSessionReturn = [[NSString alloc]init];
    
    xmlParser = [[XMLParser alloc] loadXMLtoURL:@"http://www.scd.uha.fr/*********/XAPI?method=login&code=api_scd&password=api_scd"];
    
    apiSessionReturn = [(Informations *)[[xmlParser informations] objectAtIndex:0] apiSession];
    
    NSLog(@"api session compte %@",apiSessionReturn);
    
    
    /*
     
     Retrieve  borrowerId of user and launch a request with a xmlParserFindUserId
     */
    
    
    NSString * URLUser = @"http://www.scd.uha.fr/*********/XAPI?&method=communication.identifyBorrower&borrowerCodeField=CODE&borrowerCode=";
    
    NSString * URLComplet = [NSString stringWithFormat:@"%@%@%@%@",URLUser,loginReceive,@"&apiSession=",apiSessionReturn];
    
    NSLog(@"url totoal %@",URLComplet);
    
    
    
    
    xmlParserFindUserId=[[XMLParser alloc]loadXMLtoURL:URLComplet];
    
    
    
    for(int i = 0; i < [[xmlParserFindUserId informations] count]; i++) {
        
        
        userId = [(Informations *)[[xmlParserFindUserId informations] objectAtIndex:i] userId];
        
        NSLog(@"BorewerId: %@", [(Informations *)[[xmlParserFindUserId informations] objectAtIndex:i] userId]);
        
    }
    
    /*
     Retrieve informations of user and launch a request with a xmlParserCompte
     
     */
    
    NSString * URLUserInfo = @"http://www.scd.uha.fr/*********/XAPI?&method=communication.getBorrowerIdentity&borrowerId=";
    NSLog(@"%@",userId);
    
    NSString * URLComplet2=[NSString stringWithFormat:@"%@%@%@%@",URLUserInfo,userId,@"&apiSession=",apiSessionReturn];
    
    NSLog(@"%@",URLComplet2);
    
    xmlParserCompte =[[XMLParserCompte alloc]loadXMLtoURL:URLComplet2];
    
    
    
    
    for(int i = 0; i < [[xmlParserCompte informationsUser] count]; i++) {
        
        
        name =[(InformationsUser*)[[xmlParserCompte informationsUser] objectAtIndex:i]name];
        NSLog(@"Nom: %@",[(InformationsUser*)[[xmlParserCompte informationsUser] objectAtIndex:i]name]);
        
        fistName=[(InformationsUser*)[[xmlParserCompte informationsUser] objectAtIndex:i]firstName];
        NSLog(@"Prenom: %@",[(InformationsUser*)[[xmlParserCompte informationsUser] objectAtIndex:i]firstName]);
        
        numberCard=[(InformationsUser*)[[xmlParserCompte informationsUser] objectAtIndex:i]card];
        NSLog(@"num_carte: %@",[(InformationsUser*)[[xmlParserCompte informationsUser] objectAtIndex:i]card]);
        
        date_Inscription=[(InformationsUser*)[[xmlParserCompte informationsUser] objectAtIndex:i]dateInscription];
        NSLog(@"date_inscription: %@",[(InformationsUser*)[[xmlParserCompte informationsUser] objectAtIndex:i]dateInscription]);
        
        
        date_Suspension=[(InformationsUser*)[[xmlParserCompte informationsUser] objectAtIndex:i]dateSuspension];
        NSLog(@"date_suspension: %@",[(InformationsUser*)[[xmlParserCompte informationsUser] objectAtIndex:i]dateSuspension]);
        
        
        eMail=[(InformationsUser*)[[xmlParserCompte informationsUser] objectAtIndex:i]email];
        NSLog(@"Email: %@",[(InformationsUser*)[[xmlParserCompte informationsUser] objectAtIndex:i]email]);
        
        libraryName=[(InformationsUser*)[[xmlParserCompte informationsUser] objectAtIndex:i]library];
        NSLog(@"biblio: %@",[(InformationsUser*)[[xmlParserCompte informationsUser] objectAtIndex:i]library]);
        
        DateBirth=[(InformationsUser*)[[xmlParserCompte informationsUser] objectAtIndex:i]dateBirth];
        NSLog(@"date_naissance: %@",[(InformationsUser*)[[xmlParserCompte informationsUser] objectAtIndex:i]dateBirth]);
        
        
    }
    if ([date_Suspension isEqual: @" "]) {
        
        self.dateSuspension.text=@"Aucune Date";
        
    }
    
    /*
     Display informations of the User by UILabel
     */
    
    
    self.NomUtilisateur.text=self.name;
    self.PrenomUtilisateur.text=self.fistName;
    self.NumCarte.text=self.numberCard;
    self.dateNaissance.text=self.DateBirth;
    self.Librairie.text=self.libraryName;
    self.dateInscription.text=self.date_Inscription;
    self.dateSuspension.text=self.date_Suspension;
    self.emailLabel.text=self.eMail;
    
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 Transfer UserId from Compte to MyBooks
 */

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender

{
    
    id destination = segue.destinationViewController;
    
    
    
    if ([destination isKindOfClass:[MyBooks class]]) {
        
        
        
        ((MyBooks * )destination).userIdReceive= self.userId;
        NSLog(@"%@",((MyBooks * )destination).userIdReceive);
        
        
        
        
    }
    
    
}




@end
