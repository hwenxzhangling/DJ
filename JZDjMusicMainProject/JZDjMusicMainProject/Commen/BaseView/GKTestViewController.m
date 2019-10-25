//
//  GKTestViewController.m
//  GKTabBar
//
//  Created by QuintGao on 2017/12/26.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import "GKTestViewController.h"
#import "GKPlayerButton.h"
#import <JZDjUserNetwork/AFHTTPSessionManager+ItunesStore.h>
#import <JZDjNetwork/AFModelEntityManger+Home.h>
@interface GKTestViewController ()

@end

@implementation GKTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [AFHTTPSessionManager getVersionInfoWithUrlSuccess:^(NSString * _Nonnull version) {
        NSLog(@"-%s-%@",__func__,version);
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    [AFModelEntityManger GETChaoxiTablePortid:nil pinyin:@"qingdao" success:^(id result, AFNetworkMessageModel *model) {
        NSLog(@"-%s-%@",__func__,result);
    } failure:^(AFNetworkMessageModel *model) {
           NSLog(@"-%s-%@",__func__,model.message);
    }];
}

@end
