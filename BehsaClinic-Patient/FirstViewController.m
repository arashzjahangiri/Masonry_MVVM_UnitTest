//
//  FirstViewController.m
//  BehsaClinic-Patient
//
//  Created by Arash Z. Jahangiri on 2/11/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showLoginView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - custom methods

- (void)showLoginView{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginViewController *view = (LoginViewController *)[story instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self presentViewController:view animated:YES completion:nil];
}
@end
