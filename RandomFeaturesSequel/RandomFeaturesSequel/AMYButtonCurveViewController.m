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
    self.curveSliderValue.tintColor = tintColors[i];
    self.currentI = i;
}

- (IBAction)curveSliderValueChanged:(UISlider *)sender
{
    NSLog(@"slider value: %f", sender.value);
    self.changeSliderTintButton.layer.cornerRadius = sender.value * 10;
}

@end
