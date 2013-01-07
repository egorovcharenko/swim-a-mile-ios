//
//  TipsViewController.h
//  Swim
//
//  Created by Madept on 21/11/12.
//  Copyright (c) 2012 Madept. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "Util.h"
@class ViewController;
@interface TipsViewController : UIViewController<MFMailComposeViewControllerDelegate, UITableViewDelegate>
{

    ViewController* goalViewCtrObj;
    Util* utilObj;
    NSDateFormatter *formatter;
}
- (IBAction)goalAction:(id)sender;
- (IBAction)feedbackAction:(id)sender;
- (IBAction)resetAction:(id)sender;

@end
