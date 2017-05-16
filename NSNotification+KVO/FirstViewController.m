//
//  FirstViewController.m
//  NSNotification+KVO
//
//  Created by Rushan on 2017-05-16.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIStepper *stepper;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.stepper.stepValue = 1;
    
    [self stepperTapped:self.stepper];
    
}


- (IBAction)stepperTapped:(UIStepper *)sender {
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    //sends data
    NSNotification *stepperNotification = [[NSNotification alloc] initWithName:@"newNotification" object:self userInfo:@{ @"stepperValue" : @(sender.value) }];
    [notificationCenter postNotification:stepperNotification];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
