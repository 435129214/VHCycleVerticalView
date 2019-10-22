//
//  VHCycleView.h
//  CycleVerticalView
//
//  Created by Jack on 2019/22/10.
//  Copyright © 2019 Lyl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VHCycleView : UIView

-(void) setTopViewData:(NSDictionary *)dic;

-(void) setBottomViewData:(NSDictionary *)dic;

-(void) setCenterViewData:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
