//
//  ViewController.m
//  StepProgress
//
//  Created by liaopeikai on 2016/10/26.
//  Copyright © 2016年 beichende. All rights reserved.
//

#import "ViewController.h"
#import "StepProgressView.h"
#import "DynamicStepProgressView.h"

@interface ViewController ()

@property(nonatomic, strong) NSTimer *timer;
@property(nonatomic, strong) StepProgressView *stepView;
@property(nonatomic, strong) DynamicStepProgressView *dynamicView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [self.view addSubview:self.stepView];
    [self.view addSubview:self.dynamicView];
    
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateProgress:) userInfo:nil repeats:YES];
}

- (void)updateProgress:(NSTimer *)timer
{
    static CGFloat progress = 0.f;
    progress += 0.1f;
    [self.stepView setProgress:progress];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Getter mehod
- (StepProgressView *)stepView
{
    if (!_stepView) {
        CGRect frame = CGRectMake(10, 300, self.view.bounds.size.width - 20, 25);
        _stepView = [[StepProgressView alloc] initWithFrame:frame targetNumber:5];
        [_stepView setProgress:0];
    }
    return _stepView;
}

- (DynamicStepProgressView *)dynamicView
{
    if (!_dynamicView) {
        CGRect frame = CGRectMake(10, 100, self.view.bounds.size.width - 20, 25);
        _dynamicView = [[DynamicStepProgressView alloc] initWithFrame:frame targetNumber:5];
        [_dynamicView setProgress:4];
        
    }
    return _dynamicView;
}


@end
