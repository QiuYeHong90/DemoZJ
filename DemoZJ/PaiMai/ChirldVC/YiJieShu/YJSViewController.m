//
//  YJSViewController.m
//  DemoZJ
//
//  Created by Mac on 2017/12/24.
//  Copyright © 2017年 袁书辉. All rights reserved.
//

#import "YJSViewController.h"

@interface YJSViewController ()

@end

@implementation YJSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel * lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 200, 50)];
    lab.text = @"已经结束";
    [self.view addSubview: lab];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
