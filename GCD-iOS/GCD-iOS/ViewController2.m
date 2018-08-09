//
//  ViewController2.m
//  GCD-iOS
//
//  Created by malk on 2018/7/27.
//  Copyright © 2018年 malk. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /**
     操作队列 (Operation Queues) 还是 GCD (Grand Central Dispatch)?
     目前在 iOS 和 OS X 中有两套先进的同步 API 可供我们使用：操作队列和 GCD 。其中 GCD 是基于 C 的底层的 API ，而操作队列则是 GCD 实现的 Objective-C API。
     操作队列提供了在 GCD 中不那么容易复制的有用特性。其中最重要的一个就是可以取消在任务处理队列中的任务。而且操作队列在管理操作间的依赖关系方面也容易一些。
     另一面，GCD 给予你更多的控制权力以及操作队列中所不能使用的底层函数。
     */
    
    
    /** 线程安全
     01 前提：多个线程访问同一块资源会发生数据安全问题
     02 解决方案：加互斥锁
     03 相关代码：@synchronized(self){}
     04 专业术语-线程同步
     05 原子和非原子属性（是否对setter方法加锁）
     
     GCD 使用信号量实现，NSThread 使用
     */
    
    /**
     - (void)viewDidLoad {
     [super viewDidLoad];
     
     //假设有100张票
     self.totalticket = 10;
     //    self.obj = [[NSObject alloc]init];
     //创建线程
     self.thread01 =  [[NSThread alloc]initWithTarget:self selector:@selector(saleTicket) object:nil];
     self.thread01.name = @"售票员a";
     
     self.thread02 =  [[NSThread alloc]initWithTarget:self selector:@selector(saleTicket) object:nil];
     self.thread02.name = @"售票员b";
     self.thread03 =  [[NSThread alloc]initWithTarget:self selector:@selector(saleTicket) object:nil];
     self.thread03.name = @"售票员c";
     }
     
     -(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
     {
     //启动线程
     [self.thread01 start];
     [self.thread02 start];
     [self.thread03 start];
     }
     
     //售票
     -(void)saleTicket
     {
     while (1) {
     
     //2.加互斥锁
     @synchronized(self) {
     [NSThread sleepForTimeInterval:0.03];
     //1.先查看余票数量
     NSInteger count = self.totalticket;
     
     if (count >0) {
     self.totalticket = count - 1;
     NSLog(@"%@卖出去了一张票,还剩下%zd张票",[NSThread currentThread].name,self.totalticket);
     }else
     {
     NSLog(@"%@发现当前票已经买完了--",[NSThread currentThread].name);
     break;
     }
     }
     
     }
     */
    
    
    /** 线程通信
     
     //4.回到主线程刷新UI
     //4.1 第一种方式
     //    [self performSelectorOnMainThread:@selector(showImage:) withObject:image waitUntilDone:YES];
     
     //4.2 第二种方式
     //    [self.imageView performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:YES];
     
     //4.3 第三种方式
     [self.imageView performSelector:@selector(setImage:) onThread:[NSThread mainThread] withObject:image waitUntilDone:YES];
     }
     
     // GCD 使用 dispatch_get_main_queue 添加异步任务
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
