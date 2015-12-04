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
@property (weak, nonatomic) IBOutlet UILabel *gameLabel;
@property (weak, nonatomic) IBOutlet UIButton *refreshGameButton;

@property (nonatomic) NSUInteger numberOfTimesRedButtonTapped;
@property (nonatomic) NSUInteger numberOfTimesGreenButtonTapped;
@property (nonatomic) NSUInteger numberOfTimesBlueButtonTapped;
@property (nonatomic) NSUInteger numberOfTimesAlphaButtonTapped;

@property (nonatomic) CGFloat colorWithRedFloat;
@property (nonatomic) CGFloat colorWithGreenFloat;
@property (nonatomic) CGFloat colorWithBlueFloat;
@property (nonatomic) CGFloat alphaFloat;

@property (nonatomic) NSUInteger tapCapMax;
@property (nonatomic) NSUInteger tapCapMin;
@property (nonatomic) CGFloat multiplier;

@property (nonatomic, strong) NSArray *easyColors;

@end

@implementation AMYColorGameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setGoalColors];
    
    //this can always go into another method, one that lets you pick your difficulty, and adjusts the array used based on your choice
    NSUInteger i = arc4random_uniform((int)self.easyColors.count);
    UIColor *goalColor = self.easyColors[i];
    [self setUpGameWithGoalColor:goalColor];
    
    self.colorGoalView.layer.cornerRadius = self.colorGoalView.frame.size.height/2;
    self.colorGoalView.clipsToBounds = YES;
}

- (void)setGoalColors
{
    UIColor *red = [UIColor redColor];
    UIColor *orange = [UIColor orangeColor];
    UIColor *yellow = [UIColor yellowColor];
    UIColor *green = [UIColor greenColor];
    UIColor *blue = [UIColor blueColor];
    UIColor *purple = [UIColor purpleColor];
    UIColor *brown = [UIColor brownColor];
    UIColor *white = [UIColor whiteColor];
    
    self.easyColors = @[ red, orange, yellow, green, blue, purple, brown, white ];
}

- (void)chooseGoalColor //WithDifficulty:(NSString *)difficulty
{
    NSUInteger i = arc4random_uniform((int)self.easyColors.count);
    [self setUpGameWithGoalColor:self.easyColors[i]];
}

- (void)setUpGameWithGoalColor:(UIColor *)color
{
    self.colorGoalView.backgroundColor = color;
    self.gameLabel.backgroundColor = color;
    self.refreshGameButton.hidden = YES;
    self.view.backgroundColor = [UIColor blackColor];
    self.gameLabel.text = @"Match the color!";
    [self setUpView];
}

- (void)setUpView
{
    self.multiplier = 0.05;
    
    CGFloat x = 1 / self.multiplier; //does this change based on difficulty?
    
    self.colorWithRedFloat = 0.0;
    self.colorWithGreenFloat = 0.0;
    self.colorWithBlueFloat = 0.0;
    self.alphaFloat = 0.5; //this should probably be 0 for easy
    
    self.numberOfTimesRedButtonTapped = self.colorWithRedFloat;
    self.numberOfTimesGreenButtonTapped = self.colorWithGreenFloat;
    self.numberOfTimesBlueButtonTapped = self.colorWithBlueFloat;
    self.numberOfTimesAlphaButtonTapped = self.alphaFloat * x;
    
    self.tapCapMax = x;
    self.tapCapMin = 0;
}

- (void)changeBackgroundColor
{
    self.view.backgroundColor = [UIColor colorWithRed:self.colorWithRedFloat green:self.colorWithGreenFloat blue:self.colorWithBlueFloat alpha:self.alphaFloat];
}

- (IBAction)makeBackgroundMoreRedButtonTapped:(UIButton *)sender
{
    if (self.numberOfTimesRedButtonTapped == self.tapCapMax)
    {
        NSLog(@"Red value can't go any higher.");
        return;
    }
    self.numberOfTimesRedButtonTapped++;
    
    self.colorWithRedFloat = self.numberOfTimesRedButtonTapped * self.multiplier;
    
    NSLog(@"Tapped Red: %lu, %.2f", self.numberOfTimesRedButtonTapped, self.colorWithRedFloat);
    
    [self postButtonActions];
}

- (IBAction)makeBackgroundLessRedButtonTapped:(UIButton *)sender
{
    if (self.numberOfTimesRedButtonTapped == self.tapCapMin)
    {
        NSLog(@"Red value can't go any lower.");
        return;
    }
    self.numberOfTimesRedButtonTapped--;
    
    self.colorWithRedFloat = self.numberOfTimesRedButtonTapped * self.multiplier;
    
    NSLog(@"Tapped Red: %lu, %.2f", self.numberOfTimesRedButtonTapped,self.colorWithRedFloat);
    
    [self postButtonActions];
}

- (IBAction)makeBackgroundMoreGreenButtonTapped:(UIButton *)sender
{
    if (self.numberOfTimesGreenButtonTapped == self.tapCapMax)
    {
        NSLog(@"Green value can't go any higher.");
        return;
    }
    self.numberOfTimesGreenButtonTapped++;
    
    self.colorWithGreenFloat = self.numberOfTimesGreenButtonTapped * self.multiplier;
    
    NSLog(@"Tapped Green: %lu, %.2f", self.numberOfTimesGreenButtonTapped, self.colorWithGreenFloat);
    
    [self postButtonActions];
}

