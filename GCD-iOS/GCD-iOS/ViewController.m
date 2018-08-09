//
//  ViewController.m
//  GCD-iOS
//
//  Created by malk on 2018/7/16.
//  Copyright © 2018年 malk. All rights reserved.
//

#import "ViewController.h"
#import "GCD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.frame];
    label.text = @"GCD";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    // http://baijiahao.baidu.com/s?id=1596602310681829792&wfr=spider&for=pc
    
    // ------- GCD 基础 ------- //
    
    /**
    1. 优点
        1. GCD 可用于多核的并行运算
        2. GCD 会自动利用更多的 CPU 内核（比如双核、四核）
        3. GCD 会自动管理线程的生命周期（创建线程、调度任务、销毁线程）
    2. 任务
        1. 任务就是执行操作的意思，换句话说就是你在线程中执行的那段代码。在 GCD 中是放在 block 中的。
        2. 执行任务有两种方式：同步执行（sync）和异步执行（async）。两者的主要区别是：是否等待队列的任务执行结束，以及是否具备开启新线程的能力
        3. 注意： 异步执行（async） 虽然具有开启新线程的能力，但是并不一定开启新线程。这跟任务所指定的队列类型有关：在串行队列中，就等同于同步任务了。
     3. 队列（Dispatch Queue）
        1. 这里的队列指执行任务的等待队列，即用来存放任务的队列。
        2. 队列是一种特殊的线性表，采用 FIFO（先进先出）的原则，即新任务总是被插入到队列的末尾，而读取任务的时候总是从队列的头部开始读取。
        3. 每读取一个任务，则从队列中释放一个任务。
        4. GCD 中有两种队列：串行队列和并发队列。两者都符合 FIFO（先进先出）的原则。两者的主要区别是：执行顺序不同，以及开启线程数不同。
        5. 串行队列（Serial Dispatch Queue）：每次只有一个任务被执行。让任务一个接着一个地执行。（只开启一个线程，一个任务执行完毕后，再执行下一个任务）
        6. 并发队列（Concurrent Dispatch Queue）：可以让多个任务并发（同时）执行。（可以开启多个线程，并且同时执行任务）
        7. 注意：并发队列 的并发功能只有在异步（dispatch_async）函数下才有效
    4. 队列的创建方法/获取方法
        1. 可以使用dispatch_queue_create来创建队列，需要传入两个参数，第一个参数表示队列的唯一标识符，用于 DEBUG，可为空；
        2. 第二个参数用来识别是串行队列还是并发队列。DISPATCH_QUEUE_SERIAL 表示串行队列，DISPATCH_QUEUE_CONCURRENT 表示并发队列。
        3. dispatch_get_main_queue()：对于串行队列，GCD 提供了的一种特殊的串行队列：主队列（Main Dispatch Queue）。所有放在主队列中的任务，都会放到主线程中执行。
        4. dispatch_get_global_queue()：对于并发队列，GCD 默认提供了全局并发队列（Global Dispatch Queue）。需要传入两个参数。第一个参数表示队列优先级，一般用DISPATCH_QUEUE_PRIORITY_DEFAULT。第二个参数暂时没用，用0即可。
     5. 任务的创建方法
        1. GCD 提供了同步执行任务的创建方法dispatch_sync和异步执行任务创建方法dispatch_async。
        2. 使用GCD就两步，创建/获取队列，创建同步任务：dispatch_sync(queue, ^{ // 这里放同步执行任务代码 });
     6. 同步或者异步任务在串行队列，都是同步任务，因为异步执行是在串行队列中发生的，串行队列只能在当前线程执行，没有新开线程的能力，因此异步就等同于同步任务了。
     7. GCD的6种组合方式
        1. 同步执行 + 并发队列：
        2. 异步执行 + 并发队列
        3. 同步执行 + 串行队列：
        4. 异步执行 + 串行队列：
        5. 同步执行 + 主队列：
        6. 异步执行 + 主队列：
        7. 全局并发队列可以作为普通并发队列来使用
        区别              并发队列                          串行队列                          主队列
        同步（sync）      没有开启新线程，串行执行任务        没有开启新线程，串行执行任务        没有开启新线程，串行执行任务
        异步（async）     有开启新线程，并发执行任务          有开启新线程（1条），串行执行任务   没有开启新线程，串行执行任务
     8. GCD 队列
        1. GCD 公开有 5 个不同的队列，归属于两大类：
            1. Main Dispatch Queue（运行在主线程中的 main queue，通过dispatch_get_main_queue函数获得），
            2. Global Dispatch Queue（3 个不同优先级的后台队列，以及一个优先级更低的后台队列（用于 I/O），它们通过dispatch_get_global_queue获得）。
        2. 另外，开发者可以创建自定义队列：串行或者并行队列，它们通过dispatch_queue_create函数获得。自定义队列非常强大，在自定义队列中被调度的所有 block 最终都将被放入到系统的全局队列中和线程池中。
     */
    
    // ------- GCD 使用的两步 ------- //
    
    // 1.创建队列：dispatch_queue_create\
    第一个参数表示队列的唯一标识符，用于 DEBUG，可为空，Dispatch Queue 的名称推荐使用应用程序 ID 这种逆序全程域名\
    第二个参数用来识别是串行队列还是并发队列。DISPATCH_QUEUE_SERIAL 表示串行队列，DISPATCH_QUEUE_CONCURRENT 表示并发队列
    NSLog(@"--------------- 队列：创建和获取 ---------------");
    dispatch_queue_t serial_queue = dispatch_queue_create("com.malk.gcdId-serial", DISPATCH_QUEUE_SERIAL);
    NSLog(@"serial queue: %@", serial_queue);
    
    dispatch_queue_t concurrent_queue = dispatch_queue_create("com.malk.gcdId-concurrent", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"concurrent queue: %@", concurrent_queue);
    
    // 对于串行队列，GCD 提供了的一种特殊的串行队列：主队列（Main Dispatch Queue）。所有放在主队列中的任务，都会放到主线程中执行。
    dispatch_queue_t main_queue = dispatch_get_main_queue();
    NSLog(@"main queue: %@", main_queue);
    
    // 对于并发队列，GCD 默认提供了全局并发队列（Global Dispatch Queue）。dispatch_get_global_queue\
    需要传入两个参数。第一个参数表示队列优先级，一般用DISPATCH_QUEUE_PRIORITY_DEFAULT。第二个参数暂时没用，用0即可。---- 全局并发队列可以作为普通并发队列来使用。
    dispatch_queue_t global_queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    NSLog(@"global queue: %@", global_queue);
    
    // 2.创建任务\
    GCD 提供了同步执行任务的创建方法dispatch_sync和异步执行任务创建方法dispatch_async。
    NSLog(@"--------------- 组合：同步任务 + 并行队列 ---------------");
    // 在并行队列执行同步任务等同于在串行队列的效果：在当前线程中执行任务，不会开启新线程，执行完一个任务，再执行下一个任务。\
    1.任务决定了是否新开线程：同步执行不具备开启新线程的能力，且同步任务需要等待队列的任务执行结束；--- 这是不能同时执行的根本原因，还有就是并发队列本身并不能创建新线程\
    2.队列决定了任务的执行方式：队列限制了任务是否可以新开线程，并发队列可以开启多个线程，并且同时执行多个任务。但是因为本身并不能创建新线程，只有当前线程这一个线程，且任务是同步的，所以也就不存在并发
