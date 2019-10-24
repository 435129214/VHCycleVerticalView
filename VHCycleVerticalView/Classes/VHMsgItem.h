//
//  VHMsgItem.h
//  FBSnapshotTestCase
//
//  Created by liyanlei1 on 2019/10/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VHMsgItem : UIView

@property(nonatomic, strong) UILabel *readStatus;
@property(nonatomic, strong) UILabel *content;
@property(nonatomic, strong) UILabel *time;

@end

NS_ASSUME_NONNULL_END
