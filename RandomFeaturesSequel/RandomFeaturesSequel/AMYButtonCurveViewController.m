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

@end

@implementation AMYButtonCurveViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
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
    //revert to original shape
}

- (IBAction)trialButton2Tapped:(id)sender
{
    if (self.borderOn)
    {
        //turn off borders
    }
    else
    {
    self.trialView1.layer.borderWidth = 3.0f;
    self.trialView2.layer.borderWidth = 3.0f;
    self.trialView3.layer.borderWidth = 3.0f;
    self.trialView4.layer.borderWidth = 3.0f;
    self.trialView5.layer.borderWidth = 3.0f;
    self.trialView6.layer.borderWidth = 3.0f;
    
    self.trialView1.layer.borderColor = [UIColor whiteColor].CGColor;
    self.trialView2.layer.borderColor = [UIColor whiteColor].CGColor;
    self.trialView3.layer.borderColor = [UIColor whiteColor].CGColor;
    self.trialView4.layer.borderColor = [UIColor whiteColor].CGColor;
    self.trialView5.layer.borderColor = [UIColor whiteColor].CGColor;
    self.trialView6.layer.borderColor = [UIColor whiteColor].CGColor;
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
    
    self.trialView1.clipsToBounds = YES;
    self.trialView2.clipsToBounds = YES;
    self.trialView3.clipsToBounds = YES;
    self.trialView4.clipsToBounds = YES;
    self.trialView5.clipsToBounds = YES;
    self.trialView6.clipsToBounds = YES;
}

- (IBAction)trialButton4Tapped:(id)sender
{
    self.trialView1.layer.cornerRadius = self.trialView1.frame.size.height;
    self.trialView2.layer.cornerRadius = self.trialView2.frame.size.height;
    self.trialView3.layer.cornerRadius = self.trialView3.frame.size.height;
    self.trialView4.layer.cornerRadius = self.trialView4.frame.size.height;
    self.trialView5.layer.cornerRadius = self.trialView5.frame.size.height;
    self.trialView6.layer.cornerRadius = self.trialView6.frame.size.height;
    
    self.trialView1.clipsToBounds = YES;
    self.trialView2.clipsToBounds = YES;
    self.trialView3.clipsToBounds = YES;
    self.trialView4.clipsToBounds = YES;
    self.trialView5.clipsToBounds = YES;
    self.trialView6.clipsToBounds = YES;
}

- (IBAction)trialButton5Tapped:(id)sender
{
    self.trialView1.layer.cornerRadius = self.trialView1.frame.size.height/2;
    self.trialView2.layer.cornerRadius = self.trialView2.frame.size.height/2;
    self.trialView3.layer.cornerRadius = self.trialView3.frame.size.height/2;
    self.trialView4.layer.cornerRadius = self.trialView4.frame.size.height/2;
    self.trialView5.layer.cornerRadius = self.trialView5.frame.size.height/2;
    self.trialView6.layer.cornerRadius = self.trialView6.frame.size.height/2;
    
    self.trialView1.clipsToBounds = YES;
    self.trialView2.clipsToBounds = YES;
    self.trialView3.clipsToBounds = YES;
    self.trialView4.clipsToBounds = YES;
    self.trialView5.clipsToBounds = YES;
    self.trialView6.clipsToBounds = YES;
}

- (IBAction)trialButton6Tapped:(id)sender
{
    self.trialView1.layer.cornerRadius = self.trialView1.frame.size.width/2;
    self.trialView2.layer.cornerRadius = self.trialView2.frame.size.width/2;
    self.trialView3.layer.cornerRadius = self.trialView3.frame.size.width/2;
    self.trialView4.layer.cornerRadius = self.trialView4.frame.size.width/2;
    self.trialView5.layer.cornerRadius = self.trialView5.frame.size.width/2;
    self.trialView6.layer.cornerRadius = self.trialView6.frame.size.width/2;
    
    self.trialView1.clipsToBounds = YES;
    self.trialView2.clipsToBounds = YES;
    self.trialView3.clipsToBounds = YES;
    self.trialView4.clipsToBounds = YES;
    self.trialView5.clipsToBounds = YES;
    self.trialView6.clipsToBounds = YES;
}

@end
