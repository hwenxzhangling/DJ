//
//  JZDjSelectViewController.m
//  JZDjMusicMainProject
//
//  Created by wapushidai on 2019/10/24.
//  Copyright © 2019 WX. All rights reserved.
//

#import "JZDjSelectViewController.h"
<<<<<<< HEAD
#import "JZDjPlayController.h"
#import "JZDMusic.h"
#import <MJExtension.h>

@interface JZDjSelectViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_dataSource;
}
@property (nonatomic , copy)UITableView *tableView;
=======

@interface JZDjSelectViewController ()

>>>>>>> e5ee1feca3be056b9d95d092b05bc1e86ab03cde
@end

@implementation JZDjSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navView.title = @"精选";
    // Do any additional setup after loading the view.
<<<<<<< HEAD
    _dataSource = [NSMutableArray array];
    NSDictionary *dic = [self readLocalFileWithName:@"dict.json"];
    NSArray *array = dic[@"datas"][@"dance_hot"];
    _dataSource = [JZDMusic mj_objectArrayWithKeyValuesArray:array];
    [self.view addSubview:self.tableView];
    NSLog(@"dic = %@",array);
}

- (NSDictionary *)readLocalFileWithName:(NSString *)name
{
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForAuxiliaryExecutable:name];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    
    return [NSJSONSerialization JSONObjectWithData:data
                                           options:kNilOptions
                                             error:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:0 reuseIdentifier:@"cell"];
    JZDMusic *music = _dataSource[indexPath.row];
    cell.textLabel.text = music.dance_name;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    JZDjPlayController *VC = [[JZDjPlayController alloc]init];
    [VC playMusicWithIndex:indexPath.row musicArr:_dataSource];
    [self.navigationController pushViewController:VC animated:YES];
}



- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, TOP_HEIGHT, MAIN_WIDTH, MAIN_HEIGHT-TOP_HEIGHT-TAB_BAR_HEIGHT) style:UITableViewStylePlain];\
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}
=======
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
>>>>>>> e5ee1feca3be056b9d95d092b05bc1e86ab03cde

@end
