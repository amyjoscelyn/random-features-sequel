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
 What I would like to do in here is give the user a color, and they have to try and match it with the background.  They have eight buttons, for RGBA values up and down, and through that they can make all of the colors they are randomly given.
 
 There should be a bunch of difficulties--easy, medium, and hard at the least.  In easy, the colors should be very basic (red, blue, yellow), and the incremental values of RGBA should be like ten or so, to lessen the amount of options to create those colors.  Alpha should not be touched.
 
 In medium, the increment should go down to five, and the colors become a little more intermediary.  Alpha should be basic--on the level of 25, 50, 75, 0, and 100.
 
 In hard, the increment should be 2 or something, and the colors much harder.  Alpha should be more difficult too.
 
 There can actually be a super hard option.  Maybe easy should be increment 15, medium 10, hard 5, and super hard 1.  Super hard should also take alpha into extreme account.
 
 Throughout it all, the user should have a few options: whether to hide or to show the RGBA value of the goal color, whether to show the values of the current color, and if the colors should be named or just shown (through the colors).  I don't know.  It should be fun.
 
 A different array of goal colors would be supplied based on each difficulty.
 */

@end
