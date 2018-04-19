//
//  ViewController.m
//  objectiveCAnimation
//
//  Created by Barrett Breshears on 6/29/14.
//  Copyright (c) 2014 Barrett Breshears. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) UIViewController *mainView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    
    [super viewDidLoad];
    _animationPicker.hidden = YES;
    _pickerSelectBtn.hidden = YES;
    
    [_animationOption1 setTitle:@"UIViewAnimationOptionTransitionNone" forState:UIControlStateNormal];
    _animation1 = UIViewAnimationOptionTransitionNone;
    
    [_animationOption2 setTitle:@"UIViewAnimationOptionTransitionNone" forState:UIControlStateNormal];
    _animation2 = UIViewAnimationOptionTransitionNone;
    
    _animationNames = [[NSArray alloc] initWithObjects: @"UIViewAnimationOptionCurveEaseInOut", @"UIViewAnimationOptionCurveEaseIn", @"UIViewAnimationOptionCurveEaseOut", @"UIViewAnimationOptionCurveLinear", @"UIViewAnimationOptionTransitionNone", nil];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)addAnimations{
    // animation 1
    [UIView animateKeyframesWithDuration:0.5
                                   delay:0.0
                                 options:_animation1
                              animations:^{
                                _view1.frame = CGRectMake(_view1.frame.origin.x + 200, _view1.frame.origin.y, _view1.frame.size.width, _view1.frame.size.height);
                              }
                              completion:^(BOOL finished) {
                                  [UIView animateKeyframesWithDuration:0.5
                                                                 delay:0.0
                                                               options:_animation1
                                                            animations:^{
                                                                _view1.frame = CGRectMake(_view1.frame.origin.x - 200, _view1.frame.origin.y, _view1.frame.size.width, _view1.frame.size.height);
                                                            }
                                                            completion:^(BOOL finished) {
                                                                _animationInProgress = NO;
                                                            }];
                              }];
    // animation 2
    [UIView animateKeyframesWithDuration:0.5
                                   delay:0.0
                                 options:_animation2
                              animations:^{
                                  _view2.frame = CGRectMake(_view2.frame.origin.x + 200, _view2.frame.origin.y, _view2.frame.size.width, _view2.frame.size.height);
                              }
                              completion:^(BOOL finished) {
                                  [UIView animateKeyframesWithDuration:0.5
                                                                 delay:0.0
                                                               options:_animation2
                                                            animations:^{
                                                                _view2.frame = CGRectMake(_view2.frame.origin.x - 200, _view2.frame.origin.y, _view2.frame.size.width, _view2.frame.size.height);
                                                            }
                                                            completion:^(BOOL finished) {
                                                                _animationInProgress = NO;
                                                            }];
                              }];
}


- (UIViewAnimationOptions)getAnimation:(NSString *) animationName{
    
   if([animationName isEqualToString:@"UIViewAnimationOptionCurveEaseInOut"]) {
        return UIViewAnimationOptionCurveEaseInOut;
    }else if([animationName isEqualToString:@"UIViewAnimationOptionCurveEaseInOut"]) {
        return UIViewAnimationOptionCurveEaseInOut;
    }else if([animationName isEqualToString:@"UIViewAnimationOptionCurveEaseInOut"]) {
        return UIViewAnimationOptionCurveEaseInOut;
    }else if([animationName isEqualToString:@"UIViewAnimationOptionCurveEaseIn"]) {
        return UIViewAnimationOptionCurveEaseIn;
    }else if([animationName isEqualToString:@"UIViewAnimationOptionCurveEaseOut"]) {
        return UIViewAnimationOptionCurveEaseOut;
    }else if([animationName isEqualToString:@"UIViewAnimationOptionCurveLinear"]) {
        return UIViewAnimationOptionCurveLinear;
    }else {
        return UIViewAnimationOptionTransitionNone;
    }
}

-(IBAction)selectAnimation1:(id)sender{
    
    _animationPicker.hidden = NO;
    _pickerSelectBtn.hidden = NO;
    [_pickerSelectBtn addTarget:self action:@selector(setAnimation1) forControlEvents:UIControlEventTouchUpInside];
}


-(IBAction)selectAnimation2:(id)sender{
    _animationPicker.hidden = NO;;
    _pickerSelectBtn.hidden = NO;
    [_pickerSelectBtn addTarget:self action:@selector(setAnimation2) forControlEvents:UIControlEventTouchUpInside];
}

-(IBAction)animateViews:(id)sender{
    if (_animationInProgress) {
        return;
    }
    
    _animationInProgress = YES;
    [self addAnimations];
}

- (void)setAnimation1{
    
    [_animationOption1 setTitle:[_animationNames objectAtIndex:[_animationPicker selectedRowInComponent:0]] forState:UIControlStateNormal];
    _animation1 = [self getAnimation:[_animationNames objectAtIndex:[_animationPicker selectedRowInComponent:0]]];
    [_pickerSelectBtn removeTarget:self action:@selector(setAnimation1) forControlEvents:UIControlEventTouchUpInside];
    _animationPicker.hidden = YES;
    _pickerSelectBtn.hidden = YES;
}

- (void)setAnimation2{
    [_animationOption2 setTitle:[_animationNames objectAtIndex:[_animationPicker selectedRowInComponent:0]] forState:UIControlStateNormal];
    _animation2 = [self getAnimation:[_animationNames objectAtIndex:[_animationPicker selectedRowInComponent:0]]];
    [_pickerSelectBtn removeTarget:self action:@selector(setAnimation2) forControlEvents:UIControlEventTouchUpInside];
    _animationPicker.hidden = YES;
    _pickerSelectBtn.hidden = YES;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [_animationNames count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
    
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    UILabel *retval = (id)view;
    if (!retval) {
        retval= [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, [pickerView rowSizeForComponent:component].width, [pickerView rowSizeForComponent:component].height)];
    }
    retval.text = [_animationNames objectAtIndex:row];
    retval.font = [UIFont systemFontOfSize:14];
    return retval;
}

@end
