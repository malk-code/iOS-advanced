//
//  GCD.h
//  GCD
//
//  Created by malk on 2018/7/16.
//  Copyright © 2018年 malk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GCD : NSObject

#pragma mark - 任务和队列的6种组合

/**
 
 * 同步执行 + 并发队列
 
 * 特点：在当前线程中执行任务，不会开启新线程，执行完一个任务，再执行下一个任务。
 
 */
+ (void)syncConcurrent;

/**
 
 * 异步执行 + 并发队列
 
 * 特点：可以开启多个线程，任务交替（同时）执行。
 
 */
+ (void)asyncConcurrent;

/**
 
 * 同步执行 + 串行队列
 
 * 特点：不会开启新线程，在当前线程执行任务。任务是串行的，执行完一个任务，再执行下一个任务。
 
 */
+ (void)syncSerial;

/**
 
 * 异步执行 + 串行队列
 
 * 特点：会开启新线程，但是因为任务是串行的，执行完一个任务，再执行下一个任务。
 
 */
+ (void)asyncSerial;


/** 全局并发队列可以作为普通并发队列来使用
 
 使用不同优先级的若干个队列乍听起来非常直接，不过，我们强烈建议，在绝大多数情况下使用默认的优先级队列就可以了。
 如果执行的任务需要访问一些共享的资源，那么在不同优先级的队列中调度这些任务很快就会造成不可预期的行为。这样可能会引起程序的完全挂起，因为低优先级的任务阻塞了高优先级任务，使它不能被执行。
 
 */
+ (void)likeConcurrent;

/**
 
 * 同步执行 + 主队列
 
 * 特点(主线程调用)：互等卡主不执行。
 
 * 特点(其他线程调用)：不会开启新线程，执行完一个任务，再执行下一个任务。
 
 */
- (void)syncMainQueue;

/**
 
 * 异步执行 + 主队列
 
 * 特点：只在主线程中执行任务，执行完一个任务，再执行下一个任务
 
 */
+
(void)asyncMainQueue;


#pragma mark - 线程间通信

/**
 
 * 线程间通信
 
 刷新主线程
 
 */

+ (void)communication;

/**
 
 * 栅栏方法 dispatch_barrier_async
 
 */

+ (void)barrier;

/**
 
 * 延时执行方法 dispatch_after
 
 */

+ (void)after;

/**
 
 * 一次性代码（只执行一次）dispatch_once
 
 */

+ (void)once;

/**
 
 * 快速迭代方法 dispatch_apply
 
 */

+ (void)apply;

/**
 
 * 队列组 dispatch_group_notify
 
 */

+ (void)groupNotify;

/**
 
 * 队列组 dispatch_group_wait
 
 */

+ (void)groupWait;

/**
 
 * 队列组 dispatch_group_enter、dispatch_group_leave
 
 */

+ (void)groupEnterAndLeave;

/**
 
 * semaphore 线程同步
 * 利用 Dispatch Semaphore 实现线程同步，将异步执行任务转换为同步执行任务
 */

+ (void)semaphoreSync;


/**
 
 * 非线程安全：不使用 semaphore（多队列）-- 信号量阻塞的是后续线程，而不是本身！

 * 初始化火车票数量、卖票窗口(非线程安全)、并开始卖票
 
 */

- (void)initTicketStatusNotSafe;

/**
 
 * 线程安全：使用 semaphore 加锁（多队列）-- 信号量阻塞的是后续线程，而不是本身！
 
 * 初始化火车票数量、卖票窗口(线程安全)、并开始卖票
 
 */
- (void)initTicketStatusSafe;
@end
