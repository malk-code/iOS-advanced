//
//  GCD.m
//  GCD
//
//  Created by malk on 2018/7/16.
//  Copyright © 2018年 malk. All rights reserved.
//

#import "GCD.h"

@interface GCD()

// 线程安全和线程同步
@property(nonatomic, assign) int ticketSurplusCount;
@end

@implementation GCD

/**
 
 * 同步执行 + 并发队列
 
 * 特点：在当前线程中执行任务，不会开启新线程，执行完一个任务，再执行下一个任务。
 
 */
+ (void)syncConcurrent {
    
    NSLog(@"currentThread---%@",[NSThread currentThread]); // 打印当前线程
    
    NSLog(@"syncConcurrent---begin");
    
    dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_sync(queue, ^{
        
        // 追加任务1
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"1---%@",[NSThread currentThread]); // 打印当前线程
            
        }
        
    });
    
    dispatch_sync(queue, ^{
        
        // 追加任务2
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"2---%@",[NSThread currentThread]); // 打印当前线程
            
        }
        
    });
    
    dispatch_sync(queue, ^{
        
        // 追加任务3
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"3---%@",[NSThread currentThread]); // 打印当前线程
            
        }
        
    });
    
    NSLog(@"syncConcurrent---end");
    
}

/**
 
 * 异步执行 + 并发队列
 
 * 特点：可以开启多个线程，任务交替（同时）执行。
 
 */

+ (void)asyncConcurrent {
    
    NSLog(@"currentThread---%@",[NSThread currentThread]); // 打印当前线程
    
    NSLog(@"asyncConcurrent---begin");
    
    dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        
        // 追加任务1
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"1---%@",[NSThread currentThread]); // 打印当前线程
            
        }
        
    });
    
    dispatch_async(queue, ^{
        
        // 追加任务2
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"2---%@",[NSThread currentThread]); // 打印当前线程
            
        }
        
    });
    
    dispatch_async(queue, ^{
        
        // 追加任务3
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"3---%@",[NSThread currentThread]); // 打印当前线程
            
        }
        
    });
    
    NSLog(@"asyncConcurrent---end");
    
}


/**
 
 * 同步执行 + 串行队列
 
 * 特点：不会开启新线程，在当前线程执行任务。任务是串行的，执行完一个任务，再执行下一个任务。
 
 */

+ (void)syncSerial {
    
    NSLog(@"currentThread---%@",[NSThread currentThread]); // 打印当前线程
    
    NSLog(@"syncSerial---begin");
    
    dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_sync(queue, ^{
        
        // 追加任务1
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"1---%@",[NSThread currentThread]); // 打印当前线程
            
        }
        
    });
    
    dispatch_sync(queue, ^{
        
        // 追加任务2
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"2---%@",[NSThread currentThread]); // 打印当前线程
            
        }
        
    });
    
    dispatch_sync(queue, ^{
        
        // 追加任务3
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"3---%@",[NSThread currentThread]); // 打印当前线程
            
        }

    });
    
    NSLog(@"syncSerial---end");
    
}


/**
 
 * 异步执行 + 串行队列
 
 * 特点：会开启新线程，但是因为任务是串行的，执行完一个任务，再执行下一个任务。
 
 */

+ (void)asyncSerial {
    
    NSLog(@"currentThread---%@",[NSThread currentThread]); // 打印当前线程
    
    NSLog(@"asyncSerial---begin");
    
    dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, ^{
        
        // 追加任务1
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"1---%@",[NSThread currentThread]); // 打印当前线程
            
        }
        
    });
    
    dispatch_async(queue, ^{
        
        // 追加任务2
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"2---%@",[NSThread currentThread]); // 打印当前线程
            
        }
        
    });
    
    dispatch_async(queue, ^{
        
        // 追加任务3
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"3---%@",[NSThread currentThread]); // 打印当前线程
            
        }
        
    });
    
    NSLog(@"asyncSerial---end");
    
}


/** 全局并发队列可以作为普通并发队列来使用
 使用不同优先级的若干个队列乍听起来非常直接，不过，我们强烈建议，在绝大多数情况下使用默认的优先级队列就可以了。
 如果执行的任务需要访问一些共享的资源，那么在不同优先级的队列中调度这些任务很快就会造成不可预期的行为。这样可能会引起程序的完全挂起，因为低优先级的任务阻塞了高优先级任务，使它不能被执行。
 */
+ (void)likeConcurrent {
    
    dispatch_queue_t global_queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    dispatch_async(global_queue, ^{
        NSLog(@"1.异步执行全局并发队列 - %@", [NSThread currentThread]);
    });
    dispatch_sync(global_queue, ^{
        NSLog(@"2.同步执行全局并发队列 - %@", [NSThread currentThread]);
    });
}


