//
//  VHCycleVerticalView.h
//  DeRong
//
//  Created by Jack on 2019/22/10.
//  Copyright © 2019 Lyl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, VHCycleVerticalViewScrollDirection) {
    VHCycleVerticalViewScrollDirectionUp = 0,
    VHCycleVerticalViewScrollDirectionDown
};

typedef void(^ClickBlock)(NSInteger index);

@interface VHCycleVerticalView : UIView

@property (assign, nonatomic) VHCycleVerticalViewScrollDirection direction;
@property (strong, nonatomic) NSArray *dataArray;  // 数据源
@property (copy, nonatomic) ClickBlock block;

// 开启动画（默认是开启的）
- (void)startAnimation;

// 关闭动画
- (void)stopAnimation;

@end

NS_ASSUME_NONNULL_END
