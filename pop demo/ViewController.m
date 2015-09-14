//
//  ViewController.m
//  pop demo
//
//  Created by Bechir Arfaoui on 5/15/14.
//  Copyright (c) 2014 Bechir Arfaoui. All rights reserved.
//

#import "ViewController.h"
#import <pop/POP.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //we need to prepare an object to animate , in this case a button should be cool
    self.button = [[UIButton alloc]initWithFrame:CGRectMake(100, 150, 80, 40)];
    
    //background color so we can see the animation effect clearly
    self.button.backgroundColor = [UIColor colorWithRed:63/255.0f green:162/255.0f blue:227.0/255.0f alpha:1.0];
    
    //fancy rounded corners
    self.button.layer.cornerRadius =5.0f;
    
    //add some text the button
    [self.button setTitle:@"POP Me" forState:UIControlStateNormal];
    
    //some color for the button text
    self.button.titleLabel.textColor = [UIColor whiteColor];
    
    //adding an action to trigger the animation
    [self.button addTarget:self
               action:@selector(buttonAction:)
     forControlEvents:UIControlEventTouchUpInside];
    
    //adding a button to the view
    [self.view addSubview:self.button];
}

-(IBAction)buttonAction:(id)sender{
    
    POPSpringAnimation *buttonAnimation = [POPSpringAnimation animation];
    
    buttonAnimation.property = [POPAnimatableProperty propertyWithName:kPOPViewFrame]; 
    /* here my choice was to animate the frame so i need to use kPOPViewFrame, here is the list of properties that you can animate :

     kPOPLayerBackgroundColor;
     kPOPLayerBounds;
     kPOPLayerPosition;
     kPOPLayerPositionX;
     kPOPLayerPositionY;
     kPOPLayerOpacity;
     kPOPLayerScaleX;
     kPOPLayerScaleY;
     kPOPLayerScaleXY;
     kPOPLayerTranslationX;
     kPOPLayerTranslationY;
     kPOPLayerTranslationZ;
     kPOPLayerTranslationXY;
     kPOPLayerSubscaleXY;
     kPOPLayerSubtranslationX;
     kPOPLayerSubtranslationY;
     kPOPLayerSubtranslationZ;
     kPOPLayerSubtranslationXY;
     kPOPLayerZPosition;
     kPOPLayerSize;
     kPOPLayerRotation;
     kPOPLayerRotationY;
     kPOPLayerRotationX;
     
     kPOPViewAlpha;
     kPOPViewBackgroundColor;
     kPOPViewBounds;
     kPOPViewCenter;
     kPOPViewFrame;
     kPOPViewScaleX;
     kPOPViewScaleXY;
     kPOPViewScaleY;
     kPOPViewSize; */
    
    // i check the poped Bool to see in wish state is the button
    if (poped) {
        poped = FALSE;
        buttonAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(100, 150, 80, 40)];
    }
    else{
        poped = TRUE;
        buttonAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(100, 150, 120, 60)];
    }
    
    // physics properties
    buttonAnimation.springBounciness = 10.0;
    buttonAnimation.springSpeed = 1.0;
    buttonAnimation.dynamicsMass = 1.0;
    
    // or for more advanced control
    //    popAnimation.dynamicsTension = 15.0;
    //    popAnimation.dynamicsFriction = 2.0;

  
    
    //apply the animation to the object we want in this case it's the sender (the button)
    [sender pop_addAnimation:buttonAnimation forKey:@"pop"];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