/**
 
 * 同步执行 + 主队列
 
 * 特点(主线程调用)：互等卡主不执行。
 
 * 特点(其他线程调用)：不会开启新线程，执行完一个任务，再执行下一个任务。
 
 */

- (void)syncMainQueue {
    
    NSLog(@"currentThread---%@",[NSThread currentThread]); // 打印当前线程
    
    NSLog(@"syncMainQueue---begin");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    dispatch_sync(queue, ^{
        
        // 追加任务1
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"1---%@",[NSThread currentThread]); // 打印当前线程
            
        }
        
    });
    
    dispatch_sync(queue, ^{
        
        // 追加任务2
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"2---%@",[NSThread currentThread]); // 打印当前线程
            
        }
        
    });
    
    dispatch_sync(queue, ^{
        
        // 追加任务3
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"3---%@",[NSThread currentThread]); // 打印当前线程
            
        }
        
    });
    
    NSLog(@"syncMainQueue---end");
    
}


/**
 
 * 异步执行 + 主队列
 
 * 特点：只在主线程中执行任务，执行完一个任务，再执行下一个任务
 
 */

+ (void)asyncMainQueue {
    
    NSLog(@"currentThread---%@",[NSThread currentThread]); // 打印当前线程
    
    NSLog(@"asyncMainQueue---begin");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    dispatch_async(queue, ^{
        
        // 追加任务1
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"1---%@",[NSThread currentThread]); // 打印当前线程
            
        }
        
    });
    
    dispatch_async(queue, ^{
        
        // 追加任务2
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"2---%@",[NSThread currentThread]); // 打印当前线程
            
        }
        
    });
    
    dispatch_async(queue, ^{
        
        // 追加任务3
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"3---%@",[NSThread currentThread]); // 打印当前线程
            
        }
        
    });
    
    NSLog(@"asyncMainQueue---end");
    
}


/**
 
 * 线程间通信
 
 */

+ (void)communication {
    
    NSLog(@"currentThread---%@",[NSThread currentThread]); // 打印当前线程

    // 获取全局并发队列

    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    // 获取主队列
    
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    dispatch_async(queue, ^{
        
        // 异步追加任务
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"global queue --- %@",[NSThread currentThread]); // 打印当前线程
            
        }
        
        // 回到主线程
        
        dispatch_async(mainQueue, ^{
            
            // 追加在主线程中执行的任务
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"main queue --- %@",[NSThread currentThread]); // 打印当前线程
            
        });
        
    });
    
}


/**
 
 * 栅栏方法 dispatch_barrier_async
 
 */

+ (void)barrier {
    
    NSLog(@"currentThread---%@",[NSThread currentThread]); // 打印当前线程

    dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        
        // 追加任务1
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"1---%@",[NSThread currentThread]); // 打印当前线程
            
        }
        
    });
    
    dispatch_async(queue, ^{
        
        // 追加任务2
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"2---%@",[NSThread currentThread]); // 打印当前线程
            
        }
        
    });
    
    dispatch_barrier_async(queue, ^{
        
        // 追加任务 barrier
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"barrier---%@",[NSThread currentThread]);// 打印当前线程
            
        }
        
    });
    
    dispatch_async(queue, ^{
        
        // 追加任务3
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"3---%@",[NSThread currentThread]); // 打印当前线程
            
        }
        
    });
    
    dispatch_async(queue, ^{
        
        // 追加任务4
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"4---%@",[NSThread currentThread]); // 打印当前线程
            
        }
        
    });
    
}


/**
 
 * 延时执行方法 dispatch_after
 
 */

+ (void)after {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 2.0秒后异步追加任务代码到主队列，并开始执行\
        dispatch_after 函数并不是在指定时间之后才开始执行处理，而是在指定时间之后将任务追加到主队列中，严格来说，这个时间并不是绝对准确的。
        NSLog(@"dispatch_after---%@", [NSThread currentThread]);
    });
    
}

/**
 
 * 一次性代码（只执行一次）dispatch_once
 
 */

+ (void)once {
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        // 只执行1次的代码(这里面默认是线程安全的)
        NSLog(@"dispatch_once---%@", [NSThread currentThread]);

        
    });
    
}


/**
 
 * 快速迭代方法 dispatch_apply
 
 */

+ (void)apply {
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    NSLog(@"apply---begin");
    
    dispatch_apply(6, queue, ^(size_t index) {
        
        NSLog(@"%zd---%@",index, [NSThread currentThread]);
        
    });
    
    NSLog(@"apply---end");
    
}


