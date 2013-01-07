//
//  ViewController.m
//  Swim
//
//  Created by Madept on 21/11/12.
//  Copyright (c) 2012 Madept. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tableView;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
     postOnSocial = NO;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd.MM.yyyy"]; 
    NSString *currentDate;
    //if ([defaults objectForKey:@"applicationLounchDate"]!= [NSNull null]) {
        
        currentDate = [defaults objectForKey:@"applicationLounchDate"];
  //  }
    //else
    //currentDate = [formatter stringFromDate:[NSDate date]];
    
    NSDate *today = [NSDate date];
    NSString* tempStr = [formatter stringFromDate:today];
   
    NSString* startDay;
    if ([[formatter dateFromString:tempStr] compare:[formatter dateFromString:[defaults objectForKey:@"applicationLounchDate"]]] == NSOrderedSame) {
        
        
        startDay = @"today";
    }
    else
    {
        NSDate* appStartDate = [formatter dateFromString:[defaults objectForKey:@"applicationLounchDate"]];
        NSCalendar *gregorian = [[NSCalendar alloc]
                                 initWithCalendarIdentifier:NSGregorianCalendar];
        
        NSUInteger unitFlags = NSMonthCalendarUnit | NSDayCalendarUnit;
        
        NSDateComponents *components = [gregorian components:unitFlags
                                                    fromDate:appStartDate
                                                      toDate:today options:0];
        
       // NSInteger months = [components month];
        NSInteger days = [components day];
        
       /* NSTimeInterval interval = [today timeIntervalSinceDate:[formatter dateFromString:[defaults objectForKey:@"applicationLounchDate"]]];
                                    
        startDay = [formatter stringFromDate:[NSDate dateWithTimeInterval:interval sinceDate:[formatter dateFromString:[defaults objectForKey:@"applicationLounchDate"]]]];*/
        
        startDay = [NSString stringWithFormat:@"%d day ago", days];
    }
    NSString* subheader = [[NSString alloc] initWithFormat:@"Started %@, on %@", startDay,currentDate];
    headingLbl.textColor = [UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0];
    subHeadingLbl.textColor = [UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0];
    subHeadingLbl.text = subheader;
    
    //barFGImage.hidden = YES;
    //barTitle.text = @"0%(0 out of 18)";
    utilObj = [[Util alloc] init];
    distanceArray = [[NSArray alloc] initWithObjects:@"700m",@"700m",@"700m",@"900m",@"900m",@"900m",@"1200m",@"1200m",@"1200m",@"1500m",@"1500m",@"1500m",@"1600m",@"1600m",@"1600m",@"1650m",@"1650m",@"1650m", nil];
    
    utilObj.dueDatesArray = [[NSMutableArray alloc] initWithObjects:[defaults objectForKey:@"traing1complete"], [defaults objectForKey:@"traing2complete"], [defaults objectForKey:@"traing3complete"], [defaults objectForKey:@"traing4complete"], [defaults objectForKey:@"traing5complete"], [defaults objectForKey:@"traing6complete"], [defaults objectForKey:@"traing7complete"], [defaults objectForKey:@"traing8complete"], [defaults objectForKey:@"traing9complete"], [defaults objectForKey:@"traing10complete"], [defaults objectForKey:@"traing11complete"], [defaults objectForKey:@"traing12complete"], [defaults objectForKey:@"traing13complete"], [defaults objectForKey:@"traing14complete"], [defaults objectForKey:@"traing15complete"], [defaults objectForKey:@"traing16complete"], [defaults objectForKey:@"traing17complete"], [defaults objectForKey:@"traing18complete"], nil];
    NSLog(@"%@",[defaults objectForKey:@"traing1complete"]);
    statusLabels = [[NSMutableArray alloc] initWithObjects:@"Due in 0 days", @"Due in 1 days",@"Due in 2 days", @"Due in 3 days",@"Due in 4 days", @"Due in 5 days",@"Due in 6 days", @"Due in 7 days",@"Due in 8 days", @"Due in 9 days",@"Due in 10 days", @"Due in 11 days",@"Due in 12 days", @"Due in 13 days",@"Due in 14 days", @"Due in 15 days",@"Due in 16 days", @"Due in 17 days",nil];
    
    BOOL isHidden = YES;
    BOOL flag = NO;
    utilObj.checkBoxStatus = [[NSMutableArray alloc] init];
    for (int i=0; i<18; i++) {
        
        if([[utilObj.dueDatesArray objectAtIndex:i] isEqualToString:@"TT"])
        {
            if (i == 0) {
                
                [utilObj.checkBoxStatus addObject:[NSNumber numberWithBool:!isHidden]];
            }
            else
            {
                if (!flag) {
                    [utilObj.checkBoxStatus addObject:[NSNumber numberWithBool:isHidden]];
                }
                else
                {
                    [utilObj.checkBoxStatus addObject:[NSNumber numberWithBool:!isHidden]];
                    flag = !flag;
                }
            
            }
            
        }
        else
        {
        
            [utilObj.checkBoxStatus addObject:[NSNumber numberWithBool:!isHidden]];
            if (!flag) {
                flag = !flag;
            }
        
            
        }
        
    }
    
     day = 2;
   // NSInteger goalsCompleted = 0;
    for (NSInteger i = 0; i<18; i++) {
        
        //if (utilObj.dueDatesArray[i] == @" ")
        if([[utilObj.dueDatesArray objectAtIndex:i] isEqualToString:@"TT"])
        {
            
            if (day <= 6) {
                
                NSString* str = [[NSString alloc] initWithFormat:@"Due in %d days", day];
                [statusLabels replaceObjectAtIndex:i withObject:str];
                //statusLabels[i] = str;
            }
            else
            {
                
                NSString* str =  [[NSString alloc] initWithFormat:@"Due on %@",[formatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:day*86400]]];
                [statusLabels replaceObjectAtIndex:i withObject:str];
                
            }
            day = day+2;
           
        }
        else
        {
        
            [statusLabels replaceObjectAtIndex:i withObject:utilObj.dueDatesArray[i]];
          //  goalsCompleted = i+1;
           
        }
    }
    
    //[self renderProgressBar:goalsCompleted];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    NSInteger goalsCompleted = 0;
    NSString* str;
    for (NSInteger i = 0; i<18; i++) {
        str = [utilObj.dueDatesArray objectAtIndex:i];
        if ([str rangeOfString:@"Complete"].location != NSNotFound) 
        {
            
            goalsCompleted = i+1;
            
        }
    }
    
    [self renderProgressBar:goalsCompleted];
    

    
}
-(void)renderProgressBar:(NSInteger)goals
{

    float perc = (goals*100/18.0);
    //NSLog(@"%.2f",perc);
    NSString* percentageStr = [[NSString alloc] initWithFormat:@"%.f%%(%d out of 18)",perc, goals];
    barTitle.text = percentageStr;
    barFGImage.hidden = NO;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        if (perc == 100.00) {
            
            [barFGImage setFrame:CGRectMake(barFGImage.frame.origin.x, barFGImage.frame.origin.y, 276.0, barFGImage.frame.size.height)];
        }
        else
            [barFGImage setFrame:CGRectMake(barFGImage.frame.origin.x, barFGImage.frame.origin.y, 280*perc/100.0, barFGImage.frame.size.height)];
    }
    else {
        
        if (perc == 100.00) {
            
            [barFGImage setFrame:CGRectMake(barFGImage.frame.origin.x, barFGImage.frame.origin.y, 718.0, barFGImage.frame.size.height)];
        }
        else
            [barFGImage setFrame:CGRectMake(barFGImage.frame.origin.x, barFGImage.frame.origin.y, 728*perc/100.0, barFGImage.frame.size.height)];
        
    }

}
#pragma mark -
#pragma mark TableView Delegate Methods
#pragma mark -

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section
{
	return 18;
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
    UILabel* distanceLbl;
    checkBoxBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [checkBoxBtn setBackgroundImage:[UIImage imageNamed:@"check_normal.png"] forState:UIControlStateNormal];
       if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        titleText = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 180, 40)];
        statusText = [[UILabel alloc]initWithFrame:CGRectMake(10, 30, 200, 40)];
        distanceLbl = [[UILabel alloc]initWithFrame:CGRectMake(210, 15, 120, 40)];
        checkBoxBtn.frame = CGRectMake(50+10+100+120,(65-19)/2,30, 30);
    }
    else {
        
        titleText = [[UILabel alloc]initWithFrame:CGRectMake(20, 5, 180, 40)];
        statusText = [[UILabel alloc]initWithFrame:CGRectMake(20, 30, 200, 40)];
        distanceLbl = [[UILabel alloc]initWithFrame:CGRectMake(610, 15, 120, 40)];
        checkBoxBtn.frame = CGRectMake(700,15,45, 41);
    }
    NSString* tempStr = statusLabels[indexPath.row];
    //NSLog(@"%@ --- row number = %d",tempStr,indexPath.row);
    statusText.text = tempStr;

   
    [titleText setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [titleText  setFont:[UIFont boldSystemFontOfSize:22.0]];
    [titleText setBackgroundColor:[UIColor clearColor]];
    [cell.contentView addSubview:titleText];
    
    [statusText setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [statusText  setFont:[UIFont boldSystemFontOfSize:16.0]];
    statusText.tag = 100;
    [statusText setBackgroundColor:[UIColor clearColor]];
    
    [distanceLbl setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [distanceLbl  setFont:[UIFont boldSystemFontOfSize:20.0]];
    [distanceLbl setBackgroundColor:[UIColor clearColor]];
    [cell.contentView addSubview:distanceLbl];
    
    switch (indexPath.row)
    {
        case 0:
        {
            [titleText setText:@"Week 1, day 1"];
            [distanceLbl setText:[distanceArray objectAtIndex:0]];
            
        }
            break;
        case 1:
        {
            [titleText setText:@"Week 1, day 2"];
            [distanceLbl setText:[distanceArray objectAtIndex:1]];
                    
        }
            
            break;
        case 2:
        {
             [titleText setText:@"Week 1, day 3"];
            [distanceLbl setText:[distanceArray objectAtIndex:2]];
        
        }
            
            break;
            
        case 3:
        {
            [titleText setText:@"Week 2, day 1"];
            [distanceLbl setText:[distanceArray objectAtIndex:3]];
                        
        }
            
            break;
        case 4:
        {
            [titleText setText:@"Week 2, day 2"];
            [distanceLbl setText:[distanceArray objectAtIndex:4]];
            
        }
            break;
        case 5:
        {
            [titleText setText:@"Week 2, day 3"];
            [distanceLbl setText:[distanceArray objectAtIndex:5]];
                                  
        }
            break;
        case 6:
        {
            [titleText setText:@"Week 3, day 1"];
            [distanceLbl setText:[distanceArray objectAtIndex:6]];
        }
            break;

        case 7:
        {
            [titleText setText:@"Week 3, day 2"];
            [distanceLbl setText:[distanceArray objectAtIndex:7]];
                                 
        }
            
            break;
        case 8:
        {
            [titleText setText:@"Week 3, day 3"];
            [distanceLbl setText:[distanceArray objectAtIndex:8]];
                       
        }
            
            break;
        case 9:
        {
            [titleText setText:@"Week 4, day 1"];
            [distanceLbl setText:[distanceArray objectAtIndex:9]];
          
        }
            
            break;
        case 10:
        {
            [titleText setText:@"Week 4, day 2"];
            [distanceLbl setText:[distanceArray objectAtIndex:10]];
          
        }
            
            break;
        case 11:
        {
            [titleText setText:@"Week 4, day 3"];
            [distanceLbl setText:[distanceArray objectAtIndex:11]];
           
        }
            
            break;
        case 12:
        {
            [titleText setText:@"Week 5, day 1"];
            [distanceLbl setText:[distanceArray objectAtIndex:12]];
           
        }
            
            break;
        case 13:
        {
            [titleText setText:@"Week 5, day 2"];
            [distanceLbl setText:[distanceArray objectAtIndex:13]];
          
           
        }
            
            break;
        case 14:
        {
            [titleText setText:@"Week 5, day 3"];
            [distanceLbl setText:[distanceArray objectAtIndex:14]];
                    
        }
            
            break;
        case 15:
        {
            [titleText setText:@"Week 6, day 1"];
            [distanceLbl setText:[distanceArray objectAtIndex:15]];
           
        }
            
            break;
        case 16:
        {
            [titleText setText:@"Week 6, day 2"];
            [distanceLbl setText:[distanceArray objectAtIndex:16]];
                                   
        }
            
            break;
        case 17:
        {
           [titleText setText:@"Week 6, day 3"];
            [distanceLbl setText:[distanceArray objectAtIndex:17]];
           
        }
            
            break;
                   
        default:
            break;
    }
    [cell.contentView addSubview:statusText];

    [checkBoxBtn addTarget:self action:@selector(showAlert:) forControlEvents:UIControlEventTouchUpInside];
    checkBoxBtn.tag = indexPath.row;
    [cell.contentView addSubview:checkBoxBtn];
    
    checkBoxBtn.hidden = [[utilObj.checkBoxStatus objectAtIndex:indexPath.row] boolValue];
    
    //BOOL flag = [[utilObj.checkBoxStatus objectAtIndex:indexPath.row] boolValue];
    
    //NSLog(flag ? @"Yes" : @"No");
      
    NSString* str = [statusLabels objectAtIndex:indexPath.row];
    if ([str rangeOfString:@"Complete"].location != NSNotFound) {
        
        [checkBoxBtn setBackgroundImage:[UIImage imageNamed:@"check_select.png"] forState:UIControlStateNormal];
        statusText.textColor = [UIColor colorWithRed:243.0/255.0 green:134.0/255.0 blue:48.0/255.0 alpha:1.0];
        checkBoxBtn.userInteractionEnabled = NO;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

	return cell;
}

-(void) checkBoxAction: (UIButton *)sender 
{
   
    NSInteger i =sender.tag + 1;
    float perc = (i*100/18.0);
    //NSLog(@"%.2f",perc);
    NSString* percentageStr = [[NSString alloc] initWithFormat:@"%.f%%(%d out of 18)",perc, i];
    barTitle.text = percentageStr;
    barFGImage.hidden = NO;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        if (perc == 100.00) {
            
            [barFGImage setFrame:CGRectMake(barFGImage.frame.origin.x, barFGImage.frame.origin.y, 276.0, barFGImage.frame.size.height)];
        }
        else
            [barFGImage setFrame:CGRectMake(barFGImage.frame.origin.x, barFGImage.frame.origin.y, 280*perc/100, barFGImage.frame.size.height)];
    }
    else {
        
        if (perc == 100.00) {
            
            [barFGImage setFrame:CGRectMake(barFGImage.frame.origin.x, barFGImage.frame.origin.y, 718.0, barFGImage.frame.size.height)];
        }
        else
            [barFGImage setFrame:CGRectMake(barFGImage.frame.origin.x, barFGImage.frame.origin.y, 728*perc/100, barFGImage.frame.size.height)];
        
        }

   // UILabel *tempLabel = (UILabel *)[[button superview] viewWithTag:100];
    NSInteger temp = 0;
    NSString* comp;
    for (NSInteger i = 0; i<18; i++) {
        
        //if (utilObj.dueDatesArray[i] == @"")
         if([[utilObj.dueDatesArray objectAtIndex:i] isEqualToString:@"TT"])
        {
            comp = [[NSString alloc] initWithFormat:@"traing%dcomplete",i+1];
            NSString* str =  [[NSString alloc] initWithFormat:@"Completed on %@",[formatter stringFromDate:[NSDate date]]];
            [statusLabels replaceObjectAtIndex:i withObject:str];
            //
             NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults removeObjectForKey:comp];
            NSLog(@"user date %@", [defaults objectForKey:comp]);
            [defaults setObject:str forKey:comp];
            [defaults synchronize];
            NSLog(@"user date %@", [defaults objectForKey:comp]);
            [utilObj.dueDatesArray replaceObjectAtIndex:i withObject:str];
            temp = i+1;
            BOOL b = NO;
            if (temp<18) {
                
                [utilObj.checkBoxStatus replaceObjectAtIndex:temp withObject:[NSNumber numberWithBool:b]];
            }
            
            break;
        }
    }
    NSInteger dayTemp = 2;
    for (NSInteger i = temp; i<(18 - temp); i++) {
        
        if (dayTemp <= 6) {
            
            NSString* str = [[NSString alloc] initWithFormat:@"Due in %d days", dayTemp];
            [statusLabels replaceObjectAtIndex:i withObject:str];
            //[utilObj.dueDatesArray replaceObjectAtIndex:i withObject:str];
        }
        else
        {
            
            NSString* str =  [[NSString alloc] initWithFormat:@"Due on %@",[formatter stringFromDate:[NSDate dateWithTimeIntervalSinceNow:dayTemp*86400]]];
            [statusLabels replaceObjectAtIndex:i withObject:str];
            //[utilObj.dueDatesArray replaceObjectAtIndex:i withObject:str];
            
        }
        dayTemp = dayTemp +2;
    }
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
            twitFbObj = [[Twitter_FBViewController alloc] initWithNibName:@"Twitter_FBViewController" bundle:nil];
        }
        if(result.height == 568)
        {
           twitFbObj = [[Twitter_FBViewController alloc] initWithNibName:@"Twitter_FBViewController_iPhone5" bundle:nil];
        }
        
    }
    else {
        
         twitFbObj = [[Twitter_FBViewController alloc] initWithNibName:@"Twitter_FBViewController_iPad" bundle:nil];
    }

    twitFbObj.triningNumber = i;
    twitFbObj.distance = [distanceArray objectAtIndex:sender.tag];
     [self.view addSubview:twitFbObj.view];
    
    [tableView reloadData];
    
}

