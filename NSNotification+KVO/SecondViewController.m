//
//  SecondViewController.m
//  NSNotification+KVO
//
//  Created by Rushan on 2017-05-16.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;
@property (nonatomic) NSString *counterLabelValue;


@end

@implementation SecondViewController

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self =[super initWithCoder:aDecoder]){
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLabelFromNotification:) name:@"newNotification" object:nil];
        _counterLabelValue = [[NSString alloc]init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    self.counterLabel.text = self.counterLabelValue;
}

-(void)updateLabelFromNotification:(NSNotification *)notification{
    self.counterLabelValue = [notification.userInfo[@"stepperValue"] stringValue];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