/**
 
 * 队列组 dispatch_group_notify
 
 */

+ (void)groupNotify {
    
    NSLog(@"currentThread---%@",[NSThread currentThread]); // 打印当前线程
    
    NSLog(@"group---begin");
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // 追加任务1
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"1---%@",[NSThread currentThread]); // 打印当前线程
            
        }
        
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // 追加任务2
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"2---%@",[NSThread currentThread]); // 打印当前线程
            
        }
        
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        
        // 等前面的异步任务1、任务2都执行完毕后，回到主线程执行下边任务
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"3---%@",[NSThread currentThread]); // 打印当前线程
            
        }
        
        NSLog(@"group---end");
        
    });
    
}


/**
 
 * 队列组 dispatch_group_wait
 
 */

+ (void)groupWait {
    
    NSLog(@"currentThread---%@",[NSThread currentThread]); // 打印当前线程
    
    NSLog(@"group---begin");
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // 追加任务1
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"1---%@",[NSThread currentThread]); // 打印当前线程
            
        }
        
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // 追加任务2
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"2---%@",[NSThread currentThread]); // 打印当前线程
            
        }
        
    });
    
    // 等待上面的任务全部完成后，会往下继续执行（会阻塞当前线程）
    
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
    NSLog(@"group---end");
    
}


/**
 
 * 队列组 dispatch_group_enter、dispatch_group_leave
 
 */

+ (void)groupEnterAndLeave

{
    // 当所有任务执行完成之后，才执行 dispatch_group_notify 中的任务。这里的dispatch_group_enter、dispatch_group_leave组合，其实等同于dispatch_group_async。
    
    NSLog(@"currentThread---%@",[NSThread currentThread]); // 打印当前线程
    
    NSLog(@"group---begin");
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_group_enter(group);
    
    dispatch_async(queue, ^{
        
        // 追加任务1
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"1---%@",[NSThread currentThread]); // 打印当前线程
            
        }
        
        dispatch_group_leave(group);
        
    });
    
    dispatch_group_enter(group);
    
    dispatch_async(queue, ^{
        
        // 追加任务2
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"2---%@",[NSThread currentThread]); // 打印当前线程
            
        }
        
        dispatch_group_leave(group);
        
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        
        // 等前面的异步操作都执行完毕后，回到主线程.
        
        for (int i = 0; i < 2; ++i) {
            
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            
            NSLog(@"3---%@",[NSThread currentThread]); // 打印当前线程
            
        }
        
        NSLog(@"group---end");
        
    });
    
    // 等待上面的任务全部完成后，会往下继续执行（会阻塞当前线程）- 不阻塞 dispatch_group_notify
    
     dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
     NSLog(@"group---end");
}

/**
 
 * semaphore 线程同步
 * 利用 Dispatch Semaphore 实现线程同步，将异步执行任务转换为同步执行任务
 */

