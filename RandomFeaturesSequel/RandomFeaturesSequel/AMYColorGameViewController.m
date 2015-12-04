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

@property (weak, nonatomic) IBOutlet UILabel *redGoalValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *greenGoalValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *blueGoalValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *alphaGoalValueLabel;

@property (weak, nonatomic) IBOutlet UILabel *redBackgroundValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *greenBackgroundValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *blueBackgroundValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *alphaBackgroundValueLabel;

@property (weak, nonatomic) IBOutlet UIButton *lessRedButton;
@property (weak, nonatomic) IBOutlet UIButton *moreRedButton;
@property (weak, nonatomic) IBOutlet UIButton *lessGreenButton;
@property (weak, nonatomic) IBOutlet UIButton *moreGreenButton;
@property (weak, nonatomic) IBOutlet UIButton *lessBlueButton;
@property (weak, nonatomic) IBOutlet UIButton *moreBlueButton;
@property (weak, nonatomic) IBOutlet UIButton *lessAlphaButton;
@property (weak, nonatomic) IBOutlet UIButton *moreAlphaButton;

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

@property (nonatomic, strong) UIColor *currentColor;

@property (nonatomic, strong) NSArray *easyColors;

@end

@implementation AMYColorGameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setGoalColors];
    [self chooseGoalColor];

    self.colorGoalView.layer.cornerRadius = self.colorGoalView.frame.size.height/2;
    self.colorGoalView.clipsToBounds = YES;
}

- (void)setGoalColors
{
    UIColor *red    = [UIColor redColor];
    UIColor *orange = [UIColor orangeColor];
    UIColor *yellow = [UIColor yellowColor];
    UIColor *green  = [UIColor greenColor];
    UIColor *blue   = [UIColor blueColor];
    UIColor *purple = [UIColor purpleColor];
    UIColor *brown  = [UIColor brownColor]; //doesn't match fsr
    UIColor *white  = [UIColor whiteColor]; //text color is white
    
    self.easyColors = @[ red, orange, yellow, green, blue, purple, brown ];
    self.currentColor = white;
}

- (void)chooseGoalColor //WithDifficulty:(NSString *)difficulty
{
    NSUInteger i = 0;
    do
    {
        i = arc4random_uniform((int)self.easyColors.count);
    }
    while (self.easyColors[i] == self.currentColor);
    
    [self setUpGameWithGoalColor:self.easyColors[i]];
}

- (void)setUpGameWithGoalColor:(UIColor *)color
{
    self.colorGoalView.backgroundColor = color;
    self.gameLabel.backgroundColor = color;
    self.currentColor = color;
    
    NSArray *colorValueLabels = @[ self.redGoalValueLabel,
                                   self.greenGoalValueLabel,
                                   self.blueGoalValueLabel,
                                   self.alphaGoalValueLabel,
                                   self.redBackgroundValueLabel,
                                   self.greenBackgroundValueLabel,
                                   self.blueBackgroundValueLabel,
                                   self.alphaBackgroundValueLabel];
    
    for (UILabel *colorValueLabel in colorValueLabels)
    {
        colorValueLabel.backgroundColor = color;
        [colorValueLabel setTextColor:[UIColor whiteColor]];
    }
    CGFloat red, green, blue, alpha;
    [color    getRed: &red
               green: &green
                blue: &blue
               alpha: &alpha ];
    
    self.redGoalValueLabel.text = [NSString stringWithFormat:@"R: %.3f", red];
    self.greenGoalValueLabel.text = [NSString stringWithFormat:@"G: %.3f", green];
    self.blueGoalValueLabel.text = [NSString stringWithFormat:@"B: %.3f", blue];
    self.alphaGoalValueLabel.text = [NSString stringWithFormat:@"A: %.3f", alpha];
    
    [self.refreshGameButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.refreshGameButton.layer.borderWidth = 2.0f;
    self.refreshGameButton.layer.borderColor = [UIColor whiteColor].CGColor;
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
//    self.alphaFloat = 0.5; //this should probably be 0 for easy
    self.alphaFloat = 0.0;
    
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
        sender.enabled = NO;
        NSLog(@"Red value can't go any higher.");
        return;
    }
    self.numberOfTimesRedButtonTapped++;
    
    self.colorWithRedFloat = self.numberOfTimesRedButtonTapped * self.multiplier;
    
    self.lessRedButton.enabled = YES;
    
    NSLog(@"Tapped Red: %lu, %.2f", self.numberOfTimesRedButtonTapped, self.colorWithRedFloat);
    
    [self postButtonActions];
}

- (IBAction)makeBackgroundLessRedButtonTapped:(UIButton *)sender
{
    if (self.numberOfTimesRedButtonTapped == self.tapCapMin)
    {
        sender.enabled = NO;
        NSLog(@"Red value can't go any lower.");
        return;
    }
    self.numberOfTimesRedButtonTapped--;
    
    self.colorWithRedFloat = self.numberOfTimesRedButtonTapped * self.multiplier;
    
    self.moreRedButton.enabled = YES;
    
    NSLog(@"Tapped Red: %lu, %.2f", self.numberOfTimesRedButtonTapped,self.colorWithRedFloat);
    
    [self postButtonActions];
}

