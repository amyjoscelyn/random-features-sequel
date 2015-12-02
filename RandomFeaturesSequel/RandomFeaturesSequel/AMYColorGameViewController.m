//
//  AMYColorGameViewController.m
//  RandomFeaturesSequel
//
//  Created by Amy Joscelyn on 12/2/15.
//  Copyright © 2015 Amy Joscelyn. All rights reserved.
//

#import "AMYColorGameViewController.h"

@interface AMYColorGameViewController ()

@property (weak, nonatomic) IBOutlet UIView *colorGoalView;

@end

@implementation AMYColorGameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.colorGoalView.backgroundColor = [UIColor yellowColor];
    self.view.backgroundColor = [UIColor blackColor];
    
    self.colorGoalView.layer.cornerRadius = self.colorGoalView.frame.size.height;
    self.colorGoalView.clipsToBounds = YES;
}

/*
 What I would like to do in here is 
 */

@end
