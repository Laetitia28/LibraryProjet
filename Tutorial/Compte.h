//
//  Compte.h
//  Tutorial
//
//  Created by Projet on 14/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLParser.h"
#import "XMLParserCompte.h"


@interface Compte : UIViewController
{
    XMLParser *xmlParser;
    XMLParser * xmlParserFindUserId;
    XMLParserCompte * xmlParserCompte;
    
    NSString * userId;
    NSString * name;
    NSString * fistName;
    NSString * numberCard;
    NSString * DateBirth;
    NSString * libraryName;
    NSString * date_Inscription;
    NSString * date_Suspension;
    NSString * eMail;    
    NSString * loginReceive;
    
}

    @property (strong, nonatomic) IBOutlet UIButton *buttonGo;
    
    @property (nonatomic,retain) XMLParser * xmlParser;
    @property (nonatomic,retain) XMLParser * xmlParserFindUserId;
    @property (strong, nonatomic) XMLParserCompte * xmlParserCompte;

    @property (strong, nonatomic) IBOutlet UILabel *NumCarte;
 
    @property (strong, nonatomic) IBOutlet UILabel *NomUtilisateur;
    @property (strong, nonatomic) IBOutlet UILabel *PrenomUtilisateur;
    @property (strong, nonatomic) IBOutlet UILabel *emailLabel;
    @property (strong, nonatomic) IBOutlet UILabel *dateNaissance;
    @property (strong, nonatomic) IBOutlet UILabel *dateInscription;
    @property (strong, nonatomic) IBOutlet UILabel *dateSuspension;
    @property (strong, nonatomic) IBOutlet UILabel *Librairie;



    @property (nonatomic,retain)   NSString * loginReceive;
    @property (strong, nonatomic)  NSString * userId;
    @property (strong, nonatomic)  NSString * name;
    @property (strong, nonatomic)  NSString * fistName;
    @property (strong, nonatomic)  NSString * numberCard;
    @property (strong, nonatomic)  NSString * DateBirth;
    @property (strong, nonatomic)  NSString * libraryName;
    @property (strong, nonatomic)  NSString * date_Suspension;
    @property (strong, nonatomic)  NSString * eMail;
    @property (strong, nonatomic)  NSString * date_Inscription;
    

@end
