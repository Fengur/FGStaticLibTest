//
//  ViewController.m
//  CombineStaticLibVerify
//
//  Created by Fengur on 2016/11/21.
//  Copyright © 2016年 code.sogou.fengur. All rights reserved.
//

#import "ViewController.h"
#import "FGToast.h"

#if TARGET_IPHONE_SIMULATOR
#define SIMULATOR @"模拟器"
#elif TARGET_OS_IPHONE
#define SIMULATOR @"真机"
#endif

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [FGToast showTips:[NSString stringWithFormat:@"!!%@!!测试效果",SIMULATOR]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
