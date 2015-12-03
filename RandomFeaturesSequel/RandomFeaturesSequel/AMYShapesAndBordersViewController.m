//
//  AMYShapesAndBordersViewController.m
//  RandomFeaturesSequel
//
//  Created by Amy Joscelyn on 12/2/15.
//  Copyright © 2015 Amy Joscelyn. All rights reserved.
//

#import "AMYShapesAndBordersViewController.h"

@interface AMYShapesAndBordersViewController ()

@property (weak, nonatomic) IBOutlet UIStepper *widthStepper;
@property (weak, nonatomic) IBOutlet UIStepper *heightStepper;
@property (weak, nonatomic) IBOutlet UIButton *clearCornersButton;

@property (weak, nonatomic) IBOutlet UIStepper *borderFrameStepper;
@property (weak, nonatomic) IBOutlet UIStepper *borderColorStepper;
@property (weak, nonatomic) IBOutlet UIButton *noBorderButton;

@property (weak, nonatomic) IBOutlet UIStepper *shadowSizeStepper;
@property (weak, nonatomic) IBOutlet UIStepper *shadowColorStepper;
@property (weak, nonatomic) IBOutlet UIButton *noShadowButton;

@property (strong, nonatomic) NSArray *buttonsToChange;
@property (strong, nonatomic) NSArray *steppersToChange;
@property (strong, nonatomic) NSArray *colorsArray;

@end

@implementation AMYShapesAndBordersViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpArrayOfColors];
    
    self.widthStepper.continuous = YES;
    self.heightStepper.continuous = YES;
    self.borderFrameStepper.continuous = YES;
    self.borderColorStepper.continuous = YES;
    
    self.widthStepper.minimumValue = 0;
    self.widthStepper.maximumValue = self.clearCornersButton.frame.size.width;
    
    self.heightStepper.minimumValue = 0;
    self.heightStepper.maximumValue = self.clearCornersButton.frame.size.height;
    
    self.borderFrameStepper.minimumValue = 0;
    self.borderFrameStepper.maximumValue = 8;
    self.borderFrameStepper.stepValue = 0.5;
    
    self.borderColorStepper.minimumValue = 0;
    self.borderColorStepper.maximumValue = self.colorsArray.count - 1;
    
    self.buttonsToChange = @[ self.clearCornersButton, self.noBorderButton, self.noShadowButton ];
    
    self.steppersToChange = @[ self.widthStepper, self.heightStepper, self.borderFrameStepper, self.borderColorStepper, self.shadowSizeStepper, self.shadowColorStepper ];
}

- (void)setUpArrayOfColors
{
    UIColor *brown = [UIColor brownColor];
    UIColor *magenta = [UIColor magentaColor];
    UIColor *red = [UIColor redColor];
    UIColor *orange = [UIColor orangeColor];
    UIColor *yellow = [UIColor yellowColor];
    UIColor *green = [UIColor greenColor];
    UIColor *cyan = [UIColor cyanColor];
    UIColor *blue = [UIColor blueColor];
    UIColor *purple = [UIColor purpleColor];
    UIColor *black = [UIColor blackColor];
    UIColor *darkGray = [UIColor darkGrayColor];
    UIColor *lightGray = [UIColor lightGrayColor];
    UIColor *white = [UIColor whiteColor];
    
    self.colorsArray = @[ brown, magenta, red, orange, yellow, green, cyan, blue, purple, black, darkGray, lightGray, white ];
}

- (void)setStepValue:(CGFloat)currentStepperValue forSender:(UIStepper *)sender
{
    CGFloat i = currentStepperValue;
    
    if (i < 2)
    {
        sender.stepValue = 0.1;
    }
    else if (i < 5)
    {
        sender.stepValue = 0.3;
    }
    else if (i < 8)
    {
        sender.stepValue = 0.5;
    }
    else if (i < 10)
    {
        sender.stepValue = 1;
    }
    else
    {
        sender.stepValue = 5;
    }
}

- (IBAction)widthStepperValueChanged:(UIStepper *)sender
{
    CGFloat i = sender.value;
    [self setStepValue:i forSender:sender];
    
    for (UIButton *button in self.buttonsToChange)
    {
        button.layer.cornerRadius = button.frame.size.width/i;
        button.layer.masksToBounds = YES;
    }
}

- (IBAction)heightStepperValueChanged:(UIStepper *)sender
{
    CGFloat i = sender.value;
    [self setStepValue:i forSender:sender];
    
    for (UIButton *button in self.buttonsToChange)
    {
        button.layer.cornerRadius = button.frame.size.height/i;
        button.layer.masksToBounds = YES;
    }
}

- (IBAction)clearCornersButtonTapped:(UIButton *)sender
{
    for (UIButton *button in self.buttonsToChange)
    {
        button.layer.cornerRadius = 0;
        button.layer.masksToBounds = NO;
    }
}

- (IBAction)borderFrameStepperValueChanged:(UIStepper *)sender
{
    CGFloat i = sender.value;
    
    for (UIButton *button in self.buttonsToChange)
    {
        button.layer.borderWidth = i;
    }
    for (UIStepper *stepper in self.steppersToChange)
    {
        stepper.layer.borderWidth = i;
    }
}

- (IBAction)borderColorStepperValueChanged:(UIStepper *)sender
{
    NSUInteger c = sender.value;
    
    UIColor *color = self.colorsArray[c];
    
    for (UIButton *button in self.buttonsToChange)
    {
        button.layer.borderColor = color.CGColor;
    }
    for (UIStepper *stepper in self.steppersToChange)
    {
        stepper.tintColor = color;
        stepper.layer.borderColor = color.CGColor;
    }
}

- (IBAction)noBorderButtonTapped:(UIButton *)sender
{
    for (UIButton *button in self.buttonsToChange)
    {
        button.layer.borderWidth = 0;
    }
    for (UIStepper *stepper in self.steppersToChange)
    {
        stepper.tintColor = nil;
        stepper.layer.borderWidth = 0;
    }
}

- (IBAction)shadowSizeStepperValueChanged:(UIStepper *)sender
{
    //shadows might require another view
}

- (IBAction)shadowColorStepperValueChanged:(UIStepper *)sender
{
    
}

- (IBAction)noShadowButtonTapped:(UIButton *)sender
{
    
}



/*
 so what I would like to do is have a series (maybe 12?) of buttons on the screen.  They should each have an ability--yes, 3 in a row, 4 in a column.  The first should increase something, the second should decrease it (vice versa), and the third should revert it back to normal.
 
 One row should be entirely about changing the shapes of the buttons--more and more round (change the .height/#--from 1-5, maybe.  6?).  There can be a switch or something for height vs width, or this can be relegated to two rows.
 
 Another row should be for setting borders.  It changes the size of them.  Or maybe there should be two steppers in that row-- + to increase the size of the border frame, - to decrease it.  Another one changes the colors, perhaps based off of the colors of the rainbow.  Something simple.  Maybe even a randomizer, but if I'm using a stepper it should be a fixed known.
 
 Another row then can be adjusting the shadow visible--one stepper for shadow size, one for shadow color, one to clear it entirely.
 
 If I have a row left at this point, I might be able to do another effect with these buttons--opacity perhaps, or their actual size--animate them larger or smaller--or add a gradient or a shimmer or a shine or something.  Something standalone, preferably, where it can work with shadows and borders and shapes and stuff or not.  Hahaha maybe they can jiggle :)
 */

@end