//    [GCD syncConcurrent];
    
    NSLog(@"--------------- 组合：异步任务 + 并发队列 ---------------");
    // 可以开启多个线程，任务交替（同时）执行。\
    1.异步执行具备开启新线程的能力。且并发队列可开启多个线程，同时执行多个任务：当前线程没有等待，而是直接开启了新线程，在新线程中执行任务（异步执行不做等待，可以继续执行任务）。
//    [GCD asyncConcurrent];
    
    NSLog(@"--------------- 组合：同步任务 + 串行队列 ---------------");
    // 不会开启新线程，在当前线程执行任务。任务是串行的，执行完一个任务，再执行下一个任务。\
    1.所有任务都是在当前线程（主线程）中执行的，同步执行不具备开启新线程的能力；同步任务需要等待队列的任务执行结束；任务是按顺序执行的（串行队列每次只有一个任务被执行，任务一个接一个按顺序执行）。
//    [GCD syncSerial];
    
    NSLog(@"--------------- 组合：异步任务 + 串行队列 ---------------");
    // 会开启新线程，但是因为任务是串行的，执行完一个任务，再执行下一个任务。\
    开启了一条新线程（异步执行具备开启新线程的能力，串行队列只开启一个线程）。异步执行不会做任何等待，可以继续执行任务。任务是按顺序执行的（串行队列每次只有一个任务被执行，任务一个接一个按顺序执行）。
