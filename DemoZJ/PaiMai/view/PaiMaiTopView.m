//
//  PaiMaiTopView.m
//  DemoZJ
//
//  Created by Mac on 2017/12/24.
//  Copyright © 2017年 袁书辉. All rights reserved.
//

#import "PaiMaiTopView.h"

@interface PaiMaiTopView()

@property (nonatomic,copy) void (^CallBlock)(int idx);
//当前显示的view
@property (nonatomic,strong) UIButton * currentView;
//2view
@property (nonatomic,strong) UIButton * secondView;
//3view
@property (nonatomic,strong) UIButton * thirdView;

@end

@implementation PaiMaiTopView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self contentViewZX];
}


- (instancetype)initWithFrame:(CGRect)frame dataArray:(NSMutableArray <PaiMaiTopModel *>*)dataArray callBlock:(void (^)(int idx))callBlock
{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataArray = dataArray;
        self.CallBlock = callBlock;
        [self loadUI];
        
    }
    return self;
}

-(void)loadUI
{
//    当前显示的内容
    CGFloat c_w = 0.6*self.bounds.size.width;
    _currentView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, c_w, self.bounds.size.height)];
    _currentView.backgroundColor = [UIColor clearColor];
    [self addSubview: _currentView];
    
    
    CGFloat s_w = (self.bounds.size.width-c_w)/2;
//    第二个
    _secondView = [[UIButton alloc] initWithFrame:CGRectMake(c_w, 0,s_w, self.bounds.size.height)];
    [_secondView addTarget:self action:@selector(btClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview: _secondView];
  //    第3个
    _thirdView = [[UIButton alloc] initWithFrame:CGRectMake(c_w+s_w, 0, s_w, self.bounds.size.height)];
    [_thirdView addTarget:self action:@selector(btClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview: _thirdView];
    
    self.currentColor  = [UIColor redColor];
    
    
    [self updateUI];
    
    
    
    
}

-(void)btClick:(UIButton *)btn
{
    self.currentIdx = btn.tag;
    if (self.CallBlock) {
        self.CallBlock(btn.tag);
    }
    [self updateUI];
    
    
}

-(void)updateUI
{
    for (int i = 0; i<self.dataArray.count; i++) {
        PaiMaiTopModel * model = self.dataArray [i];
        if (model.idx==self.currentIdx) {
            [self.dataArray removeObject:model];
            [self.dataArray insertObject:model atIndex:0];
            
            [_currentView setTitle:[self.dataArray[0] name] forState:UIControlStateNormal];
            _currentView.tag =model.idx;
             self.currentColor  = model.color;
            [self setNeedsDisplay];
            
            [_secondView setTitle:[self.dataArray[1] name] forState:UIControlStateNormal];
            _secondView.tag = [self.dataArray[1] idx];
            [_thirdView setTitle:[self.dataArray[2] name] forState:UIControlStateNormal];
            _thirdView.tag = [self.dataArray[2] idx] ;
            
            NSLog(@"===%@",self.dataArray);
        }
    }
}

-(void)contentViewZX
{
     CGFloat c_w = 0.6*self.bounds.size.width;
    CGFloat s_x = c_w-20;
    
    UIColor *color = self.currentColor;
    [color set]; //设置线条颜色
    
    UIBezierPath* path = [UIBezierPath bezierPath];
    path.lineWidth = 0.0;
    
    path.lineCapStyle = kCGLineCapRound; //线条拐角
    path.lineJoinStyle = kCGLineJoinRound; //终点处理
    
    [path moveToPoint:CGPointMake(0,0)];//起点
    [path addLineToPoint:CGPointMake(s_x,0)];
    
    // Draw the lines
    [path addLineToPoint:CGPointMake(c_w, self.bounds.size.height/2)];
    [path addLineToPoint:CGPointMake(s_x, self.bounds.size.height)];
    
    [path addLineToPoint:CGPointMake(0,self.bounds.size.height)];//起点
    [path closePath];//第五条线通过调用closePath方法得到的
    
    //    [path stroke];//Draws line 根据坐标点连线
    [path fill];//颜色填充
    
    
}







@end
