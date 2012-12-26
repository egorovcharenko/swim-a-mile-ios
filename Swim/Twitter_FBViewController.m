//
//  Twitter_FBViewController.m
//  Swim
//
//  Created by Madept on 25/11/12.
//  Copyright (c) 2012 Madept. All rights reserved.
//
#import "Twitter_FBViewController.h"

@interface Twitter_FBViewController ()

@end

@implementation Twitter_FBViewController
@synthesize fbGraph, feedPostId, distance, triningNumber;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    TwitterFBmsg = [NSString stringWithFormat:@"I have completed training %d, %@ using #swimamile", triningNumber, distance];
    [TwitterFBmsg retain];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(cancelAction)];
    
    [popupBgImage addGestureRecognizer:tap];
}

- (IBAction)twitterAction:(id)sender {
    
    
    if ([TWTweetComposeViewController canSendTweet])
    {
        TWTweetComposeViewController *tweetSheet =
        [[TWTweetComposeViewController alloc] init];
        [tweetSheet setInitialText:TwitterFBmsg];
	    [self presentModalViewController:tweetSheet animated:YES];
    }
    else
    {
        NSLog(@"canSendTweet returns NO!!");
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Sorry"
                                  message:@"You can't send a tweet right now, make sure your device has an internet connection and you have at least one Twitter account setup"
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles:nil];
        [alertView show];
    }
    
    
}

- (IBAction)facebookAction:(id)sender {
    /*Facebook Application ID*/
	//NSString *client_id = @"130902823636657";
	//NSString *client_id = @"181270782006133";
	//self.view.alpha = 0.3;
	NSString *client_id = @"135474433270211";
	
	//alloc and initalize our FbGraph instance
	self.fbGraph = [[FbGraph alloc] initWithFbClientID:client_id];
	
	//begin the authentication process.....
	[fbGraph authenticateUserWithCallbackObject:self andSelector:@selector(fbGraphCallback:)
						 andExtendedPermissions:@"user_photos,user_videos,publish_stream,offline_access,user_checkins,friends_checkins"];
    
   
     [self performSelector:@selector(startAnumator) withObject:nil afterDelay:0.1];
    
	/**
	 * OR you may wish to 'anchor' the login UIWebView to a window not at the root of your application...
	 * for example you may wish it to render/display inside a UITabBar view....
	 *
	 * Feel free to try both methods here, simply (un)comment out the appropriate one.....
	 **/
	//	[fbGraph authenticateUserWithCallbackObject:self andSelector:@selector(fbGraphCallback:) andExtendedPermissions:@"user_photos,user_videos,publish_stream,offline_access" andSuperView:self.view];
}

-(void)startAnumator
{
    activityView=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    activityView.frame=CGRectMake((320/2)-15, (480/2)-15, 30, 30);
    
    [activityView startAnimating];
    
    [self.view addSubview:activityView];
    [self.view bringSubviewToFront:activityView];
    
    NSUserDefaults* fbUser = [[NSUserDefaults alloc] init];
    //[fbUser setObject:@"loggedin" forKey:@"fblogin"];
    if (![[fbUser objectForKey:@"fblogin"] isEqualToString:@"loggedin"])
    {
        [self performSelector:@selector(stopIndicat) withObject:nil afterDelay:5.0];
    }

}

-(void)stopIndicat
{
    [activityView stopAnimating];
}

- (void)cancelAction {
    
    [self.view removeFromSuperview];
   /* if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        viewCtrObj = [[ViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil];
    } else {
        viewCtrObj = [[ViewController alloc] initWithNibName:@"ViewController_iPad" bundle:nil];
    }
    
    [self.view addSubview:viewCtrObj.view];*/
}

#pragma mark -
#pragma mark FbGraph Callback Function
/**
 * This function is called by FbGraph after it's finished the authentication process
 **/
- (void)fbGraphCallback:(id)sender {
	
    [activityView stopAnimating];
	if ( (fbGraph.accessToken == nil) || ([fbGraph.accessToken length] == 0) ) {
		
		NSLog(@"You pressed the 'cancel' or 'Dont Allow' button, you are NOT logged into Facebook...I require you to be logged in & approve access before you can do anything useful....");
		
		//restart the authentication process.....
		[fbGraph authenticateUserWithCallbackObject:self andSelector:@selector(fbGraphCallback:)
							 andExtendedPermissions:@"user_photos,user_videos,publish_stream,offline_access,user_checkins,friends_checkins"];
      
		
	} else {
		//pop a message letting them know most of the info will be dumped in the log
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Note" message:@"Message has been posted on your facebook wall!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		[alert show];
		[alert release];
		
		NSLog(@"------------>CONGRATULATIONS<------------, You're logged into Facebook...  Your oAuth token is:  %@", fbGraph.accessToken);
        [self postMeFeedButtonPressed:nil];
        self.view.alpha = 1.0;
        [self cancelAction];
        NSUserDefaults* fbUser = [[NSUserDefaults alloc] init];
        [fbUser setObject:@"loggedin" forKey:@"fblogin"];
        [fbUser synchronize];
		
	}
}


-(void)postMeFeedButtonPressed:(id)sender {
	
	NSMutableDictionary *variables = [NSMutableDictionary dictionaryWithCapacity:4];
	[variables setObject:TwitterFBmsg forKey:@"message"];
 	//[variables setObject:@"http://bit.ly/bFTnqd" forKey:@"link"];
 	//[variables setObject:@"This is the bolded copy next to the image" forKey:@"name"];
 	//[variables setObject:@"This is the plain text copy next to the image.  All work and no play makes Jack a dull boy." forKey:@"description"];
	
	FbGraphResponse *fb_graph_response = [fbGraph doGraphPost:@"me/feed" withPostVars:variables];
	NSLog(@"postMeFeedButtonPressed:  %@", fb_graph_response.htmlResponse);
	
	//parse our json
	SBJSON *parser = [[SBJSON alloc] init];
	NSDictionary *facebook_response = [parser objectWithString:fb_graph_response.htmlResponse error:nil];
	[parser release];
	
	//let's save the 'id' Facebook gives us so we can delete it if the user presses the 'delete /me/feed button'
	self.feedPostId = (NSString *)[facebook_response objectForKey:@"id"];
	NSLog(@"feedPostId, %@", feedPostId);
	NSLog(@"Now log into Facebook and look at your profile...");
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
