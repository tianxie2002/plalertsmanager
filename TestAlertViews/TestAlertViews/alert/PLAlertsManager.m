//
//  PLAlertsManager.m
//  TestAlertViews
//
//  Created by Pan Lee on 2020/3/24.
//  Copyright © 2020 PanLee. All rights reserved.
//

#import "PLAlertsManager.h"
#import "PLAlertModel.h"
#import "PLAlertItem.h"

@interface PLAlertsManager()

@property (nonatomic, strong) NSOperationQueue *queue;
@property (nonatomic, strong) PLAlertItem *last;
@property (nonatomic, assign) BOOL isSuspended;

@end

@implementation PLAlertsManager

+ (instancetype)defaultManager
{
    static PLAlertsManager *_manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _manager = [[PLAlertsManager alloc] init];
    });
    return _manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeSuspendState:) name:@"k_changeSuspendState" object:nil];
    }
    return self;
}

- (void)changeSuspendState:(NSNotification *)notification
{
    NSLog(@"%lld,%lld",self.queue.progress.totalUnitCount,self.queue.progress.completedUnitCount);
    if(self.queue.progress.totalUnitCount == self.queue.progress.completedUnitCount){
        if(self.FinishCallback){
            self.FinishCallback();
        }
        NSLog(@"calling:%s",__PRETTY_FUNCTION__);
    }
    BOOL isSuspend = [notification.object boolValue];
    self.isSuspended = isSuspend;
}

- (void)addAlerts:(PLAlertModel *)model
{
    PLAlertItem *item = [[PLAlertItem alloc] initWithModel:model];
    if(self.last != nil){
        [item addDependency:self.last];
    }
    
    [self.queue addOperation:item];
    self.last = item;
    
    self.queue.progress.totalUnitCount = self.queue.progress.totalUnitCount + 1;
    
    self.isSuspended = YES;
}

#pragma mark - setter && getter
- (NSOperationQueue *)queue
{
    if(!_queue){
        _queue = [[NSOperationQueue alloc] init];
    }
    return _queue;
}

- (void)setIsSuspended:(BOOL)isSuspended
{
    if(_isSuspended == isSuspended){
        return;
    }
    
    _isSuspended = isSuspended;
    [self.queue setSuspended:isSuspended];
}

@end
