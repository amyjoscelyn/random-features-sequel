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

@property (weak, nonatomic) IBOutlet UIButton *hideFeatureButton;
@property (weak, nonatomic) IBOutlet UIButton *dismissModalButton;

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
@property (nonatomic, strong) NSString *currentDifficulty;

@property (nonatomic, strong) NSArray *veryEasyColors;
@property (nonatomic, strong) NSArray *easyColors;
@property (nonatomic, strong) NSArray *mediumColors;
@property (nonatomic, strong) NSArray *hardColors;
@property (nonatomic, strong) NSArray *masterColors;

@end

@implementation AMYColorGameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"difficulty: %@", self.difficulty);
    
    [self setGoalColors];
    [self chooseGoalColor];

    self.colorGoalView.layer.cornerRadius = self.colorGoalView.frame.size.height/2;
    self.colorGoalView.clipsToBounds = YES;
}

- (void)setGoalColors
{
    UIColor *red    = [UIColor redColor]; // 1|0|0|1
    UIColor *green  = [UIColor greenColor]; // 0|1|0|1
    UIColor *blue   = [UIColor blueColor]; // 0|0|1|1
    UIColor *yellow = [UIColor yellowColor]; // 1|1|0|1
    UIColor *magenta = [UIColor magentaColor]; // 1|0|1|1
    UIColor *cyan = [UIColor cyanColor]; // 0|1|1|1
    UIColor *white  = [UIColor whiteColor]; // 1|1|1|1
    
    self.veryEasyColors = @[ red, green, blue, yellow, magenta, white ];
    
    UIColor *gray = [UIColor grayColor]; // 5|5|5|1
    UIColor *orange = [UIColor orangeColor]; // 1|5|0|1
    UIColor *purple = [UIColor purpleColor]; // 5|0|5|1
    
    self.easyColors = @[ orange, purple, gray ];
    
    UIColor *brown  = [UIColor brownColor]; // 6|4|2|1
    UIColor *dustyRose = [UIColor colorWithRed:.6 green:0 blue:.2 alpha:1];
    UIColor *lightGray = [UIColor lightGrayColor]; // 667|667|667|1
    UIColor *darkGray = [UIColor darkGrayColor]; // 333|333|333|1
    UIColor *lime = [UIColor colorWithRed:.5 green:.75 blue:0 alpha:1];
    UIColor *darkRed = [UIColor colorWithRed:.5 green:0 blue:.1 alpha:1];
    
    UIColor *darkBlue = [UIColor colorWithRed:0 green:.2 blue:.4 alpha:1];

    self.mediumColors = @[ orange, yellow, purple, brown, white, dustyRose, lime, darkRed, darkBlue ];
    
    UIColor *springGreen = [UIColor colorWithRed:.45 green:.75 blue:.5 alpha:1];
    
    self.hardColors = @[ darkRed, darkBlue, dustyRose, lime, springGreen, white ];
    
    self.masterColors = @[ darkGray, lightGray ];
    
    self.currentColor = white;
}

- (void)chooseGoalColor
{
    NSMutableArray *colorsArray = [[NSMutableArray alloc] init];
    
    if ([self.difficulty isEqualToString:@"very easy"])
    {
        colorsArray = [self.veryEasyColors mutableCopy];
    }
    else if ([self.difficulty isEqualToString:@"easy"])
    {
        colorsArray = [self.easyColors mutableCopy];
    }
    else if ([self.difficulty isEqualToString:@"medium"])
    {
        colorsArray = [self.mediumColors mutableCopy];
    }
    else if ([self.difficulty isEqualToString:@"hard"])
    {
        colorsArray = [self.hardColors mutableCopy];
    }
    else
    {
        colorsArray = [self.masterColors mutableCopy];
    }
    
    NSUInteger i = 0;
    do
    {
        i = arc4random_uniform((int)colorsArray.count);
    }
    while (colorsArray[i] == self.currentColor);
    
    self.currentDifficulty = self.difficulty;
    [self setUpGameWithGoalColor:colorsArray[i]];
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
    CGFloat red, green, blue, alpha;
    [color    getRed: &red
               green: &green
                blue: &blue
               alpha: &alpha ];
    
    self.redGoalValueLabel.text = [NSString stringWithFormat:@"R: %.3f", red];
    self.greenGoalValueLabel.text = [NSString stringWithFormat:@"G: %.3f", green];
    self.blueGoalValueLabel.text = [NSString stringWithFormat:@"B: %.3f", blue];
    self.alphaGoalValueLabel.text = [NSString stringWithFormat:@"A: %.3f", alpha];
    
    UIColor *textColor = [UIColor whiteColor];
    
    if (red > .7 && green > .7)
    {
        textColor = [UIColor blackColor];
    }
    
    for (UILabel *colorValueLabel in colorValueLabels)
    {
        colorValueLabel.backgroundColor = color;
        [colorValueLabel setTextColor:textColor];
    }
    [self.refreshGameButton setTitleColor:textColor forState:UIControlStateNormal];
    self.refreshGameButton.layer.borderWidth = 2.0f;
    self.refreshGameButton.layer.borderColor = textColor.CGColor;
    self.refreshGameButton.hidden = YES;
    
    self.view.backgroundColor = [UIColor blackColor];
    self.gameLabel.text = @"Match the color!";
    [self setUpView];
}