//    [GCD asyncSerial];
    
    NSLog(@"--------------- 组合：全局并发队列可以作为普通并发队列来使用 ---------------");
    // 全局并发队列可以作为普通并发队列来使用\
    使用不同优先级的若干个队列乍听起来非常直接，不过，我们强烈建议，在绝大多数情况下使用默认的优先级队列就可以了。\
    如果执行的任务需要访问一些共享的资源，那么在不同优先级的队列中调度这些任务很快就会造成不可预期的行为。这样可能会引起程序的完全挂起，因为低优先级的任务阻塞了高优先级任务，使它不能被执行。
//    [GCD likeConcurrent];
    
    NSLog(@"--------------- 组合：同步任务 + 主队列 ---------------");
    // 主队列：GCD自带的一种特殊的串行队列，所有放在主队列中的任务，都会放到主线程中执行；Mac命令行程序不执行，可能没有主队列\
    1.线程锁死：同步执行会等待主队列中的任务执行完毕，才会接着执行；主队列也在等待同步任务执行完毕开始执行任务，所以任务相互等待造成死锁 - 在同一个线程里面，调用同一个串行队列会发送死锁现象。\
    // 主队列执行同步任务：不会开启新线程，执行完一个任务，再执行下一个任务；避免死锁使用 NSThread 的 detachNewThreadSelector 方法会创建线程，并自动启动线程执行。\
    1.因为 syncMainQueue 任务放到了其他线程里，而任务是追加到主队列中的，任务都会在主线程中执行。 --- 相当于把创建添加同步任务到主队列放到了其他线程，避开了相互等待，也就避免了线程锁死\
    2.syncMainQueue 任务在其他线程中执行到追加任务到主队列中时，因为主队列现在没有正在执行的任务，所以，会直接执行主队列的任务。所以这里不会卡住线程。
//    [NSThread detachNewThreadSelector:@selector(syncMainQueue) toTarget:[GCD new] withObject:nil];
    
    NSLog(@"--------------- 组合：异步任务 + 主队列 ---------------");
    // 只在主线程中执行任务，执行完一个任务，再执行下一个任务。\
    所有任务都是在当前线程（主线程）中执行的，并没有开启新的线程（虽然异步执行具备开启线程的能力，但因为是主队列，所以所有任务都在主线程中）。异步执行不会做任何等待，可以继续执行任务。任务是按顺序执行的
//    [GCD asyncMainQueue];
    
    
    
    // ------- GCD 线程间的通信 ------- //
    
    NSLog(@"--------------- GCD 线程间的通信：刷新主队列 ---------------");
    // 在其他线程中先执行任务，执行完了之后回到主线程执行主线程的相应操作；在 iOS 开发过程中，我们一般在主线程里边进行 UI 刷新，例如：点击、滚动、拖拽等事件。\
    我们通常把一些耗时的操作放在其他线程，比如说图片下载、文件上传等耗时操作。而当我们有时候在其他线程完成了耗时操作时，需要回到主线程，那么就用到了线程之间的通讯。
//    [GCD communication];
    // NSThread 回到主线程刷新UI
    //[self performSelectorOnMainThread:@selector(xxx:) withObject:nil waitUntilDone:YES];
    // performSelector:@selector(xxx:) onThread:[NSThread mainThread] withObject:xx waitUntilDone:YES];
    
    
    // ------- GCD 的其他方法 ------- //

    // 1.GCD 栅栏方法：dispatch_barrier_async\
    有时需要异步执行两组操作，而且第一组操作执行完之后，才能开始执行第二组操作。\
    这样就需要一个相当于 栅栏 一样的一个方法将两组异步执行的操作组给分割起来，当然这里的操作组里可以包含一个或多个任务。这就需要用到dispatch_barrier_async方法在两个操作组间形成栅栏。
    NSLog(@"--------------- GCD 栅栏方法：dispatch_barrier_async ---------------");
    // 在执行完栅栏前面的操作之后，才执行栅栏操作，最后再执行栅栏后边的操作。\
    dispatch_barrier_async函数会等待前边追加到并发队列中的任务全部执行完毕之后，再将指定的任务追加到该异步队列中。\
    然后在dispatch_barrier_async函数追加的任务执行完毕之后，异步队列才恢复为一般动作，接着追加任务到该异步队列并开始执行。
