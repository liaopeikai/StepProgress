//
//  ViewController.m
//  StepProgress
//
//  Created by liaopeikai on 2016/10/26.
//  Copyright © 2016年 beichende. All rights reserved.
//

#import "ViewController.h"
#import "StepProgressView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *titleArr=@[@"申请受理",@"资料处理",@"审核中",@"审核完成"];
    StepProgressView *stepView = [[StepProgressView alloc]init];
    stepView = [stepView initWithFrame:CGRectMake(10, 100, self.view.bounds.size.width-20, 60) withTitleArray:titleArr];
    [stepView setProgress:2];
    
    [self.view addSubview:stepView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
