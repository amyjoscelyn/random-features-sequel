//
//  AMYTestingColorsViewController.m
//  RandomFeaturesSequel
//
//  Created by Amy Joscelyn on 12/4/15.
//  Copyright © 2015 Amy Joscelyn. All rights reserved.
//

#import "AMYTestingColorsViewController.h"

@interface AMYTestingColorsViewController ()

@property (weak, nonatomic) IBOutlet UIView *colorView1;
@property (weak, nonatomic) IBOutlet UIView *colorView2;
@property (weak, nonatomic) IBOutlet UIView *colorView3;
@property (weak, nonatomic) IBOutlet UIView *colorView4;
@property (weak, nonatomic) IBOutlet UIView *colorView5;

@end

@implementation AMYTestingColorsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIColor *color1 = [UIColor colorWithRed:1 green:0 blue:.5 alpha:1];
    UIColor *color2 = [UIColor colorWithRed:1 green:.5 blue:.5 alpha:1];
    UIColor *color3 = [UIColor colorWithRed:1 green:.5 blue:1 alpha:1];
    UIColor *color4 = [UIColor colorWithRed:1 green:1 blue:.5 alpha:1];
    UIColor *color5 = [UIColor colorWithRed:.5 green:1 blue:1 alpha:1];
    
    self.colorView1.backgroundColor = color1;
    self.colorView2.backgroundColor = color2;
    self.colorView3.backgroundColor = color3;
    self.colorView4.backgroundColor = color4;
    self.colorView5.backgroundColor = color5;
    

    /*
     0|0|0|1    black
     0|0|5|1    royalBlue
     0|0|1|1    blue
     0|5|0|1    deepGreen
     0|5|5|1    seaGreen
     0|5|1|1    mildBlue
     0|1|0|1    green
     0|1|5|1    brightGreen
     0|1|1|1    cyan
     5|0|0|1    royalRed
     5|0|5|1    purple
     5|0|1|1    brightPurple
     5|5|0|1    weedGreen
     5|5|5|1    gray
     5|5|1|1    periwinkle
     5|1|0|1    lime
     5|1|5|1    softGreen
     5|1|1|1    skyBlue
     1|0|0|1    red
     1|0|5|1
     1|0|1|1    magenta
     1|5|0|1    orange
     1|5|5|1
     1|5|1|1
     1|1|0|1    yellow
     1|1|5|1
     1|1|1|1    white
    */
    
    /*
     .2 .5 0 1
     .2 .5 .5 1
     .8 .5 .5 1
     .8 .5 .7 1
     .8 .5 .9 1
     .8 .8 .9 1
     1 .8 .9 1
     1 .5 .9 1
     1 .2 .9 1
     1 .2 .7 1
     1 .2 .5 1
     1 0 .5 1
     .8 0 .5 1
     .6 0 .5 1
     .5 0 .5 1
     .3 0 .5 1
     .2 0 .5 1
     0 .3 .5 1
     0 .5 .5 1
     0 .65 .5 1
     0 .8 .5 1
     0 1 .5 1
     0 1 .2 1
     .2 .7 .2 1
     .5 .7 .2 1
     .8 .7 .2 1
     1 .7 0 1
     .3 0 .65 .9
     */
}

@end