- (void) showAlert:(id)sender
{
    button = (UIButton *)sender;
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Do you really want to complete this training?" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles: @"No", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if(buttonIndex == 0)
    {
        [self checkBoxAction:button];
    }
}
#pragma mark -
#pragma mark TableView Data Source Methods
#pragma mark -

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 72;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
            triningViewCtrObj = [[TrainingViewController alloc] initWithNibName:@"TrainingViewController" bundle:nil];
        }
        if(result.height == 568)
        {
            triningViewCtrObj = [[TrainingViewController alloc] initWithNibName:@"TrainingViewController_iPhone5" bundle:nil];
        }
        
         
    
    }
    else {
        
         triningViewCtrObj = [[TrainingViewController alloc] initWithNibName:@"TrainingViewController_iPad" bundle:nil];
    }
    
    NSString* tempStr = statusLabels[indexPath.row];
    NSRange range = [tempStr rangeOfString:@"Completed"];
    NSString* dateStr;
    if (range.location != NSNotFound)
    {
       dateStr = [tempStr substringFromIndex:13];
    }
    else
    {
    
        switch (indexPath.row)
        {
            case 0:
            {
                dateStr = @"Week 1, day 1";

            }
                break;
            case 1:
            {
                dateStr = @"Week 1, day 2";
                
            }
                
                break;
            case 2:
            {
                dateStr = @"Week 1, day 3";
                
            }
                
                break;
                
            case 3:
            {
                dateStr = @"Week 2, day 1";                
            }
                
                break;
            case 4:
            {
                dateStr = @"Week 2, day 2";
                
            }
                break;
            case 5:
            {
                dateStr = @"Week 2, day 3";
                
            }
                break;
            case 6:
            {
                dateStr = @"Week 3, day 1";
            }
                break;
                
            case 7:
            {
                dateStr = @"Week 3, day 2";
                
            }
                
                break;
            case 8:
            {
                dateStr = @"Week 3, day 3";
                
            }
                
                break;
            case 9:
            {
                dateStr = @"Week 4, day 1";
                
            }
                
                break;
            case 10:
            {
                dateStr = @"Week 4, day 2";
                
            }
                
                break;
            case 11:
            {
                dateStr = @"Week 4, day 3";
                
            }
                
                break;
            case 12:
            {
                dateStr = @"Week 5, day 1";
                
            }
                
                break;
            case 13:
            {
                dateStr = @"Week 5, day 2";                
                
            }
                
                break;
            case 14:
            {
                dateStr = @"Week 5,  day 3";
                
            }
                
                break;
            case 15:
            {
                dateStr = @"Week 6, day 1";
                
            }
                
                break;
            case 16:
            {
                dateStr = @"Week 6, day 2";
                
            }
                
                break;
            case 17:
            {
                dateStr = @"Week 6, day 3";
                
            }
                
                break;
                
            default:
                break;
        }

    }
    triningViewCtrObj.headerLbl = dateStr;
    triningViewCtrObj.row = indexPath.row;
    [self.view addSubview:triningViewCtrObj.view];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goalAction:(id)sender {
}

- (IBAction)tipsAction:(id)sender {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
            tipsViewCtrObj = [[TipsViewController alloc] initWithNibName:@"TipsViewController" bundle:nil];
        }
        if(result.height == 568)
        {
            tipsViewCtrObj = [[TipsViewController alloc] initWithNibName:@"TipsViewController_iPhone5" bundle:nil];
        }
        
    }
    else {
        
        tipsViewCtrObj = [[TipsViewController alloc] initWithNibName:@"TipsViewController_iPad" bundle:nil];
    }
    
    
    [self.view addSubview:tipsViewCtrObj.view];
    
}
@end
