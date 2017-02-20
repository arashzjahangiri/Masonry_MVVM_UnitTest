//
//  BehsaClinic_PatientUITests.m
//  BehsaClinic-PatientUITests
//
//  Created by Arash Z. Jahangiri on 2/14/17.
//  Copyright © 2017 Arash Z. Jahangiri. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface BehsaClinic_PatientUITests : XCTestCase

@end

@implementation BehsaClinic_PatientUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationPortrait;
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *button = app.buttons[@"ورود"];
    [button tap];
    
    XCUIElement *element = [[[[app childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element;
    XCUIElement *textField = [[element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:0];
    [textField tap];
    [textField typeText:@"Arash"];
    
    XCUIElement *textField2 = [[element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:1];
    [app.buttons[@"Return"] tap];
    [textField2 tap];
    [textField2 typeText:@"12345"];
    [button tap];
}

- (void)testLoginButtonIsEnabled{
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationPortrait;
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *element = [[[[app childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element;
    XCUIElement *textField = [[element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:0];
    [textField tap];
    [textField typeText:@"Arash"];
    
    XCUIElement *returnButton = app.buttons[@"Return"];
    [returnButton tap];
    
    XCUIElement *textField2 = [[element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:1];
    [textField2 tap];
    [textField2 typeText:@"12345"];
    //[returnButton tap];
    
    XCUIElement *button = app.buttons[@"ورود"];
    XCTAssertTrue(button.enabled);
}

- (void)testLoginButtonIsDisabled{
    [XCUIDevice sharedDevice].orientation = UIDeviceOrientationPortrait;
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *element = [[[[app childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element;
    XCUIElement *textField = [[element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:0];
    [textField tap];
    [textField typeText:@"Arash"];
    
    XCUIElement *returnButton = app.buttons[@"Return"];
    [returnButton tap];
    
    XCUIElement *textField2 = [[element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:1];
    [textField2 tap];
    [textField2 typeText:@"12"];
    //[returnButton tap];
    
    XCUIElement *button = app.buttons[@"ورود"];
    XCTAssertFalse(button.enabled);
}

@end
