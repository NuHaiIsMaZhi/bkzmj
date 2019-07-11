//
//  LoopProgressView.m
//  头像蒙板
//
//  Created by CUG on 16/1/29.
//  Copyright © 2016年 CUG. All rights reserved.
//

#import "LoopProgressView.h"
#import <QuartzCore/QuartzCore.h>

#define ViewWidth self.frame.size.width   //环形进度条的视图宽度
#define ProgressWidth 5                 //环形进度条的圆环宽度
#define Radius ViewWidth/2-ProgressWidth  //环形进度条的半径
#define RGBA(r, g, b, a)   [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:(a)]
#define RGB(r, g, b)        RGBA(r, g, b, 1.0)

@interface LoopProgressView()
{
    CAShapeLayer *arcLayer;
    UILabel *label;
    NSTimer *progressTimer;
}
@property (nonatomic,assign)CGFloat i;

@end

@implementation LoopProgressView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    _i=0;
    CGContextRef progressContext = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(progressContext, ProgressWidth);
    CGContextSetRGBStrokeColor(progressContext, 246/255.0, 246/255.0, 246/255.0, 1);
    
    CGFloat xCenter = rect.size.width * 0.5;
    CGFloat yCenter = rect.size.height * 0.5;
    
    //绘制环形进度条底框
    CGContextAddArc(progressContext, xCenter, yCenter, Radius, 0, 2*M_PI, 0);
    CGContextDrawPath(progressContext, kCGPathStroke);
    
    //    //绘制环形进度环
    CGFloat to = - M_PI * 0.5 + self.progress * M_PI *2; // - M_PI * 0.5为改变初始位置
    
    // 进度数字字号,可自己根据自己需要，从视图大小去适配字体字号
    int fontNum = ViewWidth/6;
    int weight = ViewWidth - ProgressWidth*2;
    label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, weight, ViewWidth/6)];
    label.center = CGPointMake(xCenter, yCenter);
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:fontNum];
    label.textColor = RGB(51, 51, 51);
    label.text = @"0%";
//    [self addSubview:label];
    
    UIBezierPath *path=[UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(xCenter,yCenter) radius:Radius startAngle:- M_PI * 0.5 endAngle:to clockwise:YES];
    arcLayer=[CAShapeLayer layer];
    arcLayer.path=path.CGPath;//46,169,230
    arcLayer.fillColor = [UIColor clearColor].CGColor;
    arcLayer.strokeColor=[UIColor colorWithRed:255/255.0 green:91/255.0 blue:96/255.0 alpha:0.5].CGColor;
    arcLayer.lineWidth=ProgressWidth;
    arcLayer.lineCap = @"round";
    arcLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.layer addSublayer:arcLayer];
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        [self drawLineAnimation:arcLayer];
    });
    
    if (self.progress > 1) {
        NSLog(@"传入数值范围为 0-1");
        self.progress = 1;
    }else if (self.progress < 0){
        NSLog(@"传入数值范围为 0-1");
        self.progress = 0;
        return;
    }
}

//定义动画过程
-(void)drawLineAnimation:(CALayer*)layer
{
    CABasicAnimation *bas=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    bas.duration=0;//动画时间
    bas.delegate=self;
    bas.fromValue=[NSNumber numberWithInteger:0];
    bas.toValue=[NSNumber numberWithInteger:1];
    [layer addAnimation:bas forKey:@"key"];
}

@end
