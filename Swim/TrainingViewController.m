//
//  TrainingViewController.m
//  Swim
//
//  Created by Madept on 21/11/12.
//  Copyright (c) 2012 Madept. All rights reserved.
//

#import "TrainingViewController.h"

@interface TrainingViewController ()

@end

@implementation TrainingViewController
@synthesize headerLbl, row;

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
    dateLbl.text = headerLbl;
    isArrowBtn0Selected = NO;
    isArrowBtn1Selected = NO;
    isArrowBtn2Selected = NO;
    isArrowBtn3Selected = NO;
    
    isExtraRow = row == 3 ||row == 4 || row == 5 || row == 6 || row == 7 || row == 8 || row == 9 || row == 10 || row == 11;
    
    tableHeaderView.backgroundColor = [UIColor colorWithRed:105/255.0 green:210/255.0 blue:231/255.0 alpha:1.0];
    headerZero = [[UIView alloc] init];
    headerTwo = [[UIView alloc] init];
    headerThree = [[UIView alloc] init];
    slideViewZero = [[UIView alloc] init];
    slideViewTwo = [[UIView alloc] init];
    slideViewThree = [[UIView alloc] init];
    
    headerZero.userInteractionEnabled = YES;
    headerOne.userInteractionEnabled = YES;
    headerTwo.userInteractionEnabled = YES;
    headerThree.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tap0 = [[UITapGestureRecognizer alloc]
                                    initWithTarget:self
                                    action:@selector(slideAction0:)];
    
    [headerZero addGestureRecognizer:tap0];
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(slideAction1:)];
    
    [headerOne addGestureRecognizer:tap1];
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]
                                    initWithTarget:self
                                    action:@selector(slideAction2:)];
    
    [headerTwo addGestureRecognizer:tap2];
    
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc]
                                    initWithTarget:self
                                    action:@selector(slideAction3:)];
    
    [headerThree addGestureRecognizer:tap3];
    UILabel* lengthLbl;
    UILabel* restLbl;
    UILabel* activityLbl;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        lengthLbl = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 180, 40)];
        restLbl = [[UILabel alloc]initWithFrame:CGRectMake(130, 5, 180, 40)];
        activityLbl = [[UILabel alloc]initWithFrame:CGRectMake(240, 5, 180, 40)];
        
        if (isExtraRow) {
            
            [headerZero setFrame:CGRectMake(0, 0, 320, 68)];
            [headerOne setFrame:CGRectMake(0, 69, 320, 68)];
            [headerTwo setFrame:CGRectMake(0, 138, 320, 68)];
            [headerThree setFrame:CGRectMake(0, 138+68, 320, 68)];
            [slideViewZero setFrame:CGRectMake(0, 69, 320, 30)];
            if (row == 6 || row == 7 || row == 8) {
                [slideViewOne setFrame:CGRectMake(0, 138, 320, 30)];
            }
            else
            [slideViewOne setFrame:CGRectMake(0, 138, 320, 118)];
            //[slideViewTwo setFrame:CGRectMake(0, 138 + 68, 320, 118)];
            [slideViewTwo setFrame:CGRectMake(0, 138 + 68+68, 320, 118)];
            
        }
        else
        {
            [headerTwo setFrame:CGRectMake(0, 69, 320, 68)];
            [headerThree setFrame:CGRectMake(0, 138, 320, 68)];
            [slideViewTwo setFrame:CGRectMake(0, 138, 320, 118)];
            [slideViewThree setFrame:CGRectMake(0, 138 + 68, 320, 50)];
        }
        
    }
    else {
        
        lengthLbl = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 180, 40)];
        restLbl = [[UILabel alloc]initWithFrame:CGRectMake(380, 10, 180, 40)];
        activityLbl = [[UILabel alloc]initWithFrame:CGRectMake(670, 10, 180, 40)];
        
        if (isExtraRow) {
            
            [headerZero setFrame:CGRectMake(0, 0, 768, 68)];
            [headerOne setFrame:CGRectMake(0, 69, 768, 68)];
            [headerTwo setFrame:CGRectMake(0, 69 + 68, 768, 68)];
            [headerThree setFrame:CGRectMake(0, 138 + 68, 768, 68)];
            [slideViewZero setFrame:CGRectMake(0, 68, 768, 50)];
             if (row == 6 || row == 7 || row == 8) {
                  [slideViewOne setFrame:CGRectMake(0, 68+ 68, 768, 118)];
             }
            [slideViewOne setFrame:CGRectMake(0, 68+ 68, 768, 50)];
            [slideViewTwo setFrame:CGRectMake(0, 138+ 68, 768, 118)];
            [slideViewThree setFrame:CGRectMake(0, 138 + 68+ 68, 768, 118)];
        }
        else
        {
            [headerTwo setFrame:CGRectMake(0, 69, 768, 68)];
            [headerThree setFrame:CGRectMake(0, 138, 768, 68)];
            [slideViewTwo setFrame:CGRectMake(0, 138, 768, 118)];
            [slideViewThree setFrame:CGRectMake(0, 138 + 68, 768, 118)];
            
        }
    }
    
    [lengthLbl setTextColor:[UIColor colorWithRed:50.0/255.0 green:90.0/255.0 blue:116.0/255.0 alpha:1.0]];
    [lengthLbl setText:@"Legth"];
    [lengthLbl  setFont:[UIFont boldSystemFontOfSize:20.0]];
    [lengthLbl setBackgroundColor:[UIColor clearColor]];
    [tableHeaderView addSubview:lengthLbl];
    
    [restLbl setTextColor:[UIColor colorWithRed:50.0/255.0 green:90.0/255.0 blue:116.0/255.0 alpha:1.0]];
    [restLbl setText:@"Rest"];
    [restLbl  setFont:[UIFont boldSystemFontOfSize:20.0]];
    [restLbl setBackgroundColor:[UIColor clearColor]];
    [tableHeaderView addSubview:restLbl];
    
    [activityLbl setTextColor:[UIColor colorWithRed:50.0/255.0 green:90.0/255.0 blue:116.0/255.0 alpha:1.0]];
    [activityLbl setText:@"Activity"];
    [activityLbl  setFont:[UIFont boldSystemFontOfSize:20.0]];
    [activityLbl setBackgroundColor:[UIColor clearColor]];
    [tableHeaderView addSubview:activityLbl];
    
    [scrollView addSubview:headerZero];
    headerZero.backgroundColor = [UIColor clearColor];
    
    [scrollView addSubview:headerTwo];
    headerTwo.backgroundColor = [UIColor clearColor];
    
    [scrollView addSubview:headerThree];
    headerThree.backgroundColor = [UIColor clearColor];
    
    [scrollView addSubview:slideViewZero];
    slideViewZero.backgroundColor = [UIColor clearColor];
    
    [scrollView addSubview:slideViewTwo];
    slideViewTwo.backgroundColor = [UIColor clearColor];

    [scrollView addSubview:slideViewThree];
    slideViewThree.backgroundColor = [UIColor clearColor];

    if (isExtraRow)
    {
        [self renderExtraRow];
        [self renderExtraSlide];
    }
    
    [self renderFirstRow];
    [self renderFirstSlide];
    if (row!= 17) {
        
        [self renderSecondRow];
        [self renderThirdRow];
        
        
        [self renderSecondSlide];
        [self renderThirdSlide];
    }
   
    dateLbl.textColor = [UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0];
    
    //[scrollView scrollRectToVisible:CGRectMake(0, 0, scrollView.frame.size.width, scrollView.frame.size.height) animated:YES];
	[scrollView setContentSize:CGSizeMake(300,400)];
    
}

