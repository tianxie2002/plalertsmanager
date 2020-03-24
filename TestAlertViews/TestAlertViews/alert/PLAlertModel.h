//
//  PLAlertModel.h
//  TestAlertViews
//
//  Created by Pan Lee on 2020/3/24.
//  Copyright © 2020 PanLee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PLAlertModel : NSObject

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) UIView *view;

@end

NS_ASSUME_NONNULL_END
