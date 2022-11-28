//
//  SignUpViewControllerTests.swift
//  PhotoAppTests
//
//  Created by Erbay, Yagiz on 23.11.2022.
//  Copyright © 2022 Sergey Kargopolov. All rights reserved.
//

import XCTest
@testable import PhotoApp

class SignUpViewControllerTests: XCTestCase {

    var storyboard: UIStoryboard!
    var sut: SignUpViewController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "SignUpViewController") as? SignUpViewController
        sut?.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        storyboard = nil
        sut = nil
    }
    
    func testSignUpViewController_WhenCreated_HasRequiredTextFieldsEmpty() throws {
        let userFirstNameTextfield = try XCTUnwrap(sut?.userFirstNameTextfield) // -> used to validate whether object is nil or not
        XCTAssertEqual(userFirstNameTextfield.text, "")
        XCTAssertEqual(sut?.lastNameTextField.text, "")
        XCTAssertEqual(sut?.emailTextField.text, "")
        XCTAssertEqual(sut?.passwordTextField.text, "")
        XCTAssertEqual(sut?.repeatPasswordTextField.text, "")
    }
    
    func testViewCOntroller_WhenCreated_HasSignupButtonAndAction() throws {
        // Arrange
        let signupButton: UIButton = try XCTUnwrap(sut.signUpButton, "Signup button does not have a referencing outlet")
        
        // Act
        let signupButtonActions = try XCTUnwrap(signupButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "")
        
        // Assert
        XCTAssertEqual(signupButtonActions.count, 1)
        XCTAssertEqual(signupButtonActions.first, "signupButtonTapped:")
    }
    
    func testViewContoller_WhenSignupButtonTapped_InvokesSignUpProcess() {
        // Arrange
        let mockSignupModelValidator = MockSignupModelValidator()
        let signupWebService = MockSignupWebService()
        let mockSignupViewDelegate = MockSignupViewDelegate()
        
        let mockSignUpPresenter = MockSignupPresenter(formModelValidator: mockSignupModelValidator,
                                                      webservice: signupWebService,
                                                      delegate: mockSignupViewDelegate)
        
        sut.signupPresenter = mockSignUpPresenter
        // Act
        sut.signUpButton.sendActions(for: .touchUpInside)
        
        // Assert
        XCTAssertTrue(mockSignUpPresenter.processSignupCalled, "")
    }
}
 
