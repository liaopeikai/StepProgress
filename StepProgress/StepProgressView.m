//
//  StepProgressView.m
//  StepProgress
//
//  Created by liaopeikai on 2016/10/26.
//  Copyright © 2016年 beichende. All rights reserved.
//

#import "StepProgressView.h"

static NSInteger targetNum;
static CGFloat progressNum;

@interface StepProgressView ()

@end

@implementation StepProgressView

- (instancetype)initWithFrame:(CGRect)frame targetNumber:(NSInteger)targetNumber{
    
    // 保存传进来的参数
    targetNum = targetNumber;
    
    StepProgressView *stepProgressView = [[StepProgressView alloc]initWithFrame:frame];
    [stepProgressView setBackgroundColor:[UIColor clearColor]];
    
    return stepProgressView;
}

- (void)setProgress:(CGFloat)progress{
    progressNum = progress;
}

- (void)drawRect:(CGRect)rect{
    
    // 线宽
    CGFloat lineWidth = 4.0f;
    // 圆的直径
    CGFloat circleDiameter = rect.size.height-lineWidth;
    // 节点间线段距离
    CGFloat distanceBetweenTwoPoints = (rect.size.width-(targetNum*rect.size.height))/(targetNum-1);
    
    NSLog(@"rect.size.width:%f",rect.size.width);
    NSLog(@"targetNum:%ld",(long)targetNum);
    NSLog(@"progressNum:%ld",(long)progressNum);
    NSLog(@"distanceBetweenTwoPoints:%f", distanceBetweenTwoPoints);
    
    for (NSInteger i = 0; i < targetNum; i ++) {
        // 获取上下文
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        // 画圈
        CGContextAddEllipseInRect(ctx, CGRectMake(lineWidth/2+(rect.size.height+distanceBetweenTwoPoints)*i, lineWidth/2, circleDiameter, circleDiameter));
        // 线的宽度
        CGContextSetLineWidth(ctx, lineWidth);
        // 颜色
        if (i < progressNum) {
            [[UIColor greenColor] set];
        }else{
            [[UIColor grayColor] set];
        }
        CGContextStrokePath(ctx);
        
        // 直线起点
        CGContextMoveToPoint(ctx, rect.size.height+(distanceBetweenTwoPoints+rect.size.height)*i, circleDiameter/2+lineWidth/2);
        // 终点
        CGContextAddLineToPoint(ctx, (distanceBetweenTwoPoints+rect.size.height)+(distanceBetweenTwoPoints+rect.size.height)*i, circleDiameter/2+lineWidth/2);
        // 颜色
        if (i < progressNum) {
            [[UIColor greenColor] set];
        }else{
            [[UIColor grayColor] set];
        }
        // 线的宽度
        CGContextSetLineWidth(ctx, lineWidth);
        // 起点和重点圆角
        CGContextSetLineCap(ctx, kCGLineCapRound);
        // 转角圆角
        CGContextSetLineJoin(ctx, kCGLineJoinRound);
        // 渲染（直线只能绘制空心的，不能调用CGContextFillPath(ctx);）
        CGContextStrokePath(ctx);
    }

}

@end
