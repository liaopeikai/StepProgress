//
//  StepProgressView.m
//  StepProgress
//
//  Created by liaopeikai on 2016/10/26.
//  Copyright © 2016年 beichende. All rights reserved.
//

#import "StepProgressView.h"

static const float imgBtnWidth = 18;

@interface StepProgressView ()

@property (nonatomic,strong) UIProgressView *progressView;

// 用来存放按钮,用UIButton防止以后有点击事件
@property (nonatomic,strong) NSMutableArray *imgBtnArray;

@end

@implementation StepProgressView


- (instancetype)initWithFrame:(CGRect)frame withTitleArray:(NSArray *)titleArray
{
    StepProgressView *stepProgressView = [[StepProgressView alloc]initWithFrame:frame];
    // 进度条
    stepProgressView.progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(36, 5, frame.size.width-72, 10)];
    stepProgressView.progressView.progressViewStyle = UIProgressViewStyleBar;
    stepProgressView.progressView.transform = CGAffineTransformMakeScale(1.0f,2.0f);
    stepProgressView.progressView.progressTintColor = [UIColor greenColor];
    stepProgressView.progressView.trackTintColor = [UIColor lightGrayColor];
    
    [stepProgressView addSubview:stepProgressView.progressView];
    
    stepProgressView.imgBtnArray = [[NSMutableArray alloc]init];
    float _btnWidth = frame.size.width/(titleArray.count);
    for(int i = 0; i < titleArray.count; i++) {
        // 图片按钮
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"0.png"] forState:UIControlStateSelected];
        btn.frame = CGRectMake(_btnWidth/2+_btnWidth*i-imgBtnWidth/2, 0, imgBtnWidth, imgBtnWidth);
        btn.selected = NO;
        
        [stepProgressView addSubview:btn];
        [stepProgressView.imgBtnArray addObject:btn];
        
        // 文字
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(btn.center.x-_btnWidth/2, frame.size.height-20, _btnWidth, 20)];
        titleLabel.text = [titleArray objectAtIndex:i];
        [titleLabel setTextColor:[UIColor blackColor]];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:18];
        [stepProgressView addSubview:titleLabel];
    }
    return stepProgressView;
}


-(void)setProgress:(CGFloat)progress
{
    // stepIndex默认为－1 小于－1为－1 大于总数为总数
    progress = progress<-1?-1:progress;
    progress = progress>=(NSInteger)_imgBtnArray.count-1?_imgBtnArray.count-1:progress;
    
    float _btnWidth = self.bounds.size.width/(_imgBtnArray.count);
    for(int i = 0; i < _imgBtnArray.count; i++) {
        UIButton *btn = [_imgBtnArray objectAtIndex:i];
        if (i <= progress) {
            btn.selected = YES;
        }
        else{
            btn.selected = NO;
        }
    }
    if(progress == -1) {
        self.progressView.progress = 0.0;
    }
    else if(progress == _imgBtnArray.count-1)
    {
        self.progressView.progress = 1.0;
    }
    else
    {
        self.progressView.progress = (0.5+progress)*_btnWidth/self.frame.size.width;
    }
}


@end
