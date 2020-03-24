//
//  PLAlertView.m
//  TestAlertViews
//
//  Created by Pan Lee on 2020/3/24.
//  Copyright © 2020 PanLee. All rights reserved.
//

#import "PLAlertView.h"
#import "PLAlertModel.h"

@implementation PLAlertView

- (instancetype)initWithTitle:(NSString *)title
{
    if(self = [super init]){
        self.frame = CGRectMake(0, 0, 100, 100);
        self.backgroundColor = [UIColor redColor];
        
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 100, 30)];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = title;
        label.textColor = [UIColor blackColor];
        [self addSubview:label];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"取消" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(diss) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(20, 100 - 40, 60, 30);
        button.backgroundColor = [UIColor yellowColor];
        [self addSubview:button];
        
    }
    return self;
}

- (void)diss
{
    [UIView animateWithDuration:0.25f animations:^{
        self.alpha = 0.0f;
    } completion:^(BOOL finished) {
        if(finished){
            [self removeFromSuperview];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"k_changeSuspendState" object:@"0"];
        }
    }];
}


@end
