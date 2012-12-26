//
//  ViewController.h
//  Swim
//
//  Created by Madept on 21/11/12.
//  Copyright (c) 2012 Madept. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TipsViewController.h"
#import "TrainingViewController.h"
#import "Util.h"
#import "Twitter_FBViewController.h"

@class Twitter_FBViewController;
@class TipsViewController;
@class TrainingViewController;
@interface ViewController : UIViewController
{

    
    IBOutlet UILabel *headingLbl;
    IBOutlet UILabel *subHeadingLbl;
    IBOutlet UIButton *goalBtn;
    
    IBOutlet UIButton *tipsBtn;
    TipsViewController* tipsViewCtrObj;
   
    TrainingViewController* triningViewCtrObj;
    UIButton* checkBoxBtn;
    UILabel* statusText;
    IBOutlet UITableView *tableView;
    IBOutlet UIImageView *barBGImage;
    IBOutlet UIImageView *barFGImage;
    IBOutlet UILabel *barTitle;
    UIButton *button;
    UILabel* statusLabel;
    NSDateFormatter *formatter;
    NSString *dueDate;
    NSString* statusForRow;
    Util* utilObj;
    NSMutableArray* statusLabels;
    NSInteger day;
    //NSUserDefaults *defaults;
   
    BOOL postOnSocial;
    
    Twitter_FBViewController* twitFbObj;
    NSArray* distanceArray;
}
@property(nonatomic, retain)  IBOutlet UITableView *tableView;
- (IBAction)goalAction:(id)sender;
- (IBAction)tipsAction:(id)sender;

@end
