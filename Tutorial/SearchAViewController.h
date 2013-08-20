//
//  SearchAViewController.h
//  Tutorial
//
//  Created by Projet on 14/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchAViewController : UIViewController{
  
    
    
       CGFloat animatedDistance;
    
}


@property (strong, nonatomic) IBOutlet UIButton *buttonGo;
 

@property (strong, nonatomic) IBOutlet UISegmentedControl *tab1;
@property (strong, nonatomic) IBOutlet UISegmentedControl *tab2;

@property (strong, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) IBOutlet UILabel *label2;
@property (strong, nonatomic) IBOutlet UILabel *label3;

@property (strong, nonatomic) IBOutlet UITextField *Field1;

@property (strong, nonatomic) IBOutlet UITextField *field2;
@property (strong, nonatomic) IBOutlet UITextField *selectionsupportavancee;

@property (nonatomic,retain)  NSString * indexAdvancedBrute1;
@property (nonatomic,retain)  NSString * indexAdvancedBrute2;
@property (nonatomic,retain)  NSString * informationAdvancedBrute1;
@property (nonatomic,retain)  NSString * informationAdvancedBrute2;
@property (nonatomic,retain)  NSString * sourceNameAdvancedBrute;
@property (nonatomic,retain)  NSString * operatorAdvancedBrute;

@property (strong, nonatomic) IBOutlet UIButton *ou;

@property (strong, nonatomic) IBOutlet UIButton *et;

- (IBAction)tabChanged2:(id)sender;
- (IBAction)tabChanged1:(id)sender;


- (IBAction)text1:(id)sender;
- (IBAction)BtnEt:(id)sender;
- (IBAction)BtnOu:(id)sender;
- (IBAction)text2:(id)sender;

- (void)setLabelSupport:(NSString *)text;


@end