- (void)setUpView
{
    if ([self.difficulty isEqualToString:@"very easy"] || [self.difficulty isEqualToString:@"easy"])
    {
        self.multiplier = 0.1;
        self.alphaFloat = 1; //i should probably just hide the alpha buttons
    }
    else if ([self.difficulty isEqualToString:@"medium"])
    {
        self.multiplier = 0.05;
        self.alphaFloat = 1;
    }
    else if ([self.difficulty isEqualToString:@"hard"])
    {
        self.multiplier = 0.05;
        self.alphaFloat = 0.5;
    }
    else
    {
        self.multiplier = 0.01;
        self.alphaFloat = 0;
    }
    
    CGFloat x = 1 / self.multiplier; //does this change based on difficulty?
    
    self.colorWithRedFloat = 0.0;
    self.colorWithGreenFloat = 0.0;
    self.colorWithBlueFloat = 0.0;
//    self.alphaFloat = 0.5; //this should probably be 1 for easy
    
    self.numberOfTimesRedButtonTapped = self.colorWithRedFloat;
    self.numberOfTimesGreenButtonTapped = self.colorWithGreenFloat;
    self.numberOfTimesBlueButtonTapped = self.colorWithBlueFloat;
    self.numberOfTimesAlphaButtonTapped = self.alphaFloat * x;
    
    self.tapCapMax = x;
    self.tapCapMin = 0;
    
    self.redBackgroundValueLabel.text = [NSString stringWithFormat:@"R:"];
    self.greenBackgroundValueLabel.text = [NSString stringWithFormat:@"G:"];
    self.blueBackgroundValueLabel.text = [NSString stringWithFormat:@"B:"];
    self.alphaBackgroundValueLabel.text = [NSString stringWithFormat:@"A:"];
    
    self.lessRedButton.enabled = YES;
    self.moreRedButton.enabled = YES;
    self.lessGreenButton.enabled = YES;
    self.moreGreenButton.enabled = YES;
    self.lessBlueButton.enabled = YES;
    self.moreBlueButton.enabled = YES;
    self.lessAlphaButton.enabled = YES;
    self.moreAlphaButton.enabled = YES;
}

- (void)changeBackgroundColor
{
    self.view.backgroundColor = [UIColor colorWithRed:self.colorWithRedFloat green:self.colorWithGreenFloat blue:self.colorWithBlueFloat alpha:self.alphaFloat];
    
    CGFloat redBG, greenBG, blueBG, alphaBG;
    
    [self.view.backgroundColor getRed: &redBG
                                green: &greenBG
                                 blue: &blueBG
                                alpha: &alphaBG];
    self.redBackgroundValueLabel.text = [NSString stringWithFormat:@"R: %.3f", redBG];
    self.greenBackgroundValueLabel.text = [NSString stringWithFormat:@"G: %.3f", greenBG];
    self.blueBackgroundValueLabel.text = [NSString stringWithFormat:@"B: %.3f", blueBG];
    self.alphaBackgroundValueLabel.text = [NSString stringWithFormat:@"A: %.3f", alphaBG];
}

- (IBAction)makeBackgroundMoreRedButtonTapped:(UIButton *)sender
{
    if (self.numberOfTimesRedButtonTapped == self.tapCapMax)
    {
        sender.enabled = NO;
        return;
    }
    self.numberOfTimesRedButtonTapped++;
    
    self.colorWithRedFloat = self.numberOfTimesRedButtonTapped * self.multiplier;
    
    self.lessRedButton.enabled = YES;
    
//    NSLog(@"Tapped Red: %lu, %.2f", self.numberOfTimesRedButtonTapped, self.colorWithRedFloat);
    
    [self postButtonActions];
}

