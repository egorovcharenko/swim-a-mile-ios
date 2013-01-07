//
//  Twitter_FBViewController.h
//  Swim
//
//  Created by Madept on 25/11/12.
//  Copyright (c) 2012 Madept. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "ViewController.h"
#import <Twitter/Twitter.h>
//#import "FacebookAPIViewController.h"
#import "FbGraph.h"
#import "SBJSON.h"
@class ViewController;

@interface Twitter_FBViewController : UIViewController
{
    //FacebookAPIViewController* facebookAPIObj;
    FbGraph *fbGraph;
    
	//we'll use this to store a feed post (when you press 'post me/feed').
	//when you press delete me/feed this is the post that's deleted
	NSString *feedPostId;

    ViewController* viewCtrObj;
    IBOutlet UIImageView *popupBgImage;
    UIActivityIndicatorView *activityView;
    NSInteger triningNumber;
    NSString* distance;
    NSString* TwitterFBmsg;
    
}
@property(nonatomic) NSInteger triningNumber;
@property(nonatomic, retain) NSString* distance;
@property (nonatomic, retain) FbGraph *fbGraph;
@property (nonatomic, retain) NSString *feedPostId;
- (IBAction)twitterAction:(id)sender;
- (IBAction)facebookAction:(id)sender;
- (void)cancelAction;

@end
