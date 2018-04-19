//
//  ViewController.h
//  objectiveCAnimation
//
//  Created by Barrett Breshears on 6/29/14.
//  Copyright (c) 2014 Barrett Breshears. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIButton *animationOption1;
@property (nonatomic, strong) IBOutlet UIButton *animationOption2;
@property (nonatomic, strong) IBOutlet UIButton *animateBtn;
@property (nonatomic, strong) IBOutlet UIButton *pickerSelectBtn;


@property (nonatomic, strong) IBOutlet UIView *view1;
@property (nonatomic, strong) IBOutlet UIView *view2;

@property (nonatomic, strong) IBOutlet UIPickerView *animationPicker;

@property (nonatomic, assign) UIViewAnimationOptions animation1;
@property (nonatomic, assign) UIViewAnimationOptions animation2;

@property (nonatomic, strong) NSArray *animationNames;

@property (nonatomic, assign) BOOL animationInProgress;

-(IBAction)selectAnimation1:(id)sender;
-(IBAction)selectAnimation2:(id)sender;
-(IBAction)animateViews:(id)sender;

@end
