//
//  ViewController.m
//  test贝塞尔曲线
//
//  Created by 王迎博 on 16/1/14.
//  Copyright © 2016年 王迎博. All rights reserved.
//

#import "ViewController.h"
#import "test.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIColor *backgroundColor = [UIColor lightGrayColor];
//    [backgroundColor set];
    
    test *testView = [[test alloc]initWithFrame:CGRectMake(15, 100, self.view.frame.size.width - 30, self.view.frame.size.width - 30)];
    [self.view addSubview:testView];
}


- (void)drawRect:(CGRect)rect
{
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
