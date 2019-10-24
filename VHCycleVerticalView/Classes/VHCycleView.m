//
//  VHCycleView.m
//  CycleVerticalView
//
//  Created by Jack on 2019/22/10.
//  Copyright © 2019 Lyl. All rights reserved.
//

#import "VHCycleView.h"
#import "VHMsgItem.h"

@interface VHCycleView ()

@property (strong, nonatomic) VHMsgItem *topLabel;
@property (strong, nonatomic) VHMsgItem *bottomLabel;
@property (strong, nonatomic) VHMsgItem *centerLabel;

@end

@implementation VHCycleView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _topLabel = [[VHMsgItem alloc] initWithFrame:CGRectMake(0, 5, CGRectGetWidth(self.frame), self.frame.size.height/2 - 10)];
        [self addSubview:_topLabel];
//        _topLabel.backgroundColor = [UIColor redColor];
        
        _bottomLabel = [[VHMsgItem alloc] initWithFrame:CGRectMake(0, self.center.y, CGRectGetWidth(self.frame), self.frame.size.height/2 - 10)];
        [self addSubview:_bottomLabel];
        
//        _bottomLabel.backgroundColor = [UIColor blueColor];
        
        _centerLabel = [[VHMsgItem alloc] initWithFrame:CGRectMake(0,self.frame.size.height/2 - 15, CGRectGetWidth(self.frame), 30)];
        [self addSubview:_centerLabel];
//        _centerLabel.backgroundColor = [UIColor yellowColor];
    
    }
    return self;
}

//- (void)layoutSubviews{
//    [super layoutSubviews];
//    _topLabel.frame = CGRectMake(15, 15, CGRectGetWidth(self.frame)-30, 25);
//    _bottomLabel.frame = CGRectMake(15, CGRectGetMaxY(_topLabel.frame)+2, CGRectGetWidth(self.frame)-30, 64);
//    _centerLabel.frame = CGRectMake(15,self.frame.size.height/2 - 15, CGRectGetWidth(self.frame)-30, 30);
//}

-(void) setTopViewData:(NSDictionary *)dic
{
    _centerLabel.content.text = @"";//中间控件赋值空
    _centerLabel.time.text = @"";
    _centerLabel.readStatus.hidden = YES;
    
    _topLabel.content.text = dic[@"TITLE"];
    _topLabel.readStatus.hidden = NO;
    _topLabel.time.text = dic[@"TITLE"];
}

-(void) setBottomViewData:(NSDictionary *)dic
{
    _centerLabel.content.text = @"";//中间控件赋值空
    _bottomLabel.content.text = dic[@"TITLE"];
    _bottomLabel.time.text = dic[@"TITLE"];
    
    _bottomLabel.readStatus.hidden = NO;
    _centerLabel.readStatus.hidden = YES;
}

-(void) setCenterViewData:(NSDictionary *)dic
{
    _centerLabel.content.text = dic[@"TITLE"];
    _centerLabel.time.text = dic[@"TITLE"];
    _centerLabel.readStatus.hidden = NO;
    
    //上下两个控件赋值空
    _topLabel.content.text = @"";
    _topLabel.readStatus.hidden = YES;
    _topLabel.time.text = @"";
    
    _bottomLabel.content.text = @"";
    _bottomLabel.readStatus.hidden = YES;
    _bottomLabel.time.text = @"";
}

@end
