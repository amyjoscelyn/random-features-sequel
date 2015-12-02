//
//  AMYButtonCurveViewController.m
//  RandomFeaturesSequel
//
//  Created by Amy Joscelyn on 11/29/15.
//  Copyright © 2015 Amy Joscelyn. All rights reserved.
//

#import "AMYButtonCurveViewController.h"

@interface AMYButtonCurveViewController ()

@property (weak, nonatomic) IBOutlet UISlider *curveSliderValue;
@property (weak, nonatomic) IBOutlet UIButton *changeSliderTintButton;

@property (weak, nonatomic) IBOutlet UIView *trialView1;
@property (weak, nonatomic) IBOutlet UIView *trialView2;
@property (weak, nonatomic) IBOutlet UIView *trialView3;
@property (weak, nonatomic) IBOutlet UIView *trialView4;
@property (weak, nonatomic) IBOutlet UIView *trialView5;
@property (weak, nonatomic) IBOutlet UIView *trialView6;

@property (nonatomic) NSUInteger currentI;
@property (nonatomic) BOOL borderOn;
@property (nonatomic) NSUInteger zero;

@end

@implementation AMYButtonCurveViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.borderOn = NO;
    
    self.trialView1.clipsToBounds = YES;
    self.trialView2.clipsToBounds = YES;
    self.trialView3.clipsToBounds = YES;
    self.trialView4.clipsToBounds = YES;
    self.trialView5.clipsToBounds = YES;
    self.trialView6.clipsToBounds = YES;
    
    CGColorRef white = [UIColor whiteColor].CGColor;
    self.zero = 0;
    
    self.trialView1.layer.borderColor = white;
    self.trialView2.layer.borderColor = white;
    self.trialView3.layer.borderColor = white;
    self.trialView4.layer.borderColor = white;
    self.trialView5.layer.borderColor = white;
    self.trialView6.layer.borderColor = white;
    self.changeSliderTintButton.layer.borderColor = white;
}

//whoa! .tintColor changes ALL of the tints on the current view!! (when you've changed UIView.tintColor)

- (IBAction)sliderColorChangeButtonTapped:(id)sender
{
    UIColor *red = [UIColor redColor];
    UIColor *yellow = [UIColor yellowColor];
    UIColor *green = [UIColor greenColor];
    UIColor *purple = [UIColor purpleColor];
    UIColor *darkGray = [UIColor darkGrayColor];
    UIColor *blue = [UIColor blueColor];
    UIColor *cyan = [UIColor cyanColor];
    UIColor *orange = [UIColor orangeColor];
    
    NSArray *tintColors = @[ red, yellow, green, purple, darkGray, blue, cyan, orange ];
    
    NSUInteger i = arc4random_uniform((int)tintColors.count);
    
    while (i == self.currentI)
    {
        i = arc4random_uniform((int)tintColors.count);
    }
    UIColor *chosenColor = tintColors[i];
    self.curveSliderValue.tintColor = chosenColor;
    
    self.trialView1.backgroundColor = chosenColor;
    self.trialView2.backgroundColor = chosenColor;
    self.trialView3.backgroundColor = chosenColor;
    self.trialView4.backgroundColor = chosenColor;
    self.trialView5.backgroundColor = chosenColor;
    self.trialView6.backgroundColor = chosenColor;
    
    self.currentI = i;
}

- (IBAction)curveSliderValueChanged:(UISlider *)sender
{
    NSLog(@"slider value: %f", sender.value);
    self.changeSliderTintButton.layer.cornerRadius = sender.value * 10;
}

- (IBAction)trialButton1Tapped:(id)sender
{
    self.trialView1.layer.cornerRadius = self.zero;
    self.trialView2.layer.cornerRadius = self.zero;
    self.trialView3.layer.cornerRadius = self.zero;
    self.trialView4.layer.cornerRadius = self.zero;
    self.trialView5.layer.cornerRadius = self.zero;
    self.trialView6.layer.cornerRadius = self.zero;
}

- (IBAction)trialButton2Tapped:(id)sender
{
    if (self.borderOn)
    {
        self.trialView1.layer.borderWidth = self.zero;
        self.trialView2.layer.borderWidth = self.zero;
        self.trialView3.layer.borderWidth = self.zero;
        self.trialView4.layer.borderWidth = self.zero;
        self.trialView5.layer.borderWidth = self.zero;
        self.trialView6.layer.borderWidth = self.zero;
        self.changeSliderTintButton.layer.borderWidth = self.zero;
        
        self.borderOn = NO;
    }
    else
    {
        self.trialView1.layer.borderWidth = 3.0f;
        self.trialView2.layer.borderWidth = 3.0f;
        self.trialView3.layer.borderWidth = 3.0f;
        self.trialView4.layer.borderWidth = 3.0f;
        self.trialView5.layer.borderWidth = 3.0f;
        self.trialView6.layer.borderWidth = 3.0f;
        self.changeSliderTintButton.layer.borderWidth = 3.0f;
        
        self.borderOn = YES;
    }
}

- (IBAction)trialButton3Tapped:(id)sender
{
    self.trialView1.layer.cornerRadius = self.trialView1.frame.size.width;
    self.trialView2.layer.cornerRadius = self.trialView2.frame.size.width;
    self.trialView3.layer.cornerRadius = self.trialView3.frame.size.width;
    self.trialView4.layer.cornerRadius = self.trialView4.frame.size.width;
    self.trialView5.layer.cornerRadius = self.trialView5.frame.size.width;
    self.trialView6.layer.cornerRadius = self.trialView6.frame.size.width;
}

- (IBAction)trialButton4Tapped:(id)sender
{
    self.trialView1.layer.cornerRadius = self.trialView1.frame.size.height;
    self.trialView2.layer.cornerRadius = self.trialView2.frame.size.height;
    self.trialView3.layer.cornerRadius = self.trialView3.frame.size.height;
    self.trialView4.layer.cornerRadius = self.trialView4.frame.size.height;
    self.trialView5.layer.cornerRadius = self.trialView5.frame.size.height;
    self.trialView6.layer.cornerRadius = self.trialView6.frame.size.height;
}

- (IBAction)trialButton5Tapped:(id)sender
{
    self.trialView1.layer.cornerRadius = self.trialView1.frame.size.height/2;
    self.trialView2.layer.cornerRadius = self.trialView2.frame.size.height/2;
    self.trialView3.layer.cornerRadius = self.trialView3.frame.size.height/2;
    self.trialView4.layer.cornerRadius = self.trialView4.frame.size.height/2;
    self.trialView5.layer.cornerRadius = self.trialView5.frame.size.height/2;
    self.trialView6.layer.cornerRadius = self.trialView6.frame.size.height/2;
}

- (IBAction)trialButton6Tapped:(id)sender
{
    self.trialView1.layer.cornerRadius = self.trialView1.frame.size.width/2;
    self.trialView2.layer.cornerRadius = self.trialView2.frame.size.width/2;
    self.trialView3.layer.cornerRadius = self.trialView3.frame.size.width/2;
    self.trialView4.layer.cornerRadius = self.trialView4.frame.size.width/2;
    self.trialView5.layer.cornerRadius = self.trialView5.frame.size.width/2;
    self.trialView6.layer.cornerRadius = self.trialView6.frame.size.width/2;
}

@end
