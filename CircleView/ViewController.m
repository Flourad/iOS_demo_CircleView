//
//  ViewController.m
//  CircleView
//
//  Created by danyu on 15/9/8.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "ViewController.h"
#import "GDYCircleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect circleFrame = self.view.bounds;
    GDYCircleView *circleView = [[GDYCircleView alloc] initWithFrame:circleFrame];
    
    circleView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:circleView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
