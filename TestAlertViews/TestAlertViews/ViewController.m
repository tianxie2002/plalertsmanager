//
//  ViewController.m
//  TestAlertViews
//
//  Created by Pan Lee on 2020/3/24.
//  Copyright © 2020 PanLee. All rights reserved.
//

#import "ViewController.h"
#import "PLAlertsManager.h"
#import "PLAlertModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (NSInteger i = 0; i < 5; i++) {
        PLAlertModel *mo = [[PLAlertModel alloc] init];
        mo.title = [NSString stringWithFormat:@"title   %zi",i + 1];
        mo.view = self.view;
        [[PLAlertsManager defaultManager] addAlerts:mo];
    }
    
}


@end
