//
//  PaiMaiViewController.m
//  DemoZJ
//
//  Created by Mac on 2017/12/24.
//  Copyright © 2017年 袁书辉. All rights reserved.
//


#import <Masonry.h>
#import "PaiMaiTopView.h"

#import "JJKSViewController.h"
#import "YJSViewController.h"
#import "PMZViewController.h"


#import "PaiMaiViewController.h"

#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

@interface PaiMaiViewController ()
{
    JJKSViewController * _JJKSVC;
    YJSViewController * _YJSVC;
    PMZViewController * _PMZVC;
}
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIViewController *currentVC;

@property (nonatomic, strong) PaiMaiTopView *topView;

@end

@implementation PaiMaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self loadUI];
    
    [self addSubControllers];
}

-(void)loadUI
{
    CGFloat top_y =kDevice_Is_iPhoneX==YES ? (44+44):(20+44);
    CGFloat topView_H = 44;
//    顶部切换按钮
    NSArray * nameArray = @[@"即将开始",@"已结束",@"拍卖中"];
    NSMutableArray * temParr = [ NSMutableArray new];
    for (int i = 0; i<nameArray.count; i++) {
        PaiMaiTopModel * fModel = [PaiMaiTopModel new];
        fModel.name = nameArray[i];
        fModel.idx = i;
        fModel.color = [UIColor redColor];
        if (i==0) {
            fModel.color = [UIColor blackColor];
        }
        if (i==1) {
            fModel.color = [UIColor grayColor];
        }
        [temParr addObject:fModel];
    }
    
    
    
    
    _topView = [[PaiMaiTopView alloc] initWithFrame:CGRectMake(0,top_y, [UIScreen mainScreen].bounds.size.width, topView_H) dataArray:temParr callBlock:^(int idx) {
        
        if (idx==0) {
//            即将开始
            [self fitFrameForChildViewController:_JJKSVC];
        }else if (idx==1){
//            已结束
            [self fitFrameForChildViewController:_YJSVC];
        }else{
//            拍卖中
            [self fitFrameForChildViewController:_PMZVC];
        }
        
    }];
    [self.view addSubview:_topView];
    _topView.backgroundColor = [UIColor greenColor];
    
    
//    底部视图
    _contentView = [[UIView alloc]initWithFrame:CGRectMake(0,top_y+topView_H,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - top_y - topView_H) ];
    _contentView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_contentView];
}




#pragma mark - privatemethods  添加子视图
- (void)addSubControllers{
  
    _JJKSVC = [[JJKSViewController alloc]init];
    _JJKSVC.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:_JJKSVC];
    
    _YJSVC = [[YJSViewController alloc]init];
    _YJSVC.view.backgroundColor = [UIColor greenColor];
    [self addChildViewController:_YJSVC];
    
    _PMZVC = [[PMZViewController alloc] init];
    _PMZVC.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewController:_PMZVC];
    
    //调整子视图控制器的Frame已适应容器View
    [self fitFrameForChildViewController:_JJKSVC];
    //设置默认显示在容器View的内容
    [self.contentView addSubview:_JJKSVC.view];
    
    NSLog(@"%@",NSStringFromCGRect(self.contentView.frame));
    NSLog(@"%@",NSStringFromCGRect(_JJKSVC.view.frame));
    
    _currentVC = _JJKSVC;
}
- (void)fitFrameForChildViewController:(UIViewController *)chileViewController{
    CGRect frame = self.contentView.frame;
    
    frame.origin.y = 0;
    chileViewController.view.frame = frame;
    
    if (chileViewController.view.superview==nil) {
        [self.contentView addSubview:chileViewController.view];
    }else{
        [self.contentView bringSubviewToFront:chileViewController.view];
    }
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
