//
//  PLAlertItem.h
//  TestAlertViews
//
//  Created by Pan Lee on 2020/3/24.
//  Copyright © 2020 PanLee. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PLAlertModel;

NS_ASSUME_NONNULL_BEGIN

@interface PLAlertItem : NSOperation

- (instancetype)initWithModel:(PLAlertModel *)model;


@end

NS_ASSUME_NONNULL_END
