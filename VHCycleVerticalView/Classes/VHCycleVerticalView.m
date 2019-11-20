//
//  VHCycleVerticalView.m
//  DeRong
//
//  Created by Jack on 2019/22/10.
//  Copyright © 2019 Lyl. All rights reserved.
//

#import "VHCycleVerticalView.h"
#import "VHCycleView.h"

@interface VHCycleVerticalView ()
{
    CGRect          _topRect;   //上View
    CGRect          _middleRect;//中View
    CGRect          _btmRect;   //下View
    
    double          _showTime;  //timer循环时长
    double          _animationTime;//动画时长
    
    UIButton        *_button;   //按钮
    NSTimer         *_timer;    //计时器
    NSInteger       _indexNow;  //计数器
}

@property (strong, nonatomic) VHCycleView *view1;
@property (strong, nonatomic) VHCycleView *view2;

@property (strong, nonatomic) VHCycleView *tmpTopView;
@property (strong, nonatomic) VHCycleView *tmpMiddleView;
@property (strong, nonatomic) VHCycleView *tmpBtmView;

@end

@implementation VHCycleVerticalView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _showTime = 3;
        _animationTime = 0.3;
        [self initUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _showTime = 3;
        _animationTime = 0.3;
        [self initUI];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    //上中下三个frame大小设定
    _middleRect = self.bounds;
    _topRect = CGRectMake(0, -CGRectGetHeight(self.frame), CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    _btmRect = CGRectMake(0, CGRectGetHeight(self.frame), CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    
    self.view1.frame = _middleRect;
    self.view2.frame = self.direction == VHCycleVerticalViewScrollDirectionDown ? self->_topRect : self->_btmRect;
    _button.frame = _middleRect;
}

- (void)initUI{
    self.view1 = [[VHCycleView alloc] initWithFrame:self.bounds];
//    self.view1.backgroundColor = [UIColor clearColor];

    self.view2 = [[VHCycleView alloc] initWithFrame:self.bounds];
//    self.view2.backgroundColor = [UIColor clearColor];
    
    [self addSubview:self.view1];
    [self addSubview:self.view2];
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    _button.backgroundColor = [UIColor clearColor];
    [_button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_button];
    
    self.clipsToBounds = YES;
}

// 执行动画
- (void)executeAnimation{
    [self setViewInfo];
    [UIView animateWithDuration:_animationTime delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.tmpMiddleView.frame = self.direction == VHCycleVerticalViewScrollDirectionDown ? self->_btmRect : self->_topRect;
        if (self->_direction == VHCycleVerticalViewScrollDirectionDown) {
            self.tmpTopView.frame = self->_middleRect;
        } else {
            self.tmpBtmView.frame = self->_middleRect;
        }
    }completion:^(BOOL finished) {
        self.tmpMiddleView.frame = self->_direction == VHCycleVerticalViewScrollDirectionDown ? self->_topRect : self->_btmRect;
      
        [self addPageIndex];
    }];
}

#pragma mark - set
- (void)setDirection:(VHCycleVerticalViewScrollDirection)direction{
    _direction = direction;
    self.view2.frame = _direction == VHCycleVerticalViewScrollDirectionDown ? _topRect : _btmRect;
}

- (void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
    if (![_timer isValid]) {
        _indexNow = 0;
        [self startAnimation];
    }
}

- (void)setViewInfo{
    if (_direction == VHCycleVerticalViewScrollDirectionDown) {
        if (self.view1.frame.origin.y == 0) {
            _tmpMiddleView = self.view1;
            _tmpTopView = self.view2;
        } else {
            _tmpMiddleView = self.view2;
            _tmpTopView = self.view1;
        }
    } else {
        if (self.view1.frame.origin.y == 0) {
            _tmpMiddleView = self.view1;
            _tmpBtmView = self.view2;
        } else {
            _tmpMiddleView = self.view2;
            _tmpBtmView = self.view1;
        }
    }
    
    NSInteger realIndex = _indexNow*2;
    
    [self setMiddleView:_tmpMiddleView atBeginIndex:realIndex];
    
    if(_indexNow == (_dataArray.count + 1)/2){//最后一页
        [self setNextViewData:0];
    }
    else{
        [self setNextViewData:realIndex+2];
    }
}
       
-(void) setMiddleView:(VHCycleView *)view atBeginIndex:(NSInteger)begin{
    if(begin <= _dataArray.count){
        if(begin == 0){
            if(_dataArray.count > 1){
                [view setTopViewData:_dataArray[0]];
                [view setBottomViewData:_dataArray[1]];
            }
            else{
                [view setCenterViewData:_dataArray[0]];
            }
        }
        else{
          [view setTopViewData:_dataArray[begin-2]];
          [view setBottomViewData:_dataArray[begin - 1]];
        }
      }
      else{//说明是最后一条数据
          if(begin -2 < _dataArray.count){
              [view setCenterViewData:_dataArray[begin - 2]];
          }
      }
}

-(void) setNextViewData:(NSInteger)begin{
    VHCycleView *view = nil;
    if (_direction == VHCycleVerticalViewScrollDirectionDown) {
        view = _tmpTopView;
    }
    else{
        view = _tmpBtmView;
    }
    
    [self setMiddleView:view atBeginIndex:begin];
}

-(void) addPageIndex
{
    if (self->_indexNow < (self.dataArray.count + 1)/2)
    {
        self->_indexNow ++;
    }
    else
    {
        self->_indexNow = 0;
    }
}


- (void)startAnimation{
    [self setViewInfo];
    [self addPageIndex];
    if (_dataArray.count > 1) {
        [self stopTimer];
        _timer = [NSTimer scheduledTimerWithTimeInterval:_showTime target:self selector:@selector(executeAnimation) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:UITrackingRunLoopMode];
    }
}

- (void)stopAnimation{
    [self stopTimer];
    [self.layer removeAllAnimations];
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}

#pragma mark -
- (void)stopTimer{
    if(_timer){
        if([_timer isValid]){
            [_timer invalidate];
        }
        _timer = nil;
    }
}

- (void)btnClick{
    if (self.block) {
        self.block(_indexNow);
    }
}

@end