- (IBAction)makeBackgroundLessRedButtonTapped:(UIButton *)sender
{
    if (self.numberOfTimesRedButtonTapped == self.tapCapMin)
    {
        sender.enabled = NO;
        return;
    }
    self.numberOfTimesRedButtonTapped--;
    
    self.colorWithRedFloat = self.numberOfTimesRedButtonTapped * self.multiplier;
    
    self.moreRedButton.enabled = YES;
    
//    NSLog(@"Tapped Red: %lu, %.2f", self.numberOfTimesRedButtonTapped,self.colorWithRedFloat);
    
    [self postButtonActions];
}

- (IBAction)makeBackgroundMoreGreenButtonTapped:(UIButton *)sender
{
    if (self.numberOfTimesGreenButtonTapped == self.tapCapMax)
    {
        sender.enabled = NO;
        return;
    }
    self.numberOfTimesGreenButtonTapped++;
    
    self.colorWithGreenFloat = self.numberOfTimesGreenButtonTapped * self.multiplier;
    
    self.lessGreenButton.enabled = YES;
    
//    NSLog(@"Tapped Green: %lu, %.2f", self.numberOfTimesGreenButtonTapped, self.colorWithGreenFloat);
    
    [self postButtonActions];
}

- (IBAction)makeBackgroundLessGreenButtonTapped:(UIButton *)sender
{
    if (self.numberOfTimesGreenButtonTapped == self.tapCapMin)
    {
        sender.enabled = NO;
        return;
    }
    self.numberOfTimesGreenButtonTapped--;
    
    self.colorWithGreenFloat = self.numberOfTimesGreenButtonTapped * self.multiplier;
    
    self.moreGreenButton.enabled = YES;
    
//    NSLog(@"Tapped Green: %lu, %.2f", self.numberOfTimesGreenButtonTapped, self.colorWithGreenFloat);
    
    [self postButtonActions];
}

- (IBAction)makeBackgroundMoreBlueButtonTapped:(UIButton *)sender
{
    if (self.numberOfTimesBlueButtonTapped == self.tapCapMax)
    {
        sender.enabled = NO;
        return;
    }
    self.numberOfTimesBlueButtonTapped++;
    
    self.colorWithBlueFloat = self.numberOfTimesBlueButtonTapped * self.multiplier;
    
    self.lessBlueButton.enabled = YES;
    
//    NSLog(@"Tapped Blue: %lu, %.2f", self.numberOfTimesBlueButtonTapped, self.colorWithBlueFloat);
    
    [self postButtonActions];
}

- (IBAction)makeBackgroundLessBlueButtonTapped:(UIButton *)sender
{
    if (self.numberOfTimesBlueButtonTapped == self.tapCapMin)
    {
        sender.enabled = NO;
        return;
    }
    self.numberOfTimesBlueButtonTapped--;
    
    self.colorWithBlueFloat = self.numberOfTimesBlueButtonTapped * self.multiplier;
    
    self.moreBlueButton.enabled = YES;
    
//    NSLog(@"Tapped Blue: %lu, %.2f", self.numberOfTimesBlueButtonTapped, self.colorWithBlueFloat);
    
    [self postButtonActions];
}

- (IBAction)addAlphaToBackgroundButtonTapped:(UIButton *)sender
{
    if (self.numberOfTimesAlphaButtonTapped == self.tapCapMax)
    {
        sender.enabled = NO;
        return;
    }
    self.numberOfTimesAlphaButtonTapped++;
    
    self.alphaFloat = self.numberOfTimesAlphaButtonTapped * self.multiplier;
    
    self.lessAlphaButton.enabled = YES;
    
//    NSLog(@"Tapped Alpha: %lu, %.2f", self.numberOfTimesAlphaButtonTapped, self.alphaFloat);
    
    [self postButtonActions];
}

- (IBAction)takeAwayAlphaFromBackgroundButtonTapped:(UIButton *)sender
{
    if (self.numberOfTimesAlphaButtonTapped == self.tapCapMin)
    {
        sender.enabled = NO;
        return;
    }
    self.numberOfTimesAlphaButtonTapped--;
    
    self.alphaFloat = self.numberOfTimesAlphaButtonTapped * self.multiplier;
    
    self.moreAlphaButton.enabled = YES;
    
//    NSLog(@"Tapped Alpha: %lu, %.2f", self.numberOfTimesAlphaButtonTapped, self.alphaFloat);
    
    [self postButtonActions];
}

- (void)postButtonActions
{
    [self changeBackgroundColor];
    [self hasWon:([self winningConditions])];
}

