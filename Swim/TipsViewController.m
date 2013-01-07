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
    // Return the number of rows in the section.
    switch (section) {
        case 0: return 2;
        case 1: return 4;
        case 2: return 2;
        case 3: return 3;
        case 4: return 13;
        default: return 1;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    
    return 5;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UILabel *headerLabel = nil;
//    switch (section) {
//        case 0:
//            headerLabel = [[UILabel alloc] init];
//            headerLabel.text = @"test";
//            return headerLabel;
//            break;
//        case 1:
//            ;
//        default:
//            break;
//    }
//    return headerLabel;
//
//}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName = @"Preparation - general tips";
            break;
        case 1:
            sectionName = @"Preparation - week 1, day 1";
            break;
        case 2:
            sectionName = @"Preparation - week 1, days 2 & 3";
            break;
        case 3:
            sectionName = @"Preparation - week 2";
            break;
        case 4:
            sectionName = @"Swimming a mile";
            break;
            // ...
        default:
            sectionName = @"";
            break;
    }
    return sectionName;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    // if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    
    UILabel* titleText;
    
    float height = [self tableView:tableView heightForRowAtIndexPath:indexPath];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        titleText = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 280, height)];
    }
    else {
        titleText = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 630, height)];
    }
    titleText.numberOfLines = 0;
    [titleText setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    
    [titleText setFont:[UIFont boldSystemFontOfSize:16.0]];
    [titleText setBackgroundColor:[UIColor clearColor]];
    [cell.contentView addSubview:titleText];
    
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                {
                    
                    [titleText setText:@"If you cannot swim 100 meters freestyle yet, don't worry. Below is 2-week plan to get your stamina to level needed to start going for 1 mile."];
                }
                    break;
                case 1:
                {
                    
                    [titleText setText:@"Just do the excersises below three times per week, with one day rest between them. It should take you two to three weeks to be able to swim first drill in main program"];
                }
                    break;
            }
            break;
        case 1:
            switch (indexPath.row) {
                case 0:
                {
                    
                    [titleText setText:@"Start walking in the pool. Then try running. If the pool supplies belts for water running, use one. If not, it doesn’t matter.  "];
                }
                    break;
                case 1:
                {
                    
                    [titleText setText:@"After 5 or 10 minutes of water walking/running, put on a cap so that goggles will not pull at your hair. Adjust the goggles. Sit at the bottom of the pool to reassure yourself they will not leak."];
                }
                    break;
                    
                case 2:
                {
                    [titleText setText:@"Swim any stroke at all, disregarding technique. As soon as you feel like stopping, flop over and do any kind of backstroke. When you tire, if possible still without stopping, switch to another stroke, such as sidestroke. If you do stop, keep the rest short until you are breathing somewhat more easily, but are not fully recovered."];
                }
                    break;
                case 3:
                {
                    [titleText setText:@"You must experience some discomfort because that is how you tell that bubble wrap to increase its surface area and those annoyed little organelles to multiply. The effect takes place quickly, but easy days in between are necessary for the growth to occur."];
                }
                break;            }
            break;
        case 2:
            switch (indexPath.row) {
                case 0:
                {
                    
                    [titleText setText:@"Whatever you found most enjoyable may be continued, always increasing the distance using any stroke that makes it possible. "];
                }
                    break;
                case 1:
                {
                    [titleText setText:@"A kickboard is sufficiently unpleasant to be useful, but stay away from pull-buoys. Your quads are big, demanding muscles and if you don’t use them because of the pull-buoy flotation, you defeat the whole purpose."];
                }
                    break;
            }
            break;
        case 3:
            switch (indexPath.row) {
                case 0:
                {
                    
                    [titleText setText:@"Increase the amount of freestyle, but still change strokes rather than stop. When you can swim two laps, resting for a maximum of 12 breaths and repeating 3 times for a total of 400 yards, go on to:"
                     
                     ];
                }
                    break;
                case 1:
                {
                    
                    [titleText setText:@"• 100 any stroke warm-up\r• 3 x 100 ( 12 breaths between)\r• 3 x 75 ( 10 breaths)\r• 3 x 25 ( 6 breaths)"];
                }
                    break;
                case 2:
                {
                    
                    [titleText setText:@"You are ready for the Zero to One Mile program. If a second week like the first doesn’t do the trick, a third week should make it all possible."];
                }
                    break;
                    
            }
            break;
        case 4:
            switch (indexPath.row) {
                case 0:
                {
                    [titleText setText:@"Speed is not your aim during these six weeks.  Nor is the perfect stroke.  They come later or not at all if your intention is just to enjoy the water, or to get some pleasant exercise."];
                }
                    break;
                case 1:
                {
                    
                    [titleText setText:@"If you think you're really too breathless just to get to the end of the pool, let your legs drag; the quads, being so big, take a disproportionate amount of oxygen."];
                }
                    break;
                case 2:
                {
                    
                    [titleText setText:@"Any muscle will, of course, use more when in use than when relaxed, so if you don't need to use the muscle, don't - for example, when you are recovering your arms."];
                }
                    break;
                case 3:
                {
                    
                    [titleText setText:@"Relaxing even your neck will help make the swim easier."];
                }
                    break;
                case 4:
                {
                    
                    [titleText setText:@"No gasping and no 100% efforts at this stage. This should be constructive exercise, NOT do or die"];
                }
                    break;
                case 5:
                {
                    
                    [titleText setText:@"Will there come a day when you are completely relaxed and breathing gently and easily throughout the swim? Not really. "];
                }
                    break;
                case 6:
                {
                    
                    [titleText setText:@"Yes, it is actually a pleasure to work out hard, to feel used up at the end of the swim. Most of find that we are more productive during the rest of the day as a result of working out. "];
                }
                    break;
                case 7:
                {
                    
                    [titleText setText:@"Most of the big problems of a beginner disappear on their own by the time they can swim a straight mile."];
                }
                    break;
                case 8:
                {
                    
                    [titleText setText:@"Holding the head too high - the most common problem - is difficult; as you become more comfortable, gravity kindly assists you and it goes down without attention."];
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
                    
                    [titleText setText:@"Visit ruthkazez.com for additional useful tips from Ruth Talman Kazez, the author of them and these workouts."];
                }
                    break;
                case 12:
                {
                    
                    [titleText setText:@"Bring a friend or two to the pool."];
                }
                    break;
                    
                    
                default:
                    break;
            }
            
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
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    return 110;
                case 1:
                    return 110;
                    break;
                default:
                    break;
            }
        case 1:
            switch (indexPath.row) {
                case 0:
                    return 90;
                case 1:
                    return 130;
                    break;
                case 2: return 215;
                case 3: return 170;
                    
                default:
                    break;
            }
        case 2:
            switch (indexPath.row) {
                case 0:
                    return 90;
                case 1:
                    return 150;
                    break;
                    
                default:
                    break;
            }
        case 3:
            switch (indexPath.row) {
                case 0:
                    return 130;
                case 1:
                    return 90;
                    break;
                case 2:
                    return 90;
                    break;
                default:
                    break;
            }
        case 4:
            switch (indexPath.row) {
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
                    
                {
                    
                    return 50;
                }
                    break;
                case 11: return 00;
                case 4: return 70;
                case 7: return 90;
                case 5: return 90;
                case 12: return 30;
                    
                default:
                    break;
            }
            
    }
    
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
        [mailViewController setSubject:@"Feedback regarding 'Swim a Mile'"];
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
