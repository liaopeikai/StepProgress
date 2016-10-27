//
//  StepProgressView.h
//  StepProgress
//
//  Created by liaopeikai on 2016/10/26.
//  Copyright © 2016年 beichende. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StepProgressView : UIView

/*
 *  frame:传入的CGRect决定了progressView的位置及大小
 *  withTitleArray:传入节点数组
 */
- (instancetype)initWithFrame:(CGRect)frame withTitleArray:(NSArray *)titleArray;

/*
 *  progress:当前进度
 */
-(void)setProgress:(CGFloat)progress;


@end
