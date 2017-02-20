//
//  BaseViewController.m
//  BehsaClinic-Patient
//
//  Created by Arash Z. Jahangiri on 2/11/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()


@property(nonatomic, retain)UILabel *myTitleLabel;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    
    [self makeTopView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)makeTopView{
    UIView *topView = UIView.new;
    topView.backgroundColor = MAIN_COLOR;
    [self.view addSubview:topView];
    
    UIView *superview = self.view;
    [topView makeConstraints:^(MASConstraintMaker *make) {
        make.top.greaterThanOrEqualTo(superview.top);
        make.left.equalTo(superview.left);
        make.right.equalTo(superview.right);
        make.height.equalTo(@64);
    }];
    
    _myTitleLabel = [UILabel new];
    _myTitleLabel.font = FONT_NORMAL(19);
    _myTitleLabel.numberOfLines = 1;
    _myTitleLabel.backgroundColor = [UIColor clearColor];
    _myTitleLabel.textColor = [UIColor whiteColor];
    _myTitleLabel.textAlignment = NSTextAlignmentCenter;
    [topView addSubview:_myTitleLabel];
    
    [self.myTitleLabel makeConstraints:^(MASConstraintMaker *make) {
        //make.top.equalTo(@10);
        make.width.equalTo(topView.mas_width).offset(-100);
        make.centerX.equalTo(topView.mas_centerX);
        make.centerY.equalTo(topView.mas_centerY);
    }];
    
}

- (void)setTitleLabel:(NSString *)title{
    _myTitleLabel.text = title;
}

@end
