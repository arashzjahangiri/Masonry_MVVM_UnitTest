//
//  LoginViewController.m
//  BehsaClinic-Patient
//
//  Created by Arash Z. Jahangiri on 2/14/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

#import "LoginViewController.h"
#define TextField_Height   25
@interface LoginViewController ()<UITextFieldDelegate>
{
    UIView *superView;
}
@property(nonatomic, retain)UITextField *usernameTextField;
@property(nonatomic, retain)UITextField *passwordTextField;
@property(nonatomic, retain)UIButton *submitButton;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    superView = self.view;
    [self initView];
    [self makeConstraints];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - custom methods
-(void)initView{
    //superView.backgroundColor = TOAST_COLOR;
    
    self.usernameTextField = [UITextField new];
    self.usernameTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.usernameTextField.layer.borderWidth = 1.0;
    self.usernameTextField.layer.cornerRadius = TextField_Height/3;
    self.usernameTextField.clipsToBounds = YES;
    self.usernameTextField.delegate = self;
    self.usernameTextField.tag = 101;
    [self.usernameTextField addTarget:self
                               action:@selector(textFieldDidChange:)
                               forControlEvents:UIControlEventEditingChanged];
    [superView addSubview:self.usernameTextField];
    
    self.passwordTextField = [UITextField new];
    self.passwordTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.passwordTextField.layer.borderWidth = 1.0;
    self.passwordTextField.layer.cornerRadius = TextField_Height/3;
    self.passwordTextField.clipsToBounds = YES;
    self.passwordTextField.delegate = self;
    self.passwordTextField.tag = 102;
    [self.passwordTextField addTarget:self
                               action:@selector(textFieldDidChange:)
                     forControlEvents:UIControlEventEditingChanged];
    [superView addSubview:self.passwordTextField];
    
    self.submitButton = [UIButton new];
    [self.submitButton setTitle:@"Login" forState:UIControlStateNormal];
    self.submitButton.titleLabel.font = FONT_NORMAL(15);
    self.submitButton.titleLabel.textColor = [UIColor whiteColor];
    self.submitButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.submitButton.backgroundColor = [UIColor lightGrayColor];
    self.submitButton.userInteractionEnabled = NO;
    self.submitButton.layer.borderWidth = 1.0;
    self.submitButton.layer.cornerRadius = TextField_Height/3;
    self.submitButton.clipsToBounds = YES;
    [self.submitButton addTarget:self action:@selector(submitButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [superView addSubview:self.submitButton];
}

- (void)makeConstraints{
    [self.usernameTextField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@50);
        make.left.equalTo(superView.mas_left).offset(50);
        make.right.equalTo(superView.mas_right).offset(-50);
        make.height.equalTo(@TextField_Height);
    }];
    
    [self.passwordTextField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.usernameTextField.mas_bottom).offset(25);
        make.left.equalTo(self.usernameTextField.mas_left);
        make.right.equalTo(self.usernameTextField.mas_right);
        make.height.equalTo(@TextField_Height);
    }];
    
    [self.submitButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordTextField.mas_bottom).offset(25);
        make.left.equalTo(self.usernameTextField.mas_left);
        make.right.equalTo(self.usernameTextField.mas_right);
        //make.bottom.equalTo(superView.mas_bottom).offset(50);
        make.height.equalTo(@TextField_Height);
    }];
}

- (void)submitButtonAction{
    NSLog(@"clicked");
    [[AZJAlertView sharedInstance]showMessage:
     [NSString stringWithFormat:@"%@\n%@", _usernameTextField.text, _passwordTextField.text]
                                     withType:AZJAlertMessageTypeInfo];
    [self performSelector:@selector(dismissThisView) withObject:nil afterDelay:3.0];
}

- (void)dismissThisView{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - textfield delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField.tag == 101) {
        [self.passwordTextField becomeFirstResponder];
    }else if (textField.tag == 102) {
        [self.passwordTextField resignFirstResponder];
    }
    return NO;
}
/*
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (self.usernameTextField.text.length>2 && self.passwordTextField.text.length>2) {
        self.submitButton.userInteractionEnabled = YES;
        self.submitButton.backgroundColor = [UIColor redColor];
    } else {
        self.submitButton.userInteractionEnabled = NO;
        self.submitButton.backgroundColor = [UIColor lightGrayColor];
    }
    
    return YES;
}
*/
-(void)textFieldDidChange :(UITextField *) textField{
    if (self.usernameTextField.text.length>3 && self.passwordTextField.text.length>3) {
        self.submitButton.userInteractionEnabled = YES;
        self.submitButton.backgroundColor = [UIColor redColor];
    } else {
        self.submitButton.userInteractionEnabled = NO;
        self.submitButton.backgroundColor = [UIColor lightGrayColor];
    }
}
@end
