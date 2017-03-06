//
//  SecondViewController.m
//  BehsaClinic-Patient
//
//  Created by Arash Z. Jahangiri on 2/11/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

#import "SecondViewController.h"
#import "SecondViewCell.h"
#import "SeconViewDataEntity.h"

@interface SecondViewController ()<UITableViewDelegate, UITableViewDataSource, CustomCellDelegate>
@property(nonatomic, retain)UITableView *tableView;
@property(nonatomic, retain)NSMutableArray *tableArray;
@property (strong, nonatomic)SecondViewCell *templateCell;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self makeConstraints];
    [self generateData];
    [self.tableView reloadData];
    
    [self setTitleLabel:@"Home"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - custom methods

- (void)generateData {
    NSMutableArray *tmpData = [NSMutableArray new];
    
    for (int i = 0; i < 20; i++) {
        SeconViewDataEntity *dataEntity = [SeconViewDataEntity new];
        dataEntity.content = [Common getText:@"This app uses Masonry, MVVM, unit test, UItest--" withRepeat:i + 2];
        [tmpData addObject:dataEntity];
    }
    _tableArray = tmpData;
}

- (void)initView{
    
    self.tableView = [UITableView new];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [_tableView registerClass:[SecondViewCell class] forCellReuseIdentifier:NSStringFromClass([SecondViewCell class])];
    [self.view addSubview:self.tableView];
}

- (void)makeConstraints{
    UIView *superview = self.view;
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superview.top).offset(64);
        make.left.equalTo(superview.left);
        make.right.equalTo(superview.right);
        //make.bottom.equalTo(superview.bottom).offset(-60);
        make.height.equalTo(superview.mas_height).offset(- 110);
    }];
}

#pragma mark - Case8CellDelegate

- (void)customCell:(SecondViewCell *)cell switchExpandedStateWithIndexPath:(NSIndexPath *)index {
    // set the data
    SeconViewDataEntity *dataEntity = _tableArray[(NSUInteger) index.row];
    dataEntity.expanded = !dataEntity.expanded;
    dataEntity.cellHeight = 0;

    [_tableView beginUpdates];
    [_tableView endUpdates];
    
    [_tableView scrollToRowAtIndexPath:index atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _tableArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!_templateCell) {
        _templateCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SecondViewCell class])];
    }
    
    // Get the corresponding data
    SeconViewDataEntity *dataEntity = _tableArray[(NSUInteger) indexPath.row];
    
    // Determine whether the height has been calculated
    if (dataEntity.cellHeight <= 0) {
        // Fill data
        [_templateCell setEntity:dataEntity indexPath:[NSIndexPath indexPathForRow:-1 inSection:-1]]; //Setting -1 is for debugging purposes only, and you can tell which cell is called in the log
        // According to the current data, calculate the height of Cell, pay attention to +1
        dataEntity.cellHeight = [_templateCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 0.5f;
        NSLog(@"Calculate height: %ld", (long) indexPath.row);
    } else {
        NSLog(@"Get cache %ld", (long) indexPath.row);
    }
    
    return dataEntity.cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SecondViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SecondViewCell class]) forIndexPath:indexPath];
    [cell setEntity:_tableArray[(NSUInteger) indexPath.row] indexPath:indexPath];
    cell.delegate = self;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
