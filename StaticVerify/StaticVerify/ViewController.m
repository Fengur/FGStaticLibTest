//
//  ViewController.m
//  StaticVerify
//
//  Created by Fengur on 2016/11/21.
//  Copyright © 2016年 code.sogou.fengur. All rights reserved.
//

#import "ViewController.h"
#import "FGToast.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [FGToast showTips:@"测试成功"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
