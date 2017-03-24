//
//  MYPieView.h
//  MY_iOS_test
//
//  Created by apple on 16/6/29.
//  Copyright © 2016年 MY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MYPieModel : NSObject
@property (strong,nonatomic)  UIColor *color;
@property (assign,nonatomic) float persent;
@end

@interface MYPieView : UIView
-(id)initWithFrame:(CGRect)frame withStrokeWidth:(CGFloat )width andPerArray:(NSArray *)perArray;
@end