- (BOOL)winningConditions
{
    CGColorRef color1 = [self.colorGoalView.backgroundColor CGColor];
    CGColorRef color2 = [self.view.backgroundColor CGColor];
    
    if (CGColorGetColorSpace(color1) == CGColorGetColorSpace(color2))
    {
        NSUInteger componentsNumber = CGColorGetNumberOfComponents(color1);
        CGFloat tolerance = 0.0001;
        
        const CGFloat *components1 = CGColorGetComponents(color1);
        const CGFloat *components2 = CGColorGetComponents(color2);
        
        for (NSUInteger i = 0; i < componentsNumber; i++)
        {
            CGFloat quotient = components1[i] / components2[i];
            if ((fabs(quotient) - 1) > tolerance)
            {
                return NO;
            }
        }
    }
    return YES;
}

- (void)hasWon:(BOOL)boolean
{
    if (boolean)
    {
        self.gameLabel.text = @"Winner!";
        self.refreshGameButton.hidden = NO;
        
        self.lessRedButton.enabled = NO;
        self.moreRedButton.enabled = NO;
        self.lessGreenButton.enabled = NO;
        self.moreGreenButton.enabled = NO;
        self.lessBlueButton.enabled = NO;
        self.moreBlueButton.enabled = NO;
        self.lessAlphaButton.enabled = NO;
        self.moreAlphaButton.enabled = NO;
    }
}

- (IBAction)refreshGameButtonTapped:(id)sender
{
    [self chooseGoalColor];
}

- (IBAction)hideFeatureButtonTapped:(id)sender
{
    if ([self.hideFeatureButton.titleLabel.text isEqualToString:@"⚪️"])
    {
        self.redBackgroundValueLabel.hidden = YES;
        self.greenBackgroundValueLabel.hidden = YES;
        self.blueBackgroundValueLabel.hidden = YES;
        self.alphaBackgroundValueLabel.hidden = YES;
        
        [self.hideFeatureButton setTitle:@"🔘" forState:UIControlStateNormal];
    }
    else if ([self.hideFeatureButton.titleLabel.text isEqualToString:@"🔘"])
        //this doesn't register often yet
    {
        self.redGoalValueLabel.hidden = YES;
        self.greenGoalValueLabel.hidden = YES;
        self.blueGoalValueLabel.hidden = YES;
        self.alphaGoalValueLabel.hidden = YES;
        
        [self.hideFeatureButton setTitle:@"⚫️" forState:UIControlStateNormal];
    }
    else
    {
        self.redBackgroundValueLabel.hidden = NO;
        self.greenBackgroundValueLabel.hidden = NO;
        self.blueBackgroundValueLabel.hidden = NO;
        self.alphaBackgroundValueLabel.hidden = NO;
        self.redGoalValueLabel.hidden = NO;
        self.greenGoalValueLabel.hidden = NO;
        self.blueGoalValueLabel.hidden = NO;
        self.alphaGoalValueLabel.hidden = NO;
        
        [self.hideFeatureButton setTitle:@"⚪️" forState:UIControlStateNormal];
    }
}

- (IBAction)dismissModalButtonTapped:(id)sender
{
    [self.delegate AMYColorGameViewControllerDidCancel:self];
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
    round out the stacks so they look prettier... can stacks be rounded?
    add label for color name, so if RGBA values aren't shown the target color name can still be
    set which options can be hidden
    set up values for each difficulty (increment, alpha starting value)

 more advanced stuff/issues:
 
    set up a tap counter to get score
    check out how it looks on other devices
    set up options for difficulty and hiding fields.  an options screen?
    randomize starter color--that can be another option (instead of default black background)
    a slider to control increment value for higher levels
    possible multiple views, one for each difficulty, so that I can customize the appearance and spacing for what's pertinent on each
    fill arrays with colors!
    take away alpha button for easy and medium colors
    five difficulties: very easy and easy have no alpha, medium has .25 increment alpha, hard has .1, and master has .05
    I can add an even more zen mode, where there is no target and you just press the buttons to make colors
 
    after three or so games, the buttons stop functioning properly
 */

/*
 v. easy: 15 taps or less par (.1 ea/tap)
            colors should only have values of 1
 easy: 25? taps or less (.05 ea/t with options of .1?)
            colors may have values of 1 or .5
 medium: 40? (.05/t w/ opt?)
            colors may have above values as well as .25, .75
            plus .2, .4, .6, .8
 hard: 60? (.02/ w/op of 0.5 and .1)
            values as above plus .1, .3, .7, .9, and all .05s
 master: 100? (.01 w/3op)
            colors may be any value (I feel like there should be another intermediary level
 */

/*
 All levels by values allowed:
    simple: values equiv only to 1              (simple)
            values equiv to 1 or .5             ()
            values above plus .2, .4, .6, .8    (challenging)
            above plus .1, .3, .7, .9           ()
            plus all .05s                       (difficult)
            plus everything                     (extreme)
 */

@end
