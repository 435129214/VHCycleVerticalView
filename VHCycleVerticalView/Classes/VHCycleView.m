//
//  VHCycleView.m
//  CycleVerticalView
//
//  Created by Jack on 2019/22/10.
//  Copyright © 2019 Lyl. All rights reserved.
//

#import "VHCycleView.h"
@interface VHCycleView ()

@property (strong, nonatomic) UILabel *topLabel;
@property (strong, nonatomic) UILabel *bottomLabel;
@property (strong, nonatomic) UILabel *centerLabel;

@end

@implementation VHCycleView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _topLabel = [[UILabel alloc] init];
        _topLabel.font = [UIFont systemFontOfSize:20];
        _topLabel.textColor = [UIColor blackColor];
        [self addSubview:_topLabel];
        
        _bottomLabel = [[UILabel alloc] init];
        _bottomLabel.font = [UIFont systemFontOfSize:14];
        _bottomLabel.textColor = [UIColor blackColor];
//        _bottomLabel.numberOfLines = 0;
        [self addSubview:_bottomLabel];
        
        _centerLabel = [[UILabel alloc] init];
        _centerLabel.font = [UIFont systemFontOfSize:20];
        _centerLabel.textColor = [UIColor blackColor];
        [self addSubview:_centerLabel];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _topLabel.frame = CGRectMake(15, 15, CGRectGetWidth(self.frame)-30, 25);
    _bottomLabel.frame = CGRectMake(15, CGRectGetMaxY(_topLabel.frame)+2, CGRectGetWidth(self.frame)-30, 64);
    _centerLabel.frame = CGRectMake(15,self.frame.size.height/2 - 15, CGRectGetWidth(self.frame)-30, 30);
}

-(void) setTopViewData:(NSDictionary *)dic
{
    _centerLabel.text = @"";//中间控件赋值空
    _topLabel.text = dic[@"TITLE"];
}

-(void) setBottomViewData:(NSDictionary *)dic
{
    _centerLabel.text = @"";//中间控件赋值空
    _bottomLabel.text = dic[@"TITLE"];
}

-(void) setCenterViewData:(NSDictionary *)dic
{
    _centerLabel.text = dic[@"TITLE"];
    //上下两个控件赋值空
    _topLabel.text = @"";
    _bottomLabel.text = @"";
}

@end
