//
//  PaiMaiTopView.h
//  DemoZJ
//
//  Created by Mac on 2017/12/24.
//  Copyright © 2017年 袁书辉. All rights reserved.
//

#import "PaiMaiTopModel.h"
#import <UIKit/UIKit.h>

@interface PaiMaiTopView : UIView

@property (nonatomic,strong) NSMutableArray * dataArray;
@property (nonatomic,assign) NSInteger currentIdx;

@property (nonatomic,strong) UIColor *currentColor;

- (instancetype)initWithFrame:(CGRect)frame dataArray:(NSMutableArray <PaiMaiTopModel *>*)dataArray callBlock:(void (^)(int idx))callBlock;
@end