//    [GCD barrier];
    
    
    // 2.GCD 延时执行方法：dispatch_after\
    在指定时间（例如3秒）之后执行某个任务。可以用 GCD 的dispatch_after函数来实现。\
    需要注意的是：dispatch_after函数并不是在指定时间之后才开始执行处理，而是在指定时间之后将任务追加到主队列中。严格来说，这个时间并不是绝对准确的，但想要大致延迟执行任务，dispatch_after函数是很有效的。
    NSLog(@"--------------- 延迟函数：dispatch_after ---------------");
//    [GCD after];
    
    // 3.GCD 一次性代码（只执行一次）：dispatch_once\
    在创建单例、或者有整个程序运行过程中只执行一次的代码时，就用到了 GCD 的 dispatch_once 函数。\
    使用dispatch_once 函数能保证某段代码在程序运行过程中只被执行1次，并且即使在多线程的环境下，dispatch_once也可以保证线程安全。
    NSLog(@"--------------- 线程安全：dispatch_once ---------------");
//    [GCD once];
    
   // 4.GCD 快速迭代方法：dispatch_apply\
    通常我们会用 for 循环遍历，但是 GCD 给我们提供了快速迭代的函数dispatch_apply。dispatch_apply按照指定的次数将指定的任务追加到指定的队列中，并等待全部队列执行结束。\
    我们可以利用异步队列同时遍历。比如说遍历 0~5 这6个数字，for 循环的做法是每次取出一个元素，逐个遍历。dispatch_apply可以同时遍历多个数字。
    NSLog(@"--------------- 快速迭代：dispatch_apply ---------------");
    // 从dispatch_apply相关代码执行结果中可以看出：0~5 打印顺序不定，最后打印了 apply---end。\
    因为是在并发队列中异步队执行任务，所以各个任务的执行时间长短不定，最后结束顺序也不定。但是apply---end一定在最后执行。这是因为dispatch_apply函数会等待全部任务执行完毕。
//    [GCD apply];
    
    // 5.GCD 的队列组：dispatch_group\
    有时候会有这样的需求：分别异步执行2个耗时任务，然后当2个耗时任务都执行完毕后再回到主线程执行任务。这时候我们可以用到 GCD 的队列组。\
    调用队列组的 dispatch_group_async 先把任务放到队列中，然后将队列放入队列组中。或者使用队列组的 dispatch_group_enter、dispatch_group_leave 组合 来实现dispatch_group_async。\
    调用队列组的 dispatch_group_notify 回到指定线程执行任务。或者使用 dispatch_group_wait 回到当前线程继续向下执行（会阻塞当前线程）。
   
    NSLog(@"--------------- dispatch_group：dispatch_group_notify ---------------");
    // 5.1 dispatch_group_notify\
    监听 group 中任务的完成状态，当所有的任务都执行完成后，追加任务到 group 中，并执行任务。当所有任务都执行完成之后，才执行dispatch_group_notify block 中的任务
//    [GCD groupNotify];
    
    NSLog(@"--------------- dispatch_group：dispatch_group_wait ---------------");
    // 5.2 dispatch_group_wait\
    暂停当前线程（阻塞当前线程），等待指定的 group 中的任务执行完成后，才会往下继续执行。当所有任务执行完成之后，才执行 dispatch_group_wait 之后的操作。\
    但是，使用dispatch_group_wait 会阻塞当前线程。 ---- 不阻塞 dispatch_group_notify：5.3 dispatch_group_enter、dispatch_group_leave
//    [GCD groupWait];
    
    NSLog(@"--------------- dispatch_group：dispatch_group_enter、dispatch_group_leave ---------------");
    // 5.3 dispatch_group_enter、dispatch_group_leave\
    dispatch_group_enter 标志着一个任务追加到 group，执行一次，相当于 group 中未执行完毕任务数+1；dispatch_group_leave 标志着一个任务离开了 group，执行一次，相当于 group 中未执行完毕任务数-1。\
    当 group 中未执行完毕任务数为0的时候，才会使dispatch_group_wait解除阻塞，以及执行追加到dispatch_group_notify中的任务。\
    当所有任务执行完成之后，才执行 dispatch_group_notify 中的任务。这里的dispatch_group_enter、dispatch_group_leave组合，其实等同于dispatch_group_async。
