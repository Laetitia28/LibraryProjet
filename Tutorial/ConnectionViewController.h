//
//  ConnexionViewController.h
//  Tutorial
//
//  Created by Projet on 13/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface ConnectionViewController : UIViewController  <UITextFieldDelegate> {
    
    IBOutlet UITextField *login;
    IBOutlet UITextField *password;
    
    CGFloat animatedDistance;
    
}



@property (nonatomic,retain) IBOutlet UITextField *login;

@property (nonatomic,retain) IBOutlet UITextField *password;



- (IBAction)ConnectTo:(id)sender;

- (IBAction)cancel:(id)sender;

@end
       