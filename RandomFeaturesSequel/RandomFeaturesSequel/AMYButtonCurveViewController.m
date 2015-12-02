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



@end