//    [GCD groupEnterAndLeave];
    
    // 6.GCD 信号量：dispatch_semaphore\
    GCD 中的信号量是指 Dispatch Semaphore，是持有计数的信号。类似于过高速路收费站的栏杆。可以通过时，打开栏杆，不可以通过时，关闭栏杆。\
    在 Dispatch Semaphore 中，使用计数来完成这个功能，计数为0时等待，不可通过。计数为1或大于1时，计数减1且不等待，可通过。Dispatch Semaphore 提供了三个函数。\
    1.dispatch_semaphore_create：创建一个Semaphore并初始化信号的总量\
    2.dispatch_semaphore_signal：发送一个信号，让信号总量加1\
    3.dispatch_semaphore_wait：可以使总信号量减1，当信号总量为0时就会一直等待（阻塞所在线程），否则就可以正常执行。\
    注意：信号量的使用前提是：想清楚你需要处理哪个线程等待（阻塞），又要哪个线程继续执行，然后使用信号量。\
    Dispatch Semaphore 在实际开发中主要用于：保持线程同步，将异步执行任务转换为同步执行任务；保证线程安全，为线程加锁。
    
    NSLog(@"--------------- dispatch_semaphore：线程同步 ---------------");
    // 6.1 Dispatch Semaphore 线程同步\
    dispatch_semaphore_create：创建一个Semaphore并初始化信号的总量。：为0意味着一进来线程就被阻塞，需要信号量dispatch_semaphore_signal后dispatch_semaphore_wait才能通过\
    dispatch_semaphore_signal：发送一个信号，让信号总量加1。信号量加1，让线程通过，因为信号量初始值为0，就一直等待dispatch_semaphore_signal来加1让线程通过，否则就是一直等待\
    利用 Dispatch Semaphore 实现线程同步，将异步执行任务转换为同步执行任务：dispatch_semaphore_wait 减1后为0就会阻塞，直到信号量不为0才通过，注意的调用wait前信号量不能小于0，闪退
//    [GCD semaphoreSync];
    
    NSLog(@"--------------- dispatch_semaphore：线程安全测试为多队列模仿火车站售票 ---------------");
    // 6.2 Dispatch Semaphore 线程安全和线程同步（为线程加锁）\
    线程安全：如果你的代码所在的进程中有多个线程在同时运行，而这些线程可能会同时运行这段代码。如果每次运行结果和单线程运行的结果是一样的，而且其他的变量的值也和预期的是一样的，就是线程安全的。\
    若每个线程中对全局变量、静态变量只有读操作，而无写操作，一般来说，这个全局变量是线程安全的；若有多个线程同时执行写操作（更改变量），一般都需要考虑线程同步，否则的话就可能影响线程安全。\
    线程同步：可理解为线程 A 和 线程 B 一块配合，A 执行到一定程度时要依靠线程 B 的某个结果，于是停下来，示意 B 运行；B 依言执行，再将结果给 A；A 再继续操作。\
    举个简单例子就是：两个人在一起聊天。两个人不能同时说话，避免听不清(操作冲突)。等一个人说完(一个线程结束操作)，另一个再说(另一个线程再开始操作)。
    NSLog(@"--------------- dispatch_semaphore：为线程加锁（非线程安全） ---------------");
    GCD *gcd = [GCD new];  // 需要一棵强指针保存对象，匿名对象内部有线程：在多线程使用匿名对象调用时，在异步任务内得到的__weak引用的对象就是null，此处self其实就是一个局部变量，scope有限
    // 在不考虑线程安全，不使用 semaphore 的情况下，得到票数是错乱的，这样显然不符合我们的需求
    [gcd initTicketStatusNotSafe];
    
    NSLog(@"--------------- dispatch_semaphore：为线程加锁（线程安全） ---------------");
//    [gcd initTicketStatusSafe];
    
    
    NSLog(@"---------------------- End ----------------------");
    
    
    return;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
