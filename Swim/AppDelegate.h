//
//  AppDelegate.h
//  Swim
//
//  Created by Madept on 21/11/12.
//  Copyright (c) 2012 Madept. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "FBConnect.h"
//#import "FBSession.h"
@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
  // FBSession *_session;
}

@property (strong, nonatomic) UIWindow *window;
//@property (strong, nonatomic)NSUserDefaults *defaults;
@property (strong, nonatomic) ViewController *viewController;

//@property (nonatomic,retain) FBSession *_session;
@end
