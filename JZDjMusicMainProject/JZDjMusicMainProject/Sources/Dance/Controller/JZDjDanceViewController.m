//
//  JZDjDanceViewController.m
//  JZDjMusicMainProject
//
//  Created by wapushidai on 2019/10/24.
//  Copyright © 2019 WX. All rights reserved.
//

#import "JZDjDanceViewController.h"
#import "JZDjPlayController.h"

@interface JZDjDanceViewController ()

@end

@implementation JZDjDanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
<<<<<<< HEAD
=======
    
>>>>>>> e5ee1feca3be056b9d95d092b05bc1e86ab03cde
}

- (void)setupViews
{
    UIButton *buttton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 200)];
    buttton.backgroundColor = RandomFlatColor;
    [self.view addSubview:buttton];
    [buttton addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)buttonAction
{
     JZDjPlayController*testVC = [[JZDjPlayController alloc] init];
    [self.navigationController pushViewController:testVC animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
