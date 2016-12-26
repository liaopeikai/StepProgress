//
//  DynamicStepProgressView.h
//  StepProgress
//
//  Created by liaopeikai on 2016/12/7.
//  Copyright © 2016年 beichende. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DynamicStepProgressView : UIView
/*
 *  frame:传入的CGRect决定了progressView的位置及大小
 *  targetNumber:传入时间节点数目
 */
- (instancetype)initWithFrame:(CGRect)frame targetNumber:(NSInteger)targetNumber;

/*
 *  progress:当前进度 (传入整数 例:5)
 */
- (void)setProgress:(CGFloat)progress;


@end
