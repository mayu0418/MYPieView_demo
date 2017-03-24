//
//  MYPieView.m
//  MY_iOS_test
//
//  Created by apple on 16/6/29.
//  Copyright © 2016年 MY. All rights reserved.
//

#import "MYPieView.h"

@implementation MYPieModel

@end


@implementation MYPieView

-(id)initWithFrame:(CGRect)frame withStrokeWidth:(CGFloat )width andPerArray:(NSArray *)perArray
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat strokeWidth = width;
        CGPoint centerPoint = CGPointMake(self.bounds.size.width /2, self.bounds.size.height /2);
        CGFloat radius;
        if (self.bounds.size.width <= self.bounds.size.height) {
            radius = (self.bounds.size.width -10)/2;
        }
        else
        {
            radius = (self.bounds.size.height -10)/2;
        }
        UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:centerPoint radius:radius startAngle:-M_PI_2 endAngle:M_PI_2*3 clockwise:YES];

        CGFloat startPer = 0;
        double totalNum = 0;
        for (MYPieModel *model in perArray) {
            totalNum+=model.persent;
        }
        
        for (MYPieModel *model in perArray) {
            CAShapeLayer *layer = [CAShapeLayer layer];
            layer.path = circlePath.CGPath;
            layer.strokeColor = [model color].CGColor;
            layer.fillColor = [UIColor clearColor].CGColor;
            layer.lineWidth = strokeWidth;
            layer.strokeStart = startPer;
            layer.strokeEnd = startPer + model.persent/totalNum;
            [self.layer addSublayer:layer];
            
            startPer += model.persent/totalNum;
            [self presentAnimation:layer];
           
        }

    }
    return self;
}

-(void)presentAnimation:(CAShapeLayer *)layer {
//    CABasicAnimation *endAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    endAnimation.duration = 1.0f;
//    endAnimation.fromValue = @(layer.strokeStart);
//    endAnimation.toValue = @(layer.strokeEnd);
//    [layer addAnimation:endAnimation forKey:@"strokeEnd"];
    
    //ios9
    CASpringAnimation *endAnimation1 = [CASpringAnimation animationWithKeyPath:@"strokeEnd"];
    endAnimation1.duration = 3;
    endAnimation1.fromValue = @(layer.strokeStart);
    endAnimation1.toValue = @(layer.strokeEnd);
    endAnimation1.stiffness = 23;
    endAnimation1.damping = 0.1;
    [layer addAnimation:endAnimation1 forKey:@"strokeEnd"];
}

@end
