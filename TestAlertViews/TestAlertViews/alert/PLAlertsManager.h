//
//  PLAlertsManager.h
//  TestAlertViews
//
//  Created by Pan Lee on 2020/3/24.
//  Copyright © 2020 PanLee. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PLAlertModel;

NS_ASSUME_NONNULL_BEGIN

@interface PLAlertsManager : NSObject

+ (instancetype)defaultManager;

- (void)addAlerts:(PLAlertModel *)model;

@property (nonatomic, copy) void(^FinishCallback)(void);

@end

NS_ASSUME_NONNULL_END
