//
//  AMYGameDifficultyViewController.m
//  RandomFeaturesSequel
//
//  Created by Amy Joscelyn on 12/8/15.
//  Copyright © 2015 Amy Joscelyn. All rights reserved.
//

#import "AMYGameDifficultyViewController.h"
#import "AMYColorGameViewController.h"

@interface AMYGameDifficultyViewController ()

@end

@implementation AMYGameDifficultyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

//- (IBAction)difficultySelected:(UISegmentedControl *)sender
//{
//    NSString *difficulty = @"";
//    
//        if (sender.selectedSegmentIndex == 0)
//        {
//            difficulty = @"very easy";
//        }
//        else if (sender.selectedSegmentIndex == 1)
//        {
//            difficulty = @"easy";
//        }
//        else if (sender.selectedSegmentIndex == 2)
//        {
//            difficulty = @"medium";
//        }
//        else if (sender.selectedSegmentIndex == 3)
//        {
//            difficulty = @"hard";
//        }
//        else
//        {
//            difficulty = @"master";
//        }
//}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UISegmentedControl *)sender
{
    NSString *difficulty = @"";
    
    if (sender.selectedSegmentIndex == 0)
    {
        difficulty = @"very easy";
    }
    else if (sender.selectedSegmentIndex == 1)
    {
        difficulty = @"easy";
    }
    else if (sender.selectedSegmentIndex == 2)
    {
        difficulty = @"medium";
    }
    else if (sender.selectedSegmentIndex == 3)
    {
        difficulty = @"hard";
    }
    else
    {
        difficulty = @"master";
    }
    AMYColorGameViewController *gameDVC = segue.destinationViewController;
    gameDVC.difficulty = difficulty;
}

@end
