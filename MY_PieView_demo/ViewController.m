//
//  ViewController.m
//  MY_PieView_demo
//
//  Created by mayu on 2017/3/23.
//  Copyright © 2017年 MY. All rights reserved.
//

#import "ViewController.h"
#import "MYPieView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    MYPieModel *model = [[MYPieModel alloc] init];
    model.color = [UIColor yellowColor];
    model.persent = 33;
    
    MYPieModel *model1 = [[MYPieModel alloc] init];
    model1.color = [UIColor grayColor];
    model1.persent = 33;
    
    MYPieModel *model2 = [[MYPieModel alloc] init];
    model2.color = [UIColor greenColor];
    model2.persent = 33;
    
    MYPieView *view = [[MYPieView alloc] initWithFrame:CGRectMake(33, 33, 200, 200) withStrokeWidth:22 andPerArray:@[model,model1,model2]];
    [self.view addSubview:view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
