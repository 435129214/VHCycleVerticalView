//
//  VHMsgItem.m
//  FBSnapshotTestCase
//
//  Created by liyanlei1 on 2019/10/24.
//

#import "VHMsgItem.h"

@implementation VHMsgItem

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(UILabel *)readStatus
{
    if(!_readStatus){
        _readStatus = [[UILabel alloc] initWithFrame:CGRectMake(15,self.frame.size.height/2 - 5,10,10)];
        _readStatus.backgroundColor = [UIColor colorWithRed:81.0/255 green:152.0/255 blue:240.0/255 alpha:1];
        [self addSubview:_readStatus];
        
        _readStatus.layer.cornerRadius = 5;
        _readStatus.layer.borderColor = [UIColor colorWithRed:208.0/255 green:234.0/255 blue:251.0/255 alpha:1].CGColor;
        _readStatus.layer.borderWidth = 2;
        
        _readStatus.layer.masksToBounds = YES;
    }
    
    return _readStatus;
}

-(UILabel *)content
{
    if(!_content){
        _content = [[UILabel alloc] initWithFrame:CGRectMake(self.readStatus.frame.origin.x + self.readStatus.frame.size.width + 5, 0, self.frame.size.width - 140, self.frame.size.height)];
        _content.font = [UIFont systemFontOfSize:14];
        _content.textColor = [UIColor blackColor];
        [self addSubview:_content];
    }
    
    return _content;
}

-(UILabel *)time
{
    if(!_time){
        _time = [[UILabel alloc] initWithFrame:CGRectMake(self.content.frame.origin.x + self.content.frame.size.width + 5, 0, 55, self.frame.size.height)];
        _time.font = [UIFont systemFontOfSize:14];
        _time.textColor = [UIColor colorWithRed:153.0/255 green:153.0/255 blue:153.0/255 alpha:1];
        _time.textAlignment = NSTextAlignmentRight;
        [self addSubview:_time];
    }
    
    return _time;
}

@end
