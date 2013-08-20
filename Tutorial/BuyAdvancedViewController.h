//
//  BuyAdvancedViewController.h
//  Library
//
//  Created by Projet on 31/05/13.
//  Copyright (c) 2013 Projet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BuyAdvancedViewController : UIViewController<UIWebViewDelegate>{
    
    //Title of the book you want to buy
    NSString * titleToBuy;
    
}

 //Display when user didn't not select a market
@property(nonatomic,retain) NSString * titleToBuy;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UILabel *labelNoSelection;

@end
