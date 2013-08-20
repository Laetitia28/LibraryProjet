//
//  SearchSViewController.h
//  Tutorial
//
//  Created by Projet on 14/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SearchSViewController : UIViewController  <UITextFieldDelegate> {



    IBOutlet UITextField *information;
    
    CGFloat animatedDistance;
}


- (IBAction)tabChangedSimple:(id)sender;

- (IBAction)addButon:(id)sender;

- (void)setLabelSupport:(NSString *)text;

@property (strong, nonatomic) IBOutlet UISegmentedControl *tabSimple;

@property (strong, nonatomic) IBOutlet UITextField *information;

@property (strong, nonatomic) IBOutlet UITextField *selectionSupport;

@property (strong ,nonatomic) NSString * indexSimpleBrut;

@property (strong ,nonatomic) NSString * informationSimple;

@property (strong ,nonatomic) NSString * sourceNameSimpleBrut;
@property (strong, nonatomic) IBOutlet UIButton *buttonGo;

@end
