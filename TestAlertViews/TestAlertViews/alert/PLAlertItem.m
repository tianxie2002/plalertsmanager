//
//  PLAlertItem.m
//  TestAlertViews
//
//  Created by Pan Lee on 2020/3/24.
//  Copyright © 2020 PanLee. All rights reserved.
//

#import "PLAlertItem.h"
#import "PLAlertModel.h"
#import "PLAlertView.h"
#import <UIKit/UIKit.h>

@interface PLAlertItem()

@property (nonatomic, strong) PLAlertModel *model;

@end

@implementation PLAlertItem

- (instancetype)initWithModel:(PLAlertModel *)model
{
    if(self = [super init]){
        self.model = model;
    }
    return self;
}

- (void)main
{

    [[NSNotificationCenter defaultCenter] postNotificationName:@"k_changeSuspendState" object:self userInfo:@{@"isSuspend":@"1"}];

    if([NSThread isMainThread]){
        [self doSth];
    }else{
        [self performSelectorOnMainThread:@selector(doSth) withObject:nil waitUntilDone:NO];
    }
}


- (void)doSth
{
    NSLog(@"calling:%s",__PRETTY_FUNCTION__);
    PLAlertView *view = [[PLAlertView alloc] initWithTitle:self.model.title];
    
    [self.model.view addSubview:view];
    
    view.center = CGPointMake(CGRectGetWidth(self.model.view.frame)/2, CGRectGetHeight(self.model.view.frame)/2);
}

@end