-(void) renderExtraRow
{

    UILabel* titleText1;
    arrowBtn0 = [UIButton buttonWithType:UIButtonTypeCustom];
    UILabel* distanceLbl1;
    UILabel* typeLbl1 ;
    UILabel* totalLbl1;
    UILabel* restLbl1;
    UILabel* typeSubLbl1;
    UILabel* totalSubLbl1;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        titleText1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 15, 180, 40)];
        arrowBtn0.frame = CGRectMake(50,(65-19)/2,31, 31);
        distanceLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(100, 3, 120, 40)];
        typeLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(170, 3, 120, 40)];
        totalLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(270, 3, 120, 40)];
        restLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(100, 25, 120, 40)];
        typeSubLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(170, 25, 120, 40)];
        totalSubLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(270, 25, 120, 40)];
    }
    else {
        
        titleText1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 15, 180, 40)];
        arrowBtn0.frame = CGRectMake(70,(65-19)/2,31, 31);
        distanceLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(340, 3, 120, 40)];
        typeLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(410, 3, 120, 40)];
        totalLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(690, 3, 120, 40)];
        restLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(340, 25, 120, 40)];
        typeSubLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(410, 25, 120, 40)];
        totalSubLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(690, 25, 120, 40)];
        
        
    }
    
    
    [titleText1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [titleText1 setText:@"1x"];
    [titleText1  setFont:[UIFont boldSystemFontOfSize:26.0]];
    [titleText1 setBackgroundColor:[UIColor clearColor]];
    [headerZero addSubview:titleText1];
    
    [arrowBtn0 setBackgroundImage:[UIImage imageNamed:@"arrow_up.png"] forState:UIControlStateNormal];
    [arrowBtn0 addTarget:self action:@selector(slideAction0:) forControlEvents:UIControlEventTouchUpInside];
    [headerZero addSubview:arrowBtn0];
    
    [distanceLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [distanceLbl1  setFont:[UIFont boldSystemFontOfSize:20.0]];
    if (row == 6 || row == 7 || row == 8) {
        
        [distanceLbl1 setText:@"400 m"];
    }
    else if (row == 9 || row == 10 || row == 11) {
        
        [distanceLbl1 setText:@"600 m"];
    }
    else
    [distanceLbl1 setText:@"200 m"];
    [distanceLbl1 setBackgroundColor:[UIColor clearColor]];
    [headerZero addSubview:distanceLbl1];
    
    [typeLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [typeLbl1  setFont:[UIFont boldSystemFontOfSize:20.0]];
    [typeLbl1 setText:@"Crawl"];
    [typeLbl1 setBackgroundColor:[UIColor clearColor]];
    [headerZero addSubview:typeLbl1];
    
    [totalLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [totalLbl1  setFont:[UIFont systemFontOfSize:20.0]];
    [totalLbl1 setText:@"Total"];
    [totalLbl1 setBackgroundColor:[UIColor clearColor]];
    [headerZero addSubview:totalLbl1];
    
    [restLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [restLbl1  setFont:[UIFont systemFontOfSize:16.0]];
    if (row == 9 || row == 10 || row == 11) {
        
        [restLbl1 setText:@"Rest: 10"];
    }
    else
    [restLbl1 setText:@"Rest: 12"];
    [restLbl1 setBackgroundColor:[UIColor clearColor]];
    [headerZero addSubview:restLbl1];
    
    [typeSubLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [typeSubLbl1  setFont:[UIFont systemFontOfSize:16.0]];
    [typeSubLbl1 setText:@"breaths"];
    [typeSubLbl1 setBackgroundColor:[UIColor clearColor]];
    [headerZero addSubview:typeSubLbl1];
    
    [totalSubLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [totalSubLbl1  setFont:[UIFont boldSystemFontOfSize:20.0]];
    if (row == 6 || row == 7 || row == 8) {
        
        [totalSubLbl1 setText:@"400"];
    }
    else if (row == 9 || row == 10 || row == 11) {
        
        [totalSubLbl1 setText:@"600"];
    }

    else
    [totalSubLbl1 setText:@"200"];
    [totalSubLbl1 setBackgroundColor:[UIColor clearColor]];
    [headerZero addSubview:totalSubLbl1];
    
    UIImageView* divider = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider.png"]];
    divider.frame = CGRectMake(0,62,768, 2);
    [headerZero addSubview:divider];


    
}
-(void) renderFirstRow
{
    UILabel* titleText1;
    arrowBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    UILabel* distanceLbl1;
    UILabel* typeLbl1 ;
    UILabel* totalLbl1;
    UILabel* restLbl1;
    UILabel* typeSubLbl1;
    UILabel* totalSubLbl1;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        titleText1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 15, 180, 40)];
        arrowBtn1.frame = CGRectMake(50,(65-19)/2,31, 31);
        distanceLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(100, 3, 120, 40)];
        typeLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(170, 3, 120, 40)];
        totalLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(270, 3, 120, 40)];
        restLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(100, 25, 120, 40)];
        typeSubLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(170, 25, 120, 40)];
        totalSubLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(270, 25, 120, 40)];
    }
    else {
        
        titleText1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 15, 180, 40)];
        arrowBtn1.frame = CGRectMake(70,(65-19)/2,31, 31);
        distanceLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(340, 3, 120, 40)];
        typeLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(410, 3, 120, 40)];
        totalLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(690, 3, 120, 40)];
        restLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(340, 25, 120, 40)];
        typeSubLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(410, 25, 120, 40)];
        totalSubLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(690, 25, 120, 40)];
        
        
    }
    
    
    [titleText1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
     if (!(row == 0 || row == 1 || row == 2 ||row ==3 || row == 4 || row == 5)) {
         [titleText1 setText:@"1x"];
     }
    else
    [titleText1 setText:@"4x"];
    [titleText1  setFont:[UIFont boldSystemFontOfSize:26.0]];
    [titleText1 setBackgroundColor:[UIColor clearColor]];
    [headerOne addSubview:titleText1];
    
    [arrowBtn1 setBackgroundImage:[UIImage imageNamed:@"arrow_up.png"] forState:UIControlStateNormal];
    [arrowBtn1 addTarget:self action:@selector(slideAction1:) forControlEvents:UIControlEventTouchUpInside];
    [headerOne addSubview:arrowBtn1];
    
    [distanceLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [distanceLbl1  setFont:[UIFont boldSystemFontOfSize:20.0]];
    if (row == 6 || row == 7 || row == 8) {
        [distanceLbl1 setText:@"200 m"];
    }
    else if (row == 9 || row == 10 || row == 11) {
        
        [distanceLbl1 setText:@"300 m"];
    }
    else if (row == 12 || row == 13 || row == 14) {
        
        [distanceLbl1 setText:@"1000 m"];
    }
    else if (row == 15 || row == 16) {
        
        [distanceLbl1 setText:@"1200 m"];
    }
    else if (row == 17)
    {
    
         [distanceLbl1 setText:@"1650 m"];
    }

    else
    [distanceLbl1 setText:@"100 m"];
    [distanceLbl1 setBackgroundColor:[UIColor clearColor]];
    [headerOne addSubview:distanceLbl1];
    
    [typeLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [typeLbl1  setFont:[UIFont boldSystemFontOfSize:20.0]];
    [typeLbl1 setText:@"Crawl"];
    [typeLbl1 setBackgroundColor:[UIColor clearColor]];
    [headerOne addSubview:typeLbl1];
    
    [totalLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [totalLbl1  setFont:[UIFont systemFontOfSize:20.0]];
    [totalLbl1 setText:@"Total"];
    [totalLbl1 setBackgroundColor:[UIColor clearColor]];
    [headerOne addSubview:totalLbl1];
    
    [restLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [restLbl1  setFont:[UIFont systemFontOfSize:16.0]];
    if (isExtraRow) {
         if (row == 9 || row == 10 || row == 11) {
            
           [restLbl1 setText:@"Rest: 8"];
        }
        else
        [restLbl1 setText:@"Rest: 10"];
    }
    else if (row == 12 || row == 13 || row == 14) {
            [restLbl1 setText:@"Rest: 8"];
        }
    else if (row == 15 || row == 16) {
        
        [restLbl1 setText:@"Rest: 6"];
    }
    else if (row == 17)
    {
    
        [restLbl1 setText:@"Rest: 0"];
    }
    else
    [restLbl1 setText:@"Rest: 12"];
    [restLbl1 setBackgroundColor:[UIColor clearColor]];
    [headerOne addSubview:restLbl1];
    
    [typeSubLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [typeSubLbl1  setFont:[UIFont systemFontOfSize:16.0]];
    [typeSubLbl1 setText:@"breaths"];
    [typeSubLbl1 setBackgroundColor:[UIColor clearColor]];
    [headerOne addSubview:typeSubLbl1];
    
    [totalSubLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [totalSubLbl1  setFont:[UIFont boldSystemFontOfSize:20.0]];
    if (row == 6 || row == 7 || row == 8) {
        [totalSubLbl1 setText:@"200"];
    }
    else if (row == 9 || row == 10 || row == 11) {
        
        [totalSubLbl1 setText:@"300"];
    }
    else if (row == 12 || row == 13 || row == 14) {
        
        [totalSubLbl1 setText:@"1000"];
    }
    else if (row == 15 || row == 16 ) {
        
        [totalSubLbl1 setText:@"1200"];
    }
    else if (row == 17)
    {
        [totalSubLbl1 setText:@"1650"];
    }
    else
    [totalSubLbl1 setText:@"400"];
    [totalSubLbl1 setBackgroundColor:[UIColor clearColor]];
    [headerOne addSubview:totalSubLbl1];
    
}

-(void)renderSecondRow
{
    UILabel* titleText1;
    arrowBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    UILabel* distanceLbl1;
    UILabel* typeLbl1 ;
    UILabel* totalLbl1;
    UILabel* restLbl1;
    UILabel* typeSubLbl1;
    UILabel* totalSubLbl1;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        titleText1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 15, 180, 40)];
        arrowBtn2.frame = CGRectMake(50,(65-19)/2,31, 31);
        distanceLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(100, 3, 120, 40)];
        typeLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(170, 3, 120, 40)];
        totalLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(270, 3, 120, 40)];
        restLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(100, 25, 120, 40)];
        typeSubLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(170, 25, 120, 40)];
        totalSubLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(270, 25, 120, 40)];
    }
    else {
        
        titleText1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 15, 180, 40)];
        arrowBtn2.frame = CGRectMake(70,(65-19)/2,31, 31);
        distanceLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(340, 3, 120, 40)];
        typeLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(410, 3, 120, 40)];
        totalLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(690, 3, 120, 40)];
        restLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(340, 25, 120, 40)];
        typeSubLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(410, 25, 120, 40)];
        totalSubLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(690, 25, 120, 40)];
        
    }
    [titleText1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    if (row == 15 || row == 16 || row == 17) {
        
        [titleText1 setText:@"3x"];
    } else
    [titleText1 setText:@"4x"];
    [titleText1  setFont:[UIFont boldSystemFontOfSize:26.0]];
    [titleText1 setBackgroundColor:[UIColor clearColor]];
    [headerTwo addSubview:titleText1];
    
    [arrowBtn2 setBackgroundImage:[UIImage imageNamed:@"arrow_up.png"] forState:UIControlStateNormal];
    [arrowBtn2 addTarget:self action:@selector(slideAction2:) forControlEvents:UIControlEventTouchUpInside];
    [headerTwo addSubview:arrowBtn2];
    
    [distanceLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [distanceLbl1  setFont:[UIFont boldSystemFontOfSize:20.0]];
    if (!(row == 0 || row == 1 || row == 2||row == 3 || row == 4 || row == 5)) {
        [distanceLbl1 setText:@"100 m"];
    }
    else
    [distanceLbl1 setText:@"50 m"];
    [distanceLbl1 setBackgroundColor:[UIColor clearColor]];
    [headerTwo addSubview:distanceLbl1];
    
    [typeLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [typeLbl1  setFont:[UIFont boldSystemFontOfSize:20.0]];
    [typeLbl1 setText:@"Crawl"];
    [typeLbl1 setBackgroundColor:[UIColor clearColor]];
    [headerTwo addSubview:typeLbl1];
    
    [totalLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [totalLbl1  setFont:[UIFont systemFontOfSize:20.0]];
    [totalLbl1 setText:@"Total"];
    [totalLbl1 setBackgroundColor:[UIColor clearColor]];
    [headerTwo addSubview:totalLbl1];
    
    [restLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [restLbl1  setFont:[UIFont systemFontOfSize:16.0]];
    if (row == 3 || row == 4 || row == 5 ||row == 9 || row == 10 || row == 11) {
        
        [restLbl1 setText:@"Rest: 6"];
    }
    else if (row == 12 || row == 13 || row == 14) {
        
         [restLbl1 setText:@"Rest: 4"];
    }
    else if (row == 15 || row == 16 || row == 17)  {
        
        [restLbl1 setText:@"Rest: 4"];
    }
    else
    [restLbl1 setText:@"Rest: 8"];
    [restLbl1 setBackgroundColor:[UIColor clearColor]];
    [headerTwo addSubview:restLbl1];
    
    [typeSubLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [typeSubLbl1  setFont:[UIFont systemFontOfSize:16.0]];
    [typeSubLbl1 setText:@"breaths"];
    [typeSubLbl1 setBackgroundColor:[UIColor clearColor]];
    [headerTwo addSubview:typeSubLbl1];
    
    [totalSubLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [totalSubLbl1  setFont:[UIFont boldSystemFontOfSize:20.0]];
    if (!(row == 0 || row == 1 || row == 2||row == 3 || row == 4 || row == 5)) {
       [totalSubLbl1 setText:@"400"];
    }
    else
        [totalSubLbl1 setText:@"200"];
    if (row == 15 || row == 16 || row == 17)  {
        
        [totalSubLbl1 setText:@"300"];
    }

    
    [totalSubLbl1 setBackgroundColor:[UIColor clearColor]];
    [headerTwo addSubview:totalSubLbl1];
    
    UIImageView* divider = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider.png"]];
    divider.frame = CGRectMake(0,62,768, 2);
    [headerTwo addSubview:divider];
}

-(void)renderThirdRow
{
    UILabel* titleText1;
    arrowBtn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    UILabel* distanceLbl1;
    UILabel* typeLbl1 ;
    UILabel* totalLbl1;
    UILabel* restLbl1;
    UILabel* typeSubLbl1;
    UILabel* totalSubLbl1;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        titleText1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 15, 180, 40)];
        arrowBtn3.frame = CGRectMake(50,(65-19)/2,31, 31);
        distanceLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(100, 3, 120, 40)];
        typeLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(170, 3, 120, 40)];
        totalLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(270, 3, 120, 40)];
        restLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(100, 25, 120, 40)];
        typeSubLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(170, 25, 120, 40)];
        totalSubLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(270, 25, 120, 40)];
    }
    else {
        
        titleText1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 15, 180, 40)];
        arrowBtn3.frame = CGRectMake(70,(65-19)/2,31, 31);
        distanceLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(340, 3, 120, 40)];
        typeLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(410, 3, 120, 40)];
        totalLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(690, 3, 120, 40)];
        restLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(340, 25, 120, 40)];
        typeSubLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(410, 25, 120, 40)];
        totalSubLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(690, 25, 120, 40)];
        
        
    }
    
    [titleText1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    if (row == 15 || row == 16 || row == 17)  {
        
        [titleText1 setText:@"3x"];
    }else
    [titleText1 setText:@"4x"];
    [titleText1  setFont:[UIFont boldSystemFontOfSize:26.0]];
    [titleText1 setBackgroundColor:[UIColor clearColor]];
    [headerThree addSubview:titleText1];
    
    [arrowBtn3 setBackgroundImage:[UIImage imageNamed:@"arrow_up.png"] forState:UIControlStateNormal];
    [arrowBtn3 addTarget:self action:@selector(slideAction3:) forControlEvents:UIControlEventTouchUpInside];
    [headerThree addSubview:arrowBtn3];
    

    [distanceLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [distanceLbl1  setFont:[UIFont boldSystemFontOfSize:20.0]];
    if (!(row == 0 || row == 1 || row == 2||row == 3 || row == 4 || row == 5)) {
        [distanceLbl1 setText:@"50 m"];
    }
    else
    [distanceLbl1 setText:@"25 m"];
    [distanceLbl1 setBackgroundColor:[UIColor clearColor]];
    [headerThree addSubview:distanceLbl1];
    
    [typeLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [typeLbl1  setFont:[UIFont boldSystemFontOfSize:20.0]];
    [typeLbl1 setText:@"Crawl"];
    [typeLbl1 setBackgroundColor:[UIColor clearColor]];
    [headerThree addSubview:typeLbl1];
    
    [totalLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [totalLbl1  setFont:[UIFont systemFontOfSize:20.0]];
    [totalLbl1 setText:@"Total"];
    [totalLbl1 setBackgroundColor:[UIColor clearColor]];
    [headerThree addSubview:totalLbl1];
    
    [restLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [restLbl1  setFont:[UIFont systemFontOfSize:16.0]];
    [restLbl1 setText:@"Rest: 4"];
    [restLbl1 setBackgroundColor:[UIColor clearColor]];
    [headerThree addSubview:restLbl1];
    
    [typeSubLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [typeSubLbl1  setFont:[UIFont systemFontOfSize:16.0]];
    [typeSubLbl1 setText:@"breaths"];
    [typeSubLbl1 setBackgroundColor:[UIColor clearColor]];
    [headerThree addSubview:typeSubLbl1];
    
    [totalSubLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [totalSubLbl1  setFont:[UIFont boldSystemFontOfSize:20.0]];
    if (!(row == 0 || row == 1 || row == 2||row == 3 || row == 4 || row == 5)) {
        [totalSubLbl1 setText:@"200"];
    }
    else
        [totalSubLbl1 setText:@"100"];
     if (row == 15 || row == 16 || row == 17)  {
        
        [totalSubLbl1 setText:@"150"];
    }
   
    [totalSubLbl1 setBackgroundColor:[UIColor clearColor]];
    [headerThree addSubview:totalSubLbl1];
    
    UIImageView* divider = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider.png"]];
    divider.frame = CGRectMake(0,62,768, 2);
    [headerThree addSubview:divider];

    
}

-(void) renderExtraSlide
{
    
    UILabel* distanceLbl1;
    UILabel* typeLbl1;
    UILabel* totalLbl1;

    UIImageView* divider1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider.png"]];
    [slideViewZero addSubview:divider1];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        distanceLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 3, 120, 20)];
        typeLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(130, 3, 120, 20)];
        totalLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(265, 3, 120, 20)];
        
        divider1.frame = CGRectMake(0,27,320, 1.5);
        
    }
    else {
        
        distanceLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 3, 120, 20)];
        typeLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(360, 3, 120, 20)];
        totalLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(690, 3, 120, 20)];
       
        divider1.frame = CGRectMake(0,27,768, 1.5);
        
    }
    
    
    [distanceLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [distanceLbl1  setFont:[UIFont boldSystemFontOfSize:16.0]];
    if (row == 6 || row == 7 || row == 8) {
        [distanceLbl1 setText:@"400 m"];
    }
    else if (row == 9 || row == 10 || row == 11) {
        [distanceLbl1 setText:@"600 m"];
    }
    else
        [distanceLbl1 setText:@"200 m"];
    [distanceLbl1 setBackgroundColor:[UIColor clearColor]];
    [slideViewZero addSubview:distanceLbl1];
    
    [typeLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [typeLbl1  setFont:[UIFont boldSystemFontOfSize:16.0]];
    if (row == 9 || row == 10 || row == 11) {
        [typeLbl1 setText:@"10 breaths"];
    }
    else
    [typeLbl1 setText:@"12 breaths"];
    [typeLbl1 setBackgroundColor:[UIColor clearColor]];
    [slideViewZero addSubview:typeLbl1];
    
    [totalLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [totalLbl1  setFont:[UIFont boldSystemFontOfSize:16.0]];
    [totalLbl1 setText:@"Crawl"];
    [totalLbl1 setBackgroundColor:[UIColor clearColor]];
    [slideViewZero addSubview:totalLbl1];
    
    slideViewZero.hidden = YES;
    
}

-(void) renderFirstSlide
{

    UILabel* distanceLbl1;
     UILabel* typeLbl1;
     UILabel* totalLbl1;
    UILabel* distanceLbl2;
    UILabel* typeLbl2;
    UILabel* totalLbl2;
    UILabel* distanceLbl3;
    UILabel* typeLbl3;
    UILabel* totalLbl3;
    UILabel* distanceLbl4;
    UILabel* typeLbl4;
    UILabel* totalLbl4;
    UIImageView* divider2;
    UIImageView* divider3;
    UIImageView* divider4;
    UIImageView* divider1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider.png"]];
    [slideViewOne addSubview:divider1];
    if  (row == 0 || row == 1 || row == 2 || row == 3 || row == 4 || row == 5) {
        divider2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider.png"]];
        [slideViewOne addSubview:divider2];
        divider3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider.png"]];
        [slideViewOne addSubview:divider3];
        divider4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider.png"]];
        [slideViewOne addSubview:divider4];
    }

    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        distanceLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 3, 120, 20)];
        typeLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(130, 3, 120, 20)];
        totalLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(265, 3, 120, 20)];
        if (row == 0 || row == 1 || row == 2 || row == 3 || row == 4 || row == 5)
        {
            distanceLbl2 = [[UILabel alloc]initWithFrame:CGRectMake(10, 33, 120, 20)];
            typeLbl2 = [[UILabel alloc]initWithFrame:CGRectMake(130, 33, 120, 20)];
            totalLbl2 = [[UILabel alloc]initWithFrame:CGRectMake(265, 33, 120, 20)];
            distanceLbl3 = [[UILabel alloc]initWithFrame:CGRectMake(10, 63, 120, 20)];
            typeLbl3 = [[UILabel alloc]initWithFrame:CGRectMake(130, 63, 120, 20)];
            totalLbl3 = [[UILabel alloc]initWithFrame:CGRectMake(265, 63, 120, 20)];
            distanceLbl4 = [[UILabel alloc]initWithFrame:CGRectMake(10, 93, 120, 20)];
            typeLbl4 = [[UILabel alloc]initWithFrame:CGRectMake(130, 93, 120, 20)];
            totalLbl4 = [[UILabel alloc]initWithFrame:CGRectMake(265, 93, 120, 20)];
            
            divider2.frame = CGRectMake(0,57,320, 1.5);
            divider3.frame = CGRectMake(0,87,320, 1.5);
            divider4.frame = CGRectMake(0,117,320, 1.5);

        }
         divider1.frame = CGRectMake(0,27,320, 1.5);
        }
    else {
        
        distanceLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 3, 120, 20)];
        typeLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(360, 3, 120, 20)];
        totalLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(690, 3, 120, 20)];
        if (row == 0 || row == 1 || row == 2 || row == 3 || row == 4 || row == 5)
        {
            
            distanceLbl2 = [[UILabel alloc]initWithFrame:CGRectMake(20, 33, 120, 20)];
            typeLbl2 = [[UILabel alloc]initWithFrame:CGRectMake(360, 33, 120, 20)];
            totalLbl2 = [[UILabel alloc]initWithFrame:CGRectMake(690, 33, 120, 20)];
            distanceLbl3 = [[UILabel alloc]initWithFrame:CGRectMake(20, 63, 120, 20)];
            typeLbl3 = [[UILabel alloc]initWithFrame:CGRectMake(360, 63, 120, 20)];
            totalLbl3 = [[UILabel alloc]initWithFrame:CGRectMake(690, 63, 120, 20)];
            distanceLbl4 = [[UILabel alloc]initWithFrame:CGRectMake(20, 93, 120, 20)];
            typeLbl4 = [[UILabel alloc]initWithFrame:CGRectMake(360, 93, 120, 20)];
            totalLbl4 = [[UILabel alloc]initWithFrame:CGRectMake(690, 93, 120, 20)];
            
            divider2.frame = CGRectMake(0,57,768, 1.5);
            divider3.frame = CGRectMake(0,87,768, 1.5);
            divider4.frame = CGRectMake(0,117,768, 1.5);
        }
        divider1.frame = CGRectMake(0,27,768, 1.5);
        
    }
    
    
    [distanceLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [distanceLbl1  setFont:[UIFont boldSystemFontOfSize:16.0]];
    if (row == 6 || row == 7 || row == 8)
    {
        [distanceLbl1 setText:@"200 m"];
    }
    else if (row == 9 || row == 10 || row == 11) {
        [distanceLbl1 setText:@"300 m"];
    }
     else if (row == 12 || row == 13 || row == 14) {
         
         [distanceLbl1 setText:@"1000 m"];
     }
     else if (row == 15 || row == 16)  {
         
         [distanceLbl1 setText:@"1200 m"];
     }
    else if (row == 17)
    {
    
         [distanceLbl1 setText:@"1650 m"];
    }
    else
    [distanceLbl1 setText:@"100 m"];
    [distanceLbl1 setBackgroundColor:[UIColor clearColor]];
    [slideViewOne addSubview:distanceLbl1];
    
    [typeLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [typeLbl1  setFont:[UIFont boldSystemFontOfSize:16.0]];
    if(row == 3 || row == 4 || row == 5||row == 6 || row == 7 || row == 8)
    {
    
        [typeLbl1 setText:@"10 breaths"];
    }
    else if (row == 9 || row == 10 || row == 11 || row == 12 || row == 13 || row == 14) {
        [typeLbl1 setText:@"8 breaths"];
    }
    else if (row == 15 || row == 16 || row == 17)  {
        
        [typeLbl1 setText:@"0 breaths"];
    }
    else
    [typeLbl1 setText:@"12 breaths"];
    [typeLbl1 setBackgroundColor:[UIColor clearColor]];
     [slideViewOne addSubview:typeLbl1];
    
    [totalLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [totalLbl1  setFont:[UIFont boldSystemFontOfSize:16.0]];
    [totalLbl1 setText:@"Crawl"];
    [totalLbl1 setBackgroundColor:[UIColor clearColor]];
    [slideViewOne addSubview:totalLbl1];
    if  (row == 0 || row == 1 || row == 2 || row == 3 || row == 4 || row == 5) 
    {
        [distanceLbl2 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
        [distanceLbl2  setFont:[UIFont boldSystemFontOfSize:16.0]];
        [distanceLbl2 setText:@"100 m"];
        [distanceLbl2 setBackgroundColor:[UIColor clearColor]];
        [slideViewOne addSubview:distanceLbl2];
        
        [typeLbl2 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
        [typeLbl2  setFont:[UIFont boldSystemFontOfSize:16.0]];
        if(row == 3 || row == 4 || row == 5)
        {
            
            [typeLbl2 setText:@"10 breaths"];
        }
        else
            
            [typeLbl2 setText:@"12 breaths"];
        [typeLbl2 setBackgroundColor:[UIColor clearColor]];
        [slideViewOne addSubview:typeLbl2];
        
        [totalLbl2 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
        [totalLbl2  setFont:[UIFont boldSystemFontOfSize:16.0]];
        [totalLbl2 setText:@"Crawl"];
        [totalLbl2 setBackgroundColor:[UIColor clearColor]];
        [slideViewOne addSubview:totalLbl2];
        
        [distanceLbl3 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
        [distanceLbl3  setFont:[UIFont boldSystemFontOfSize:16.0]];
        [distanceLbl3 setText:@"100 m"];
        [distanceLbl3 setBackgroundColor:[UIColor clearColor]];
        [slideViewOne addSubview:distanceLbl3];
        
        [typeLbl3 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
        [typeLbl3  setFont:[UIFont boldSystemFontOfSize:16.0]];
        if(row == 3 || row == 4 || row == 5)
        {
            
            [typeLbl3 setText:@"10 breaths"];
        }
        else
            
            [typeLbl3 setText:@"12 breaths"];
        [typeLbl3 setBackgroundColor:[UIColor clearColor]];
        [slideViewOne addSubview:typeLbl3];
        
        [totalLbl3 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
        [totalLbl3  setFont:[UIFont boldSystemFontOfSize:16.0]];
        [totalLbl3 setText:@"Crawl"];
        [totalLbl3 setBackgroundColor:[UIColor clearColor]];
        [slideViewOne addSubview:totalLbl3];
        
        [distanceLbl4 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
        [distanceLbl4  setFont:[UIFont boldSystemFontOfSize:16.0]];
        [distanceLbl4 setText:@"100 m"];
        [distanceLbl4 setBackgroundColor:[UIColor clearColor]];
        [slideViewOne addSubview:distanceLbl4];
        
        [typeLbl4 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
        [typeLbl4  setFont:[UIFont boldSystemFontOfSize:16.0]];
        if(row == 3 || row == 4 || row == 5)
        {
            
            [typeLbl4 setText:@"10 breaths"];
        }
        else
            [typeLbl4 setText:@"12 breaths"];
        [typeLbl4 setBackgroundColor:[UIColor clearColor]];
        [slideViewOne addSubview:typeLbl4];
        
        [totalLbl4 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
        [totalLbl4  setFont:[UIFont boldSystemFontOfSize:16.0]];
        [totalLbl4 setText:@"Crawl"];
        [totalLbl4 setBackgroundColor:[UIColor clearColor]];
        [slideViewOne addSubview:totalLbl4];
    }
    
    slideViewOne.hidden = YES;

}

-(void) renderSecondSlide
{
    
    UILabel* distanceLbl1;
    UILabel* typeLbl1;
    UILabel* totalLbl1;
    UILabel* distanceLbl2;
    UILabel* typeLbl2;
    UILabel* totalLbl2;
    UILabel* distanceLbl3;
    UILabel* typeLbl3;
    UILabel* totalLbl3;
    UILabel* distanceLbl4;
    UILabel* typeLbl4;
    UILabel* totalLbl4;
    UIImageView* divider1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider.png"]];
    [slideViewTwo addSubview:divider1];
    UIImageView* divider2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider.png"]];
    [slideViewTwo addSubview:divider2];
    UIImageView* divider3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider.png"]];
    [slideViewTwo addSubview:divider3];
    UIImageView* divider4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider.png"]];
    [slideViewTwo addSubview:divider4];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        distanceLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 3, 120, 20)];
        typeLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(130, 3, 120, 20)];
        totalLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(265, 3, 120, 20)];
        distanceLbl2 = [[UILabel alloc]initWithFrame:CGRectMake(10, 33, 120, 20)];
        typeLbl2 = [[UILabel alloc]initWithFrame:CGRectMake(130, 33, 120, 20)];
        totalLbl2 = [[UILabel alloc]initWithFrame:CGRectMake(265, 33, 120, 20)];
        distanceLbl3 = [[UILabel alloc]initWithFrame:CGRectMake(10, 63, 120, 20)];
        typeLbl3 = [[UILabel alloc]initWithFrame:CGRectMake(130, 63, 120, 20)];
        totalLbl3 = [[UILabel alloc]initWithFrame:CGRectMake(265, 63, 120, 20)];
        distanceLbl4 = [[UILabel alloc]initWithFrame:CGRectMake(10, 93, 120, 20)];
        typeLbl4 = [[UILabel alloc]initWithFrame:CGRectMake(130, 93, 120, 20)];
        totalLbl4 = [[UILabel alloc]initWithFrame:CGRectMake(265, 93, 120, 20)];
        divider1.frame = CGRectMake(0,27,320, 1.5);
        divider2.frame = CGRectMake(0,57,320, 1.5);
        divider3.frame = CGRectMake(0,87,320, 1.5);
        divider4.frame = CGRectMake(0,117,320, 1.5);
    }
    else {
        
        distanceLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 3, 120, 20)];
        typeLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(360, 3, 120, 20)];
        totalLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(690, 3, 120, 20)];
        distanceLbl2 = [[UILabel alloc]initWithFrame:CGRectMake(20, 33, 120, 20)];
        typeLbl2 = [[UILabel alloc]initWithFrame:CGRectMake(360, 33, 120, 20)];
        totalLbl2 = [[UILabel alloc]initWithFrame:CGRectMake(690, 33, 120, 20)];
        distanceLbl3 = [[UILabel alloc]initWithFrame:CGRectMake(20, 63, 120, 20)];
        typeLbl3 = [[UILabel alloc]initWithFrame:CGRectMake(360, 63, 120, 20)];
        totalLbl3 = [[UILabel alloc]initWithFrame:CGRectMake(690, 63, 120, 20)];
        distanceLbl4 = [[UILabel alloc]initWithFrame:CGRectMake(20, 93, 120, 20)];
        typeLbl4 = [[UILabel alloc]initWithFrame:CGRectMake(360, 93, 120, 20)];
        totalLbl4 = [[UILabel alloc]initWithFrame:CGRectMake(690, 93, 120, 20)];
        divider1.frame = CGRectMake(0,27,768, 1.5);
        divider2.frame = CGRectMake(0,57,768, 1.5);
        divider3.frame = CGRectMake(0,87,768, 1.5);
        divider4.frame = CGRectMake(0,117,768, 1.5);
        
        
    }

    [distanceLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [distanceLbl1  setFont:[UIFont boldSystemFontOfSize:16.0]];
    if (row == 6 || row == 7 || row == 8 ||row == 9 || row == 10 || row == 11 || row == 12 || row == 13 || row == 14 || row == 15 || row == 16 || row == 17) {
        
        [distanceLbl1 setText:@"100 m"];
        [distanceLbl2 setText:@"100 m"]; 
        [distanceLbl3 setText:@"100 m"];
        [distanceLbl4 setText:@"100 m"];
    }
    else
    {
        [distanceLbl1 setText:@"50 m"];
        [distanceLbl2 setText:@"50 m"];
        [distanceLbl3 setText:@"50 m"];
        [distanceLbl4 setText:@"50 m"];
    }
    [distanceLbl1 setBackgroundColor:[UIColor clearColor]];
    [slideViewTwo addSubview:distanceLbl1];
    
    [typeLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [typeLbl1  setFont:[UIFont boldSystemFontOfSize:16.0]];
    if(row == 3 || row == 4 || row == 5 || row == 9 || row == 10 || row == 11)
    {
        
        [typeLbl1 setText:@"6 breaths"];
    }
    else if ( row == 12 || row == 13 || row == 14 || row == 15 || row == 16 || row == 17)
    {
        
        [typeLbl1 setText:@"4 breaths"];
    }
    else
    [typeLbl1 setText:@"8 breaths"];
    
    [typeLbl1 setBackgroundColor:[UIColor clearColor]];
    [slideViewTwo addSubview:typeLbl1];
    
    [totalLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [totalLbl1  setFont:[UIFont boldSystemFontOfSize:16.0]];
    [totalLbl1 setText:@"Crawl"];
    [totalLbl1 setBackgroundColor:[UIColor clearColor]];
    [slideViewTwo addSubview:totalLbl1];
    
    [distanceLbl2 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [distanceLbl2  setFont:[UIFont boldSystemFontOfSize:16.0]];
    [distanceLbl2 setBackgroundColor:[UIColor clearColor]];
    [slideViewTwo addSubview:distanceLbl2];
    
    [typeLbl2 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [typeLbl2  setFont:[UIFont boldSystemFontOfSize:16.0]];
     if(row == 3 || row == 4 || row == 5 || row == 9 || row == 10 || row == 11)
    {
        
        [typeLbl2 setText:@"6 breaths"];
    }
    else if ( row == 12 || row == 13 || row == 14 ||row == 15 || row == 16 || row == 17)
    {
    
        [typeLbl2 setText:@"4 breaths"];
    }
    else
    [typeLbl2 setText:@"8 breaths"];
    
    [typeLbl2 setBackgroundColor:[UIColor clearColor]];
    [slideViewTwo addSubview:typeLbl2];
    
    [totalLbl2 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [totalLbl2  setFont:[UIFont boldSystemFontOfSize:16.0]];
    [totalLbl2 setText:@"Crawl"];
    [totalLbl2 setBackgroundColor:[UIColor clearColor]];
    [slideViewTwo addSubview:totalLbl2];
    
    [distanceLbl3 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [distanceLbl3  setFont:[UIFont boldSystemFontOfSize:16.0]];
    [distanceLbl3 setBackgroundColor:[UIColor clearColor]];
    [slideViewTwo addSubview:distanceLbl3];
    
    [typeLbl3 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [typeLbl3  setFont:[UIFont boldSystemFontOfSize:16.0]];
     if(row == 3 || row == 4 || row == 5 || row == 9 || row == 10 || row == 11)
    {
        
        [typeLbl3 setText:@"6 breaths"];
    }
     else if ( row == 12 || row == 13 || row == 14 || row == 15 || row == 16 || row == 17)
     {
         
         [typeLbl3 setText:@"4 breaths"];
     }
    else
    [typeLbl3 setText:@"8 breaths"];
    
    [typeLbl3 setBackgroundColor:[UIColor clearColor]];
    [slideViewTwo addSubview:typeLbl3];
    
    [totalLbl3 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [totalLbl3  setFont:[UIFont boldSystemFontOfSize:16.0]];
    [totalLbl3 setText:@"Crawl"];
    [totalLbl3 setBackgroundColor:[UIColor clearColor]];
    [slideViewTwo addSubview:totalLbl3];
    
    [distanceLbl4 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [distanceLbl4  setFont:[UIFont boldSystemFontOfSize:16.0]];
    [distanceLbl4 setBackgroundColor:[UIColor clearColor]];
    [slideViewTwo addSubview:distanceLbl4];
    

    [typeLbl4 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [typeLbl4  setFont:[UIFont boldSystemFontOfSize:16.0]];
    if(row == 3 || row == 4 || row == 5 || row == 9 || row == 10 || row == 11)
    {
        
        [typeLbl4 setText:@"6 breaths"];
    }
    else if ( row == 12 || row == 13 || row == 14 || row == 15 || row == 16 || row == 17)
    {
        
        [typeLbl4 setText:@"4 breaths"];
    }
    else
    [typeLbl4 setText:@"8 breaths"];
    
    [typeLbl4 setBackgroundColor:[UIColor clearColor]];
    [slideViewTwo addSubview:typeLbl4];
    
    [totalLbl4 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [totalLbl4  setFont:[UIFont boldSystemFontOfSize:16.0]];
    [totalLbl4 setText:@"Crawl"];
    [totalLbl4 setBackgroundColor:[UIColor clearColor]];
    [slideViewTwo addSubview:totalLbl4];
    if (row == 15 || row == 16 || row == 17) {
        distanceLbl4.hidden = YES;
        typeLbl4.hidden = YES;
        totalLbl4.hidden = YES;
        divider4.hidden = YES;
    }
    
    slideViewTwo.hidden = YES;

}

-(void) renderThirdSlide
{
    
    UILabel* distanceLbl1;
    UILabel* typeLbl1;
    UILabel* totalLbl1;
    UILabel* distanceLbl2;
    UILabel* typeLbl2;
    UILabel* totalLbl2;
    UILabel* distanceLbl3;
    UILabel* typeLbl3;
    UILabel* totalLbl3;
    UILabel* distanceLbl4;
    UILabel* typeLbl4;
    UILabel* totalLbl4;
    UIImageView* divider1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider.png"]];
    [slideViewThree addSubview:divider1];
    UIImageView* divider2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider.png"]];
    [slideViewThree addSubview:divider2];
    UIImageView* divider3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider.png"]];
    [slideViewThree addSubview:divider3];
    UIImageView* divider4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"divider.png"]];
    [slideViewThree addSubview:divider4];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        distanceLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 3, 120, 20)];
        typeLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(130, 3, 120, 20)];
        totalLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(265, 3, 120, 20)];
        distanceLbl2 = [[UILabel alloc]initWithFrame:CGRectMake(10, 33, 120, 20)];
        typeLbl2 = [[UILabel alloc]initWithFrame:CGRectMake(130, 33, 120, 20)];
        totalLbl2 = [[UILabel alloc]initWithFrame:CGRectMake(265, 33, 120, 20)];
        distanceLbl3 = [[UILabel alloc]initWithFrame:CGRectMake(10, 63, 120, 20)];
        typeLbl3 = [[UILabel alloc]initWithFrame:CGRectMake(130, 63, 120, 20)];
        totalLbl3 = [[UILabel alloc]initWithFrame:CGRectMake(265, 63, 120, 20)];
        distanceLbl4 = [[UILabel alloc]initWithFrame:CGRectMake(10, 93, 120, 20)];
        typeLbl4 = [[UILabel alloc]initWithFrame:CGRectMake(130, 93, 120, 20)];
        totalLbl4 = [[UILabel alloc]initWithFrame:CGRectMake(265, 93, 120, 20)];
        divider1.frame = CGRectMake(0,27,320, 1.5);
        divider2.frame = CGRectMake(0,57,320, 1.5);
        divider3.frame = CGRectMake(0,87,320, 1.5);
        divider4.frame = CGRectMake(0,117,320, 1.5);
    }
    else {
        
        distanceLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(20, 3, 120, 20)];
        typeLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(360, 3, 120, 20)];
        totalLbl1 = [[UILabel alloc]initWithFrame:CGRectMake(690, 3, 120, 20)];
        distanceLbl2 = [[UILabel alloc]initWithFrame:CGRectMake(20, 33, 120, 20)];
        typeLbl2 = [[UILabel alloc]initWithFrame:CGRectMake(360, 33, 120, 20)];
        totalLbl2 = [[UILabel alloc]initWithFrame:CGRectMake(690, 33, 120, 20)];
        distanceLbl3 = [[UILabel alloc]initWithFrame:CGRectMake(20, 63, 120, 20)];
        typeLbl3 = [[UILabel alloc]initWithFrame:CGRectMake(360, 63, 120, 20)];
        totalLbl3 = [[UILabel alloc]initWithFrame:CGRectMake(690, 63, 120, 20)];
        distanceLbl4 = [[UILabel alloc]initWithFrame:CGRectMake(20, 93, 120, 20)];
        typeLbl4 = [[UILabel alloc]initWithFrame:CGRectMake(360, 93, 120, 20)];
        totalLbl4 = [[UILabel alloc]initWithFrame:CGRectMake(690, 93, 120, 20)];
        divider1.frame = CGRectMake(0,27,768, 1.5);
        divider2.frame = CGRectMake(0,57,768, 1.5);
        divider3.frame = CGRectMake(0,87,768, 1.5);
        divider4.frame = CGRectMake(0,117,768, 1.5);
        
        
    }

    [distanceLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [distanceLbl1  setFont:[UIFont boldSystemFontOfSize:16.0]];
    if (row == 6 || row == 7 || row == 8 ||row == 9 || row == 10 || row == 11 || row == 12 || row == 13 || row == 14 || row == 15 || row == 16 || row == 17) {
        
        [distanceLbl1 setText:@"50 m"];
        [distanceLbl2 setText:@"50 m"];
        [distanceLbl3 setText:@"50 m"];
        [distanceLbl4 setText:@"50 m"];
    }
    else
    {
        [distanceLbl1 setText:@"25 m"];
        [distanceLbl2 setText:@"25 m"];
        [distanceLbl3 setText:@"25 m"];
        [distanceLbl4 setText:@"25 m"];
    }
    [distanceLbl1 setBackgroundColor:[UIColor clearColor]];
    [slideViewThree addSubview:distanceLbl1];
    
    [typeLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [typeLbl1  setFont:[UIFont boldSystemFontOfSize:16.0]];
    [typeLbl1 setText:@"4 breaths"];
    [typeLbl1 setBackgroundColor:[UIColor clearColor]];
    [slideViewThree addSubview:typeLbl1];
    
    [totalLbl1 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [totalLbl1  setFont:[UIFont boldSystemFontOfSize:16.0]];
    [totalLbl1 setText:@"Crawl"];
    [totalLbl1 setBackgroundColor:[UIColor clearColor]];
    [slideViewThree addSubview:totalLbl1];
    
    [distanceLbl2 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [distanceLbl2  setFont:[UIFont boldSystemFontOfSize:16.0]];
    [distanceLbl2 setBackgroundColor:[UIColor clearColor]];
    [slideViewThree addSubview:distanceLbl2];
    
    [typeLbl2 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [typeLbl2  setFont:[UIFont boldSystemFontOfSize:16.0]];
    [typeLbl2 setText:@"4 breaths"];
    [typeLbl2 setBackgroundColor:[UIColor clearColor]];
    [slideViewThree addSubview:typeLbl2];
    
    [totalLbl2 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [totalLbl2  setFont:[UIFont boldSystemFontOfSize:16.0]];
    [totalLbl2 setText:@"Crawl"];
    [totalLbl2 setBackgroundColor:[UIColor clearColor]];
    [slideViewThree addSubview:totalLbl2];
    
    [distanceLbl3 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [distanceLbl3  setFont:[UIFont boldSystemFontOfSize:16.0]];
    [distanceLbl3 setBackgroundColor:[UIColor clearColor]];
    [slideViewThree addSubview:distanceLbl3];
    
    [typeLbl3 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [typeLbl3  setFont:[UIFont boldSystemFontOfSize:16.0]];
    [typeLbl3 setText:@"4 breaths"];
    [typeLbl3 setBackgroundColor:[UIColor clearColor]];
    [slideViewThree addSubview:typeLbl3];
    
    [totalLbl3 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [totalLbl3  setFont:[UIFont boldSystemFontOfSize:16.0]];
    [totalLbl3 setText:@"Crawl"];
    [totalLbl3 setBackgroundColor:[UIColor clearColor]];
    [slideViewThree addSubview:totalLbl3];
   
    [distanceLbl4 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [distanceLbl4  setFont:[UIFont boldSystemFontOfSize:16.0]];
    [distanceLbl4 setBackgroundColor:[UIColor clearColor]];
    [slideViewThree addSubview:distanceLbl4];
    
    [typeLbl4 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [typeLbl4  setFont:[UIFont boldSystemFontOfSize:16.0]];
    [typeLbl4 setText:@"4 breaths"];
    [typeLbl4 setBackgroundColor:[UIColor clearColor]];
    [slideViewThree addSubview:typeLbl4];
    
    [totalLbl4 setTextColor:[UIColor colorWithRed:0.0/255.0 green:51.0/255.0 blue:102.0/255.0 alpha:1.0]];
    [totalLbl4  setFont:[UIFont boldSystemFontOfSize:16.0]];
    [totalLbl4 setText:@"Crawl"];
    [totalLbl4 setBackgroundColor:[UIColor clearColor]];
    [slideViewThree addSubview:totalLbl4];
    
    if (row == 15 || row == 16 || row == 17) {
        distanceLbl4.hidden = YES;
        typeLbl4.hidden = YES;
        totalLbl4.hidden = YES;
         divider4.hidden = YES;
        
    }
    slideViewThree.hidden = YES;

}

-(void) slideAction0:(id)sender
{
    
    isArrowBtn0Selected = !isArrowBtn0Selected;
    slideViewOne.hidden = YES;
    slideViewTwo.hidden = YES;
    slideViewThree.hidden = YES;
    isArrowBtn1Selected = NO;
    isArrowBtn2Selected = NO;
    isArrowBtn3Selected = NO;
    [arrowBtn1 setBackgroundImage:[UIImage imageNamed:@"arrow_up.png"] forState:UIControlStateNormal];
    [arrowBtn2 setBackgroundImage:[UIImage imageNamed:@"arrow_up.png"] forState:UIControlStateNormal];
    [arrowBtn3 setBackgroundImage:[UIImage imageNamed:@"arrow_up.png"] forState:UIControlStateNormal];
     if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
         
         if (isArrowBtn0Selected) {
             
             [arrowBtn0 setBackgroundImage:[UIImage imageNamed:@"arrow_down.png"] forState:UIControlStateNormal];
             slideViewZero.hidden = NO;
             [headerOne setFrame:CGRectMake(0, 21 + 68, 320, 68)];
             [headerTwo setFrame:CGRectMake(0, 21 + 68 + 68, 320, 68)];
             [headerThree setFrame:CGRectMake(0, 21 + 68  + 68 + 68, 320, 68)];
         }
         else
         {
             [arrowBtn0 setBackgroundImage:[UIImage imageNamed:@"arrow_up.png"] forState:UIControlStateNormal];
             slideViewZero.hidden = YES;
             [headerOne setFrame:CGRectMake(0, 69, 320, 68)];
             [headerTwo setFrame:CGRectMake(0, 69 + 68, 320, 68)];
             [headerThree setFrame:CGRectMake(0, 138 + 68, 320, 68)];
         }
     }
    else
    {
        if (isArrowBtn0Selected) {
            
            [arrowBtn0 setBackgroundImage:[UIImage imageNamed:@"arrow_down.png"] forState:UIControlStateNormal];
            slideViewZero.hidden = NO;
            [headerOne setFrame:CGRectMake(0, 21 + 68, 768, 68)];
            [headerTwo setFrame:CGRectMake(0, 21 + 68 + 68, 768, 68)];
            [headerThree setFrame:CGRectMake(0, 21 + 68  + 68 + 68, 768, 68)];
        }
        else
        {
            [arrowBtn0 setBackgroundImage:[UIImage imageNamed:@"arrow_up.png"] forState:UIControlStateNormal];
            slideViewZero.hidden = YES;
            [headerOne setFrame:CGRectMake(0, 69, 768, 68)];
            [headerTwo setFrame:CGRectMake(0, 69 + 68, 768, 68)];
            [headerThree setFrame:CGRectMake(0, 138 + 68, 768, 68)];
        }

        
    }
    
    
}


-(void) slideAction1:(id)sender
{
   
    isArrowBtn1Selected = !isArrowBtn1Selected;
    slideViewZero.hidden = YES;
    slideViewTwo.hidden = YES;
    slideViewThree.hidden = YES;
    isArrowBtn2Selected = NO;
    isArrowBtn3Selected = NO;
     [arrowBtn0 setBackgroundImage:[UIImage imageNamed:@"arrow_up.png"] forState:UIControlStateNormal];
    [arrowBtn2 setBackgroundImage:[UIImage imageNamed:@"arrow_up.png"] forState:UIControlStateNormal];
    [arrowBtn3 setBackgroundImage:[UIImage imageNamed:@"arrow_up.png"] forState:UIControlStateNormal];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        if (isArrowBtn1Selected) {
            
            [arrowBtn1 setBackgroundImage:[UIImage imageNamed:@"arrow_down.png"] forState:UIControlStateNormal];
            slideViewOne.hidden = NO;
            if(isExtraRow)
            {
                [headerOne setFrame:CGRectMake(0, 69, 320, 68)];
                if (!(row == 3 || row == 5 || row == 4))
                {
                    [headerTwo setFrame:CGRectMake(0, 21 + 68 + 68, 320, 68)];
                    [headerThree setFrame:CGRectMake(0, 226, 320, 68)];
                }
                else
                {
                    [headerTwo setFrame:CGRectMake(0, 119 + 68 + 68, 320, 68)];
                    [headerThree setFrame:CGRectMake(0, 188 + 68 + 68, 320, 68)];
                    
                }
            }
            else
            {
                if (!(row == 0 || row == 1 || row == 2))
                {
                    [headerTwo setFrame:CGRectMake(0, 21 + 68, 320, 68)];
                    [headerThree setFrame:CGRectMake(0, 21 + 68+68, 320, 68)];
                }
                else
                {
                    [headerTwo setFrame:CGRectMake(0, 119 + 68, 320, 68)];
                    [headerThree setFrame:CGRectMake(0, 188 + 68, 320, 68)];
                }
            }
        }
        else
        {
            [arrowBtn1 setBackgroundImage:[UIImage imageNamed:@"arrow_up.png"] forState:UIControlStateNormal];
            slideViewOne.hidden = YES;
            if(isExtraRow)
            {
                [headerTwo setFrame:CGRectMake(0, 69+ 68, 320, 68)];
                [headerThree setFrame:CGRectMake(0, 138 + 68, 320, 68)];
            }
            else
            {
                [headerTwo setFrame:CGRectMake(0, 69, 320, 68)];
                [headerThree setFrame:CGRectMake(0, 138, 320, 68)];
            }
        }
    }
      else
      {
          if (isArrowBtn1Selected) {
              
              [arrowBtn1 setBackgroundImage:[UIImage imageNamed:@"arrow_down.png"] forState:UIControlStateNormal];
              slideViewOne.hidden = NO;
              if(isExtraRow)
              {
                  [headerOne setFrame:CGRectMake(0, 69, 768, 68)];
                  if (!(row == 3 || row == 5 || row == 4))
                  {
                      [headerTwo setFrame:CGRectMake(0, 21 + 68 + 68, 768, 68)];
                      [headerThree setFrame:CGRectMake(0, 226, 768, 68)];
                  }
                  else
                  {
                      [headerTwo setFrame:CGRectMake(0, 119 + 68 + 68, 768, 68)];
                      [headerThree setFrame:CGRectMake(0, 188 + 68 + 68, 768, 68)];
                      
                  }
              }
              else
              {
                  if (!(row == 0 || row == 1 || row == 2))
                  {
                      [headerTwo setFrame:CGRectMake(0, 21 + 68, 768, 68)];
                      [headerThree setFrame:CGRectMake(0, 21 + 68+68, 768, 68)];
                  }
                  else
                  {
                      [headerTwo setFrame:CGRectMake(0, 119 + 68, 768, 68)];
                      [headerThree setFrame:CGRectMake(0, 188 + 68, 768, 68)];
                  }
              }
          }
          else
          {
              [arrowBtn1 setBackgroundImage:[UIImage imageNamed:@"arrow_up.png"] forState:UIControlStateNormal];
              slideViewOne.hidden = YES;
              if(isExtraRow)
              {
                  [headerTwo setFrame:CGRectMake(0, 69+ 68, 768, 68)];
                  [headerThree setFrame:CGRectMake(0, 138 + 68, 768, 68)];
              }
              else
              {
                  [headerTwo setFrame:CGRectMake(0, 69, 768, 68)];
                  [headerThree setFrame:CGRectMake(0, 138, 768, 68)];
              }
          }

          
      }
}

-(void) slideAction2:(id)sender
{
    isArrowBtn2Selected = !isArrowBtn2Selected;
    [arrowBtn0 setBackgroundImage:[UIImage imageNamed:@"arrow_up.png"] forState:UIControlStateNormal];
    [arrowBtn1 setBackgroundImage:[UIImage imageNamed:@"arrow_up.png"] forState:UIControlStateNormal];
    [arrowBtn3 setBackgroundImage:[UIImage imageNamed:@"arrow_up.png"] forState:UIControlStateNormal];
    slideViewThree.hidden = YES;
    slideViewOne.hidden = YES;
    slideViewZero.hidden = YES;
    isArrowBtn0Selected = NO;
    isArrowBtn1Selected = NO;
    isArrowBtn3Selected = NO;
     if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
         
         if (isArrowBtn2Selected) {
             
             [arrowBtn2 setBackgroundImage:[UIImage imageNamed:@"arrow_down.png"] forState:UIControlStateNormal];
             slideViewTwo.hidden = NO;
             if (isExtraRow) {
                 
                 [headerOne setFrame:CGRectMake(0, 69, 320, 68)];
                 [headerTwo setFrame:CGRectMake(0, 69+68, 320, 68)];
                 [slideViewTwo setFrame:CGRectMake(0, 138 + 68, 320, 68)];
                 [headerThree setFrame:CGRectMake(0, 138 + 118+68, 320, 68)];
                 
             }
             else
             {
                 [headerTwo setFrame:CGRectMake(0, 69, 320, 68)];
                 [slideViewTwo setFrame:CGRectMake(0, 138, 320, 68)];
                 if (row == 15 || row == 16 || row == 17) {
                     
                     [headerThree setFrame:CGRectMake(0, 138 + 78, 320, 68)];
                 }
                 else
                 {
                     [headerThree setFrame:CGRectMake(0, 138 + 118, 320, 68)];
                 }
             }
             
         }
         else
         {
             [arrowBtn2 setBackgroundImage:[UIImage imageNamed:@"arrow_up.png"] forState:UIControlStateNormal];
             slideViewTwo.hidden = YES;
             if (isExtraRow) {
                 
                 [headerOne setFrame:CGRectMake(0, 69, 320, 68)];
                 [headerTwo setFrame:CGRectMake(0, 69+68, 320, 68)];
                 [headerThree setFrame:CGRectMake(0, 138+68, 320, 68)];
                 
             }
             else
             {
                 [headerTwo setFrame:CGRectMake(0, 69, 320, 68)];
                 [headerThree setFrame:CGRectMake(0, 138, 320, 68)];
             }
         }
     }
    else
    {
    
        if (isArrowBtn2Selected) {
            
            [arrowBtn2 setBackgroundImage:[UIImage imageNamed:@"arrow_down.png"] forState:UIControlStateNormal];
            slideViewTwo.hidden = NO;
            if (isExtraRow) {
                
                [headerOne setFrame:CGRectMake(0, 69, 768, 68)];
                [headerTwo setFrame:CGRectMake(0, 69+68, 768, 68)];
                [slideViewTwo setFrame:CGRectMake(0, 138 + 68, 768, 68)];
                [headerThree setFrame:CGRectMake(0, 138 + 118+68, 768, 68)];
                
            }
            else
            {
                [headerTwo setFrame:CGRectMake(0, 69, 768, 68)];
                [slideViewTwo setFrame:CGRectMake(0, 138, 768, 68)];
                if (row == 15 || row == 16 || row == 17) {
                    
                    [headerThree setFrame:CGRectMake(0, 138 + 78, 768, 68)];
                }
                else
                {
                    [headerThree setFrame:CGRectMake(0, 138 + 118, 768, 68)];
                }
            }
            
        }
        else
        {
            [arrowBtn2 setBackgroundImage:[UIImage imageNamed:@"arrow_up.png"] forState:UIControlStateNormal];
            slideViewTwo.hidden = YES;
            if (isExtraRow) {
                
                [headerOne setFrame:CGRectMake(0, 69, 768, 68)];
                [headerTwo setFrame:CGRectMake(0, 69+68, 768, 68)];
                [headerThree setFrame:CGRectMake(0, 138+68, 768, 68)];
                
            }
            else
            {
                [headerTwo setFrame:CGRectMake(0, 69, 768, 68)];
                [headerThree setFrame:CGRectMake(0, 138, 768, 68)];
            }
        }

    }
}

-(void) slideAction3:(id)sender
{
    isArrowBtn3Selected = !isArrowBtn3Selected;
    [arrowBtn0 setBackgroundImage:[UIImage imageNamed:@"arrow_up.png"] forState:UIControlStateNormal];
    [arrowBtn2 setBackgroundImage:[UIImage imageNamed:@"arrow_up.png"] forState:UIControlStateNormal];
    [arrowBtn1 setBackgroundImage:[UIImage imageNamed:@"arrow_up.png"] forState:UIControlStateNormal];
    slideViewOne.hidden = YES;
    slideViewZero.hidden = YES;
    slideViewTwo.hidden = YES;
    isArrowBtn0Selected = NO;
    isArrowBtn2Selected = NO;
    isArrowBtn1Selected = NO;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        if (isArrowBtn3Selected) {
            [arrowBtn3 setBackgroundImage:[UIImage imageNamed:@"arrow_down.png"] forState:UIControlStateNormal];
            slideViewThree.hidden = NO;
            if (isExtraRow) {
                [headerOne setFrame:CGRectMake(0, 69, 320, 68)];
                [headerTwo setFrame:CGRectMake(0, 69+68, 320, 68)];
                [headerThree setFrame:CGRectMake(0, 138+68, 320, 68)];
                [slideViewThree setFrame:CGRectMake(0, 138+68 + 68, 320, 68)];
            }
            else
            {
                [headerTwo setFrame:CGRectMake(0, 69, 320, 68)];
                [headerThree setFrame:CGRectMake(0, 138, 320, 68)];
                [slideViewThree setFrame:CGRectMake(0, 138 + 68, 320, 68)];
            }
            
        }
        else
        {
            [arrowBtn3 setBackgroundImage:[UIImage imageNamed:@"arrow_up.png"] forState:UIControlStateNormal];
            slideViewThree.hidden = YES;
            
        }
    }
    else
    {
    
        if (isArrowBtn3Selected) {
            [arrowBtn3 setBackgroundImage:[UIImage imageNamed:@"arrow_down.png"] forState:UIControlStateNormal];
            slideViewThree.hidden = NO;
            if (isExtraRow) {
                
                [headerOne setFrame:CGRectMake(0, 69, 768, 68)];
                [headerTwo setFrame:CGRectMake(0, 69+68, 768, 68)];
                [headerThree setFrame:CGRectMake(0, 138+68, 768, 68)];
                [slideViewThree setFrame:CGRectMake(0, 138+68 + 68, 768, 68)];
            }
            else
            {
                [headerTwo setFrame:CGRectMake(0, 69, 768, 68)];
                [headerThree setFrame:CGRectMake(0, 138, 768, 68)];
                [slideViewThree setFrame:CGRectMake(0, 138 + 68, 768, 68)];
            }
            
        }
        else
        {
            [arrowBtn3 setBackgroundImage:[UIImage imageNamed:@"arrow_up.png"] forState:UIControlStateNormal];
            slideViewThree.hidden = YES;
            
        }
        

    }
        
}

- (IBAction)tipsAction:(id)sender {
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
            tipsviewCtrObj = [[TipsViewController alloc] initWithNibName:@"TipsViewController" bundle:nil];
        }
        if(result.height == 568)
        {
            tipsviewCtrObj = [[TipsViewController alloc] initWithNibName:@"TipsViewController_iPhone5" bundle:nil];
        }
        
    }
    else {
        
        tipsviewCtrObj = [[TipsViewController alloc] initWithNibName:@"TipsViewController_iPad" bundle:nil];
    }
    
    
    [self.view addSubview:tipsviewCtrObj.view];

}

- (IBAction)backAction:(id)sender
{
    [self.view removeFromSuperview];
    self.view = nil;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