- (IBAction)makeBackgroundLessGreenButtonTapped:(UIButton *)sender
{
    if (self.numberOfTimesGreenButtonTapped == self.tapCapMin)
    {
        NSLog(@"Green value can't go any lower.");
        return;
    }
    self.numberOfTimesGreenButtonTapped--;
    
    self.colorWithGreenFloat = self.numberOfTimesGreenButtonTapped * self.multiplier;
    
    NSLog(@"Tapped Green: %lu, %.2f", self.numberOfTimesGreenButtonTapped, self.colorWithGreenFloat);
    
    [self postButtonActions];
}

- (IBAction)makeBackgroundMoreBlueButtonTapped:(UIButton *)sender
{
    if (self.numberOfTimesBlueButtonTapped == self.tapCapMax)
    {
        NSLog(@"Blue value can't go any higher.");
        return;
    }
    self.numberOfTimesBlueButtonTapped++;
    
    self.colorWithBlueFloat = self.numberOfTimesBlueButtonTapped * self.multiplier;
    
    NSLog(@"Tapped Blue: %lu, %.2f", self.numberOfTimesBlueButtonTapped, self.colorWithBlueFloat);
    
    [self postButtonActions];
}

- (IBAction)makeBackgroundLessBlueButtonTapped:(UIButton *)sender
{
    if (self.numberOfTimesBlueButtonTapped == self.tapCapMin)
    {
        NSLog(@"Blue value can't go any lower.");
        return;
    }
    self.numberOfTimesBlueButtonTapped--;
    
    self.colorWithBlueFloat = self.numberOfTimesBlueButtonTapped * self.multiplier;
    
    NSLog(@"Tapped Blue: %lu, %.2f", self.numberOfTimesBlueButtonTapped, self.colorWithBlueFloat);
    
    [self postButtonActions];
}

- (IBAction)addAlphaToBackgroundButtonTapped:(UIButton *)sender
{
    if (self.numberOfTimesAlphaButtonTapped == self.tapCapMax)
    {
        NSLog(@"Alpha value can't go any higher.");
        return;
    }
    self.numberOfTimesAlphaButtonTapped++;
    
    self.alphaFloat = self.numberOfTimesAlphaButtonTapped * self.multiplier;
    
    NSLog(@"Tapped Alpha: %lu, %.2f", self.numberOfTimesAlphaButtonTapped, self.alphaFloat);
    
    [self postButtonActions];
}

- (IBAction)takeAwayAlphaFromBackgroundButtonTapped:(UIButton *)sender
{
    if (self.numberOfTimesAlphaButtonTapped == self.tapCapMin)
    {
        NSLog(@"Alpha value can't go any lower.");
        return;
    }
    self.numberOfTimesAlphaButtonTapped--;
    
    self.alphaFloat = self.numberOfTimesAlphaButtonTapped * self.multiplier;
    
    NSLog(@"Tapped Alpha: %lu, %.2f", self.numberOfTimesAlphaButtonTapped, self.alphaFloat);
    
    [self postButtonActions];
}

- (void)postButtonActions
{
    [self changeBackgroundColor];
    [self winningConditions];
}

- (void)winningConditions
{
    if ([self.view.backgroundColor isEqual:self.colorGoalView.backgroundColor])
    {
        self.gameLabel.text = @"Winner!";
        self.refreshGameButton.hidden = NO;
    }
}

- (IBAction)refreshGameButtonTapped:(id)sender
{
    [self chooseGoalColor];
}

/*
 What I would like to do in here is give the user a color, and they have to try and match it with the background.  They have eight buttons, for RGBA values up and down, and through that they can make all of the colors they are randomly given.
 
 There should be a bunch of difficulties--easy, medium, and hard at the least.  In easy, the colors should be very basic (red, blue, yellow), and the incremental values of RGBA should be like ten or so, to lessen the amount of options to create those colors.  Alpha should not be touched.
 
 In medium, the increment should go down to five, and the colors become a little more intermediary.  Alpha should be basic--on the level of 25, 50, 75, 0, and 100.
 
 In hard, the increment should be 2 or something, and the colors much harder.  Alpha should be more difficult too.
 
 There can actually be a super hard option.  Maybe easy should be increment 15, medium 10, hard 5, and super hard 1.  Super hard should also take alpha into extreme account.
 
 Throughout it all, the user should have a few options: whether to hide or to show the RGBA value of the goal color, whether to show the values of the current color, and if the colors should be named or just shown (through the colors).  I don't know.  It should be fun.
 
 A different array of goal colors would be supplied based on each difficulty.
 
 Oooh!!  It should keep track of how many taps you've used to find that color--that should be your score!  (That can be another option to show or hide; do you want to see your score or do it zen?  Do you want to know what the par is--the absolute fewest amount of taps it could take?  Or do you want that hidden too, and learn for yourself how low you can go?)
 */

@end
