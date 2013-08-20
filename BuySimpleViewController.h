//
//  BuySimpleViewController.h
//  Library
//
//  Created by Projet on 30/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BuySimpleViewController : UIViewController<UIWebViewDelegate>{
    
    //Title of the book you want to buy
    NSString * titleToBuy;
    
    
}
 //Display when user didn't not select a market
@property (strong, nonatomic) IBOutlet UILabel *labelNoSelection;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic,retain) NSString * titleToBuy;

@end
