//
//  TrainingViewController.h
//  Swim
//
//  Created by Madept on 21/11/12.
//  Copyright (c) 2012 Madept. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TipsViewController.h"
@class TipsViewController;
@interface TrainingViewController : UIViewController
{

    IBOutlet UILabel *dateLbl;
  
   IBOutlet UIButton* arrowBtn1;
    UIButton* arrowBtn2;
    UIButton* arrowBtn3;
    UIButton* arrowBtn0;
   
    IBOutlet UIView *tableHeaderView;
    IBOutlet UIView *headerOne;
    IBOutlet UIView *slideViewOne;
    UIView *headerZero;
     UIView *slideViewZero;
    UIView *headerTwo;
    UIView *headerThree;
    UIView *slideViewTwo;
    UIView *slideViewThree;
    
    BOOL isArrowBtn0Selected;
     BOOL isArrowBtn1Selected;
     BOOL isArrowBtn2Selected;
     BOOL isArrowBtn3Selected;
    IBOutlet UIScrollView *scrollView;
    TipsViewController* tipsviewCtrObj;
    NSString* headerLbl;
    NSInteger row;
    BOOL isExtraRow;
}
@property(nonatomic) NSInteger row;
@property(nonatomic, retain)NSString* headerLbl;
- (IBAction)tipsAction:(id)sender;
- (IBAction)backAction:(id)sender;
@end
