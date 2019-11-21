//
//  VHViewController.m
//  VHCycleVerticalView
//
//  Created by 435129214@qq.com on 10/22/2019.
//  Copyright (c) 2019 435129214@qq.com. All rights reserved.
//

#import "VHViewController.h"
#import <VHCycleVerticalView/VHCycleVerticalView.h>

@interface VHViewController ()

@property (strong, nonatomic) VHCycleVerticalView *cycleView;

@end

@implementation VHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 模拟数据
     NSArray *array = @[
                       @{
                           @"TITLE" : @"1华为：冀今年香港手机市场占有率提高至24％ 7月开首间旗舰店",
                           @"ID" : @"1934A345-DAC6-4A26-8DE4-8D67B700331B",
                           @"TIME" : @"华为消费者业务大中华区副总裁何鸿略在记者会上表示，现时华为手机占香港市场份额约20%，期望今年手机市占率可升至23-24%。而华为香港今日发布新款手机「HUAWE Inova 4」，何鸿略期望手机在销售周期内能达10万台销售量，相信首4至6个月销情最理想。"
                       },
                       @{
                           @"TITLE" : @"2北京大兴国际机场迎来第一架飞机",
                           @"ID" : @"E7C1997A-FACC-4572-8E55-A8039BD18687",
                           @"TIME" : @"2019年1月22日10时10分，一架奖状680校验飞机平稳地降落在北京大兴国际机场西一跑道上，留下了第一道飞机轮胎印迹。大兴国际机场第一场校验任务的圆满完成，标志着大兴国际机场工程建设即将进入验收移交阶段。"
                       },
                       @{
                           @"TITLE" : @"3春运首日 零陵汽车站客运平稳有序",
                           @"ID" : @"11781BBC-CC71-4381-AEE6-A6DACE3CDAD4",
                           @"TIME" : @"为期40天的2019年春运于1月21日拉开大幕。记者从永州零陵汽车站了解到，目前车站运营安全平稳，旅客购票乘车方便快捷，工作人员服务热情周到，整体运输情况平稳有序。"
                       },
                       @{
                           @"TITLE" : @"4吴秀波出轨风波后，和白百何主演的《情圣2》突然提档",
                           @"ID" : @"11781BBC-CC71-4381-AEE6-A6DACE3CDAD4",
                           @"TIME" : @"根据猫眼专业版的统计数据显示，影片在开启预售后，大年初一当天预售票房目前425万，落后于其他8部同档期影片。而提档到24日后，面临的对手将是漫威超级英雄电影《死侍2：我爱我家》。"
                           },
                       @{
                       @"TITLE" : @"5asdfsfsfdsf;klfdhsfjsdlflkjf",
                       @"ID" : @"11781BBC-CC71-4381-AEE6-A6DACE3CDsAD4",
                       @"TIME" : @"根据猫眼专业版的统计数据显示，影片在开启预售后，大年初一当天预售票房目前425万，落后于其他8部同档期影片。而提档到24日后，面临的对手将是漫威超级英雄电影《死侍2：我爱我家》。"
                       }
                       ];
     
     
    self.cycleView = [[VHCycleVerticalView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 70)];
    [self.view addSubview:self.cycleView];
     self.cycleView.direction = VHCycleVerticalViewScrollDirectionUp;
     self.cycleView.dataArray = array;
     self.cycleView.block = ^(NSInteger index) {
         NSLog(@"%ld",(long)index);
     };
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
