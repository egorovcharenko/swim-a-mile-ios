//
//  TipsViewController.m
//  Swim
//
//  Created by Madept on 21/11/12.
//  Copyright (c) 2012 Madept. All rights reserved.
//

#import "TipsViewController.h"

@interface TipsViewController ()

@end

@implementation TipsViewController

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
}

#pragma mark -
#pragma mark TableView Delegate Methods
#pragma mark -

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
	return 13;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    // if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    
    UILabel* titleText;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        titleText = [[UILabel alloc]initWithFrame:CGRectMake(10, -5, 300, 120)];
    }
    else {
        
        titleText = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 750, 120)];
        
    }
    titleText.numberOfLines = 0;
    [titleText setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    
    [titleText  setFont:[UIFont boldSystemFontOfSize:16.0]];
    [titleText setBackgroundColor:[UIColor clearColor]];
    [cell.contentView addSubview:titleText];

   
    switch (indexPath.row) {
        case 0:
        {
        
            [titleText setText:@"Speed is not aim during these six weeks. Nor is the perfect strok. They come later or not at all if your intention is just to enjoy the water to relax or to get some pleasant exercise."];
        }
            break;
        case 1:
        {
            
            [titleText setText:@"If you think you're really too breathless just to get to the end of the pool , let your legs drag; the quads , being so big take a disproportionate amount of oxygen."];
        }
            break;
        case 2:
        {
            
            [titleText setText:@"Any muscle will, of course, more when in use than when relaxed, so if don't need to use muscle, don't - for example, when you are recovering your arms."];
        }
            break;
        case 3:
        {
            
            [titleText setText:@"Relaxing your neck will help make the swim easier."];
        }
            break;
        case 4:
        {
            
            [titleText setText:@"No gasping and no 100% efforts at this stage. This should be constructive exercise, Not do or die."];
        }
            break;
        case 5:
        {
            
            [titleText setText:@"Will there come a day when you are completely  relaxed and breathing gently and easily throughout  the swim? Not really."];
        }
            break;
        case 6:
        {
            
            [titleText setText:@"Yes, it is actually a pleasure to work out hard, to feel used up at the end of the swim. Oddly enough, most of find that we are more productive during the rest of the day as result of working out. "];
        }
            break;
        case 7:
        {
            
            [titleText setText:@"Most of the big problems of beginner disappear on their own by the time they can swim a straight mile."];
        }
            break;
        case 8:
        {
            
            [titleText setText:@"Holding the head too high - the most common problem - is difficult; as you become more comfortable, gravity kindly assist you and it goes down without attention."];
        }
            break;
        case 9:
        {
            
            [titleText setText:@"Is technique really everything after the first six weeks? Yes."];
        }
            break;
        case 10:
        {
            
            [titleText setText:@"I recommend that you not tie yourself up in knots and get discouraged by technical concerns in beginning. You are here to enjoy some exercise, not go to olympics. "];
        }
            break;
        case 11:
        {
            
            [titleText setText:@"Feel free to contact the developer: egor.ovcharenko@gmail.com"];
        }
            break;
        case 12:
        {
            
            [titleText setText:@"Visit ruthkazez.com for additional useful tips from Ruth Talman Kazez, the author of them and these workouts."];
        }
            break;

            
        default:
            break;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
	return cell;
}


#pragma mark -
#pragma mark TableView Data Source Methods
#pragma mark -

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /* switch (indexPath.row) {
       case 0:
        case 1:
        case 2:
        case 6:
        case 8:
        case 10:
        {
            
            return 110;
        }
            break;
        case 3:
        case 9:
        case 11:
        {
            
            return 50;
        }
            break;
        case 4:
        case 7:
        {
            
            return 110;
        }
            break;
        case 5:
        case 12:
        {
            
            return 110;
        }
            break;
        
        default:
            break;
    }
*/
    return 110;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (IBAction)goalAction:(id)sender {
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
            goalViewCtrObj = [[ViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil];
        }
        if(result.height == 568)
        {
            goalViewCtrObj = [[ViewController alloc] initWithNibName:@"ViewController_iPhone5" bundle:nil];
        }
        
    }
    else {
        
        goalViewCtrObj = [[ViewController alloc] initWithNibName:@"ViewController_iPad" bundle:nil];
    }

    
    [self.view addSubview:goalViewCtrObj.view];
}

- (IBAction)feedbackAction:(id)sender {
    
    if ([MFMailComposeViewController canSendMail]) {
        
        MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
        mailViewController.mailComposeDelegate = self;
        NSArray* recipient = [[NSArray alloc] initWithObjects:@"egor.ovcharenko@gmail.com", nil];
        [mailViewController setToRecipients:recipient];
        [mailViewController setSubject:@"Feedback regarding 'Trainer'"];
         [mailViewController setMessageBody:@"Hi." isHTML:NO];
          
          [self presentModalViewController:mailViewController animated:YES];
          
          
          }
          
          else {
              
              NSLog(@"Device is unable to send email in its current state.");
              
          }
          
}
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    
    [self dismissModalViewControllerAnimated:YES];
    
}


- (IBAction)resetAction:(id)sender {
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Do you wish to delete all progress?" delegate:self cancelButtonTitle:@"YES" otherButtonTitles:@"NO", nil];
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd.MM.yyyy"];
        NSString *currentDate = [formatter stringFromDate:[NSDate date]];

        //[defaults removeObjectForKey:@"appLounchDate"];
        [defaults removeObjectForKey:@"applicationLounchDate"];
        [defaults setObject:currentDate forKey:@"applicationLounchDate"];
        NSString* str;
        for (NSInteger i = 1; i<=18; i++) {
            
            str = [[NSString alloc] initWithFormat:@"traing%dcomplete",i];
            [defaults removeObjectForKey:str];
            [defaults setObject:@"TT" forKey:str];
            //[defaults synchronize];
            NSLog(@"default %d %@",i, [defaults objectForKey:str]);
        }
        [defaults synchronize];
        [utilObj.dueDatesArray removeAllObjects];
        [utilObj.checkBoxStatus removeAllObjects];
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            
            CGSize result = [[UIScreen mainScreen] bounds].size;
            if(result.height == 480)
            {
                goalViewCtrObj = [[ViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil];
            }
            if(result.height == 568)
            {
                goalViewCtrObj = [[ViewController alloc] initWithNibName:@"ViewController_iPhone5" bundle:nil];
            }
        }
        else {
            
            goalViewCtrObj = [[ViewController alloc] initWithNibName:@"ViewController_iPad" bundle:nil];
        }
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"" message:@"All records were deleted" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
        [self.view addSubview:goalViewCtrObj.view];
    }

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