- (IBAction)makeBackgroundMoreGreenButtonTapped:(UIButton *)sender
{
    if (self.numberOfTimesGreenButtonTapped == self.tapCapMax)
    {
        sender.enabled = NO;
        NSLog(@"Green value can't go any higher.");
        return;
    }
    self.numberOfTimesGreenButtonTapped++;
    
    self.colorWithGreenFloat = self.numberOfTimesGreenButtonTapped * self.multiplier;
    
    self.lessGreenButton.enabled = YES;
    
    NSLog(@"Tapped Green: %lu, %.2f", self.numberOfTimesGreenButtonTapped, self.colorWithGreenFloat);
    
    [self postButtonActions];
}

- (IBAction)makeBackgroundLessGreenButtonTapped:(UIButton *)sender
{
    if (self.numberOfTimesGreenButtonTapped == self.tapCapMin)
    {
        sender.enabled = NO;
        NSLog(@"Green value can't go any lower.");
        return;
    }
    self.numberOfTimesGreenButtonTapped--;
    
    self.colorWithGreenFloat = self.numberOfTimesGreenButtonTapped * self.multiplier;
    
    self.moreGreenButton.enabled = YES;
    
    NSLog(@"Tapped Green: %lu, %.2f", self.numberOfTimesGreenButtonTapped, self.colorWithGreenFloat);
    
    [self postButtonActions];
}

- (IBAction)makeBackgroundMoreBlueButtonTapped:(UIButton *)sender
{
    if (self.numberOfTimesBlueButtonTapped == self.tapCapMax)
    {
        sender.enabled = NO;
        NSLog(@"Blue value can't go any higher.");
        return;
    }
    self.numberOfTimesBlueButtonTapped++;
    
    self.colorWithBlueFloat = self.numberOfTimesBlueButtonTapped * self.multiplier;
    
    self.lessBlueButton.enabled = YES;
    
    NSLog(@"Tapped Blue: %lu, %.2f", self.numberOfTimesBlueButtonTapped, self.colorWithBlueFloat);
    
    [self postButtonActions];
}

- (IBAction)makeBackgroundLessBlueButtonTapped:(UIButton *)sender
{
    if (self.numberOfTimesBlueButtonTapped == self.tapCapMin)
    {
        sender.enabled = NO;
        NSLog(@"Blue value can't go any lower.");
        return;
    }
    self.numberOfTimesBlueButtonTapped--;
    
    self.colorWithBlueFloat = self.numberOfTimesBlueButtonTapped * self.multiplier;
    
    self.moreBlueButton.enabled = YES;
    
    NSLog(@"Tapped Blue: %lu, %.2f", self.numberOfTimesBlueButtonTapped, self.colorWithBlueFloat);
    
    [self postButtonActions];
}

- (IBAction)addAlphaToBackgroundButtonTapped:(UIButton *)sender
{
    if (self.numberOfTimesAlphaButtonTapped == self.tapCapMax)
    {
        sender.enabled = NO;
        NSLog(@"Alpha value can't go any higher.");
        return;
    }
    self.numberOfTimesAlphaButtonTapped++;
    
    self.alphaFloat = self.numberOfTimesAlphaButtonTapped * self.multiplier;
    
    self.lessAlphaButton.enabled = YES;
    
    NSLog(@"Tapped Alpha: %lu, %.2f", self.numberOfTimesAlphaButtonTapped, self.alphaFloat);
    
    [self postButtonActions];
}

- (IBAction)takeAwayAlphaFromBackgroundButtonTapped:(UIButton *)sender
{
    if (self.numberOfTimesAlphaButtonTapped == self.tapCapMin)
    {
        sender.enabled = NO;
        NSLog(@"Alpha value can't go any lower.");
        return;
    }
    self.numberOfTimesAlphaButtonTapped--;
    
    self.alphaFloat = self.numberOfTimesAlphaButtonTapped * self.multiplier;
    
    self.moreAlphaButton.enabled = YES;
    
    NSLog(@"Tapped Alpha: %lu, %.2f", self.numberOfTimesAlphaButtonTapped, self.alphaFloat);
    
    [self postButtonActions];
}

- (void)postButtonActions
{
//    CGFloat redBG, greenBG, blueBG, alphaBG;
//    
//    [self.view.backgroundColor getRed: &redBG
//                                green: &greenBG
//                                 blue: &blueBG
//                                alpha: &alphaBG];
//    self.redBackgroundValueLabel.text = [NSString stringWithFormat:@"R: %.3f", redBG];
//    self.greenBackgroundValueLabel.text = [NSString stringWithFormat:@"G: %.3f", greenBG];
//    self.blueBackgroundValueLabel.text = [NSString stringWithFormat:@"B: %.3f", blueBG];
//    self.alphaBackgroundValueLabel.text = [NSString stringWithFormat:@"A: %.3f", alphaBG];
    //not counting properly fsr
    
    
    [self changeBackgroundColor];
    [self winningConditions];
}

- (void)winningConditions
{
//    NSLog(@"BGColor: %@, Goal: %@", self.view.backgroundColor, self.colorGoalView.backgroundColor);
    
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

/*
 Things I want to implement:
    a check so that a random color can't be chosen twice in a row
    round out the stacks so they look prettier... can stacks be rounded?
    give the refresh button text more breathing room
    raise increment to 1 for easy level
    set up other difficulty arrays, even if they're blank
    add label for color name, so if RGBA values aren't shown the target color name can still be
    set which options can be hidden
    set up method to handle difficulty choice
    set up values for each difficulty (increment, alpha starting value)

 more advanced stuff/issues:
    figure out why brown doesn't ever match
    RGBA values for BG should print properly
    set up a tap counter to get score
    check out how it looks on other devices
    set up options for difficulty and hiding fields.  an options screen?
 */

@end