+ (void)semaphoreSync {
    
    NSLog(@"currentThread---%@",[NSThread currentThread]); // 打印当前线程
    
    NSLog(@"semaphore---begin");
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    // 1.dispatch_semaphore_create：创建一个Semaphore并初始化信号的总量。：为0意味着一进来线程就被阻塞，需要信号量dispatch_semaphore_signal后dispatch_semaphore_wait才能通过
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    __block int number = 0;
    
    dispatch_async(queue, ^{
        
        // 追加任务1
        
        [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
        
        NSLog(@"1---%@",[NSThread currentThread]); // 打印当前线程
        
        number = 100;
        
        // 2.dispatch_semaphore_signal：发送一个信号，让信号总量加1。信号量加1，让线程通过，因为信号量初始值为0，就一直等待dispatch_semaphore_signal来加1让线程通过，否则就是一直等待
        dispatch_semaphore_signal(semaphore);
        
    });
    
    // 3.dispatch_semaphore_wait：可以使总信号量减1，当信号总量为0时就会一直等待（阻塞所在线程），否则就可以正常执行。：减1后为0就会阻塞，直到信号量不为0才通过，注意的调用wait前信号量不能小于0，闪退
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    NSLog(@"semaphore---end,number = %d",number);
    
}


/**
 
 * 非线程安全：不使用 semaphore（多队列）-- 信号量阻塞的是后续线程，而不是本身！
 
 * 初始化火车票数量、卖票窗口(非线程安全)、并开始卖票
 
 */

- (void)initTicketStatusNotSafe {
    
    NSLog(@"currentThread---%@",[NSThread currentThread]); // 打印当前线程
    
    NSLog(@"semaphore---begin");
    
    self.ticketSurplusCount = 50;
    
    // queue1 代表北京火车票售卖窗口
    
    dispatch_queue_t queue1 = dispatch_queue_create("net.bujige.testQueue1", DISPATCH_QUEUE_SERIAL);
    
    // queue2 代表上海火车票售卖窗口
    
    dispatch_queue_t queue2 = dispatch_queue_create("net.bujige.testQueue2", DISPATCH_QUEUE_SERIAL);
    
    __weak typeof(self) weakSelf = self;
    
    NSLog(@"%@ -- weakSelf", weakSelf);
    
    dispatch_async(queue1, ^{
        // 在多线程使用匿名对象调用时，在异步任务内得到的__weak引用的对象就是null，此处self其实就是一个局部变量，scope有限
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSLog(@"%@ -- strongSelf", strongSelf);
        if (strongSelf) {
             [strongSelf saleTicketNotSafe];
        }
    });
    
    dispatch_async(queue2, ^{
        // 在多线程使用匿名对象调用时，在异步任务内得到的__weak引用的对象就是null，此处self其实就是一个局部变量，scope有限
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSLog(@"%@ -- strongSelf", strongSelf);
        if (strongSelf) {
            [strongSelf saleTicketNotSafe];
        }
    });
    
}

- (void)dealloc {
    
    NSLog(@"dealloc %d %s,", __LINE__, __func__);
}

/**
 
 * 售卖火车票(非线程安全)
 
 */

- (void)saleTicketNotSafe {
    
    while (1) {
        
        @synchronized(self) {
        if (self.ticketSurplusCount > 0) { //如果还有票，继续售卖
            
            self.ticketSurplusCount--;
            
            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%d 窗口：%@", self.ticketSurplusCount, [NSThread currentThread]]);
            
            [NSThread sleepForTimeInterval:0.2];
            
        } else { //如果已卖完，关闭售票窗口
            
            NSLog(@"所有火车票均已售完");
            
            break;
            
        }
        
    }
    }
    
}


dispatch_semaphore_t semaphoreLock;

/**
 
 * 线程安全：使用 semaphore 加锁（多队列）-- 信号量阻塞的是后续线程，而不是本身！
 
 * 初始化火车票数量、卖票窗口(线程安全)、并开始卖票
 
 */
- (void)initTicketStatusSafe {
    
    NSLog(@"currentThread---%@",[NSThread currentThread]); // 打印当前线程
    
    NSLog(@"semaphore---begin");
    
    // 初始值为1是避免线程直接堵塞，且默认是有票的：为1意味着是可以购票的，但在进入购票方法会先调用dispatch_semaphore_wait减1阻塞后续线程，处理结束后调用dispatch_semaphore_signal放行
    semaphoreLock = dispatch_semaphore_create(1);
    
    self.ticketSurplusCount = 50;
    
    // queue1 代表北京火车票售卖窗口
    
    dispatch_queue_t queue1 = dispatch_queue_create("net.bujige.testQueue1", DISPATCH_QUEUE_SERIAL);
    
    // queue2 代表上海火车票售卖窗口
    
    dispatch_queue_t queue2 = dispatch_queue_create("net.bujige.testQueue2", DISPATCH_QUEUE_SERIAL);
    
    __weak typeof(self) weakSelf = self;  // __strong not use
    
    dispatch_async(queue1, ^{
        
        [weakSelf saleTicketSafe];
        
    });
    
    dispatch_async(queue2, ^{
        
        [weakSelf saleTicketSafe];
        
    });
    
}

/**
 
 * 售卖火车票(线程安全)
 
 */

- (void)saleTicketSafe {
    
    while (1) {
        
        // 相当于加锁
       
        // 信号量阻塞的是后续线程，而不是本身\
        在窗口购票前先为线程加锁dispatch_semaphore_wait，dispatch_semaphore_signal是解锁进入购票时的dispatch_semaphore_wait的；若票已经售完，调用dispatch_semaphore_signal解除线程锁，跳槽循环。
        dispatch_semaphore_wait(semaphoreLock, DISPATCH_TIME_FOREVER);
        
        if (self.ticketSurplusCount > 0) { //如果还有票，继续售卖
            
            self.ticketSurplusCount--;
            
            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%d 窗口：%@", self.ticketSurplusCount, [NSThread currentThread]]);
            
            [NSThread sleepForTimeInterval:0.2];
            
        } else { //如果已卖完，关闭售票窗口
            
            NSLog(@"所有火车票均已售完");
            
            // 相当于解锁
            
            dispatch_semaphore_signal(semaphoreLock);
            
            break;
            
        }
        
        // 相当于解锁
        
        dispatch_semaphore_signal(semaphoreLock);
        
    }
    
}

@end
