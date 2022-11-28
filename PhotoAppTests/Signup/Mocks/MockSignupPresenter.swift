//
//  MockSignupPresenter.swift
//  PhotoAppTests
//
//  Created by Erbay, Yagiz on 25.11.2022.
//  Copyright © 2022 Sergey Kargopolov. All rights reserved.
//

import Foundation
@testable import PhotoApp

class MockSignupPresenter: SignupPresenterProtocol {
    var processSignupCalled: Bool = false
    
    required init(formModelValidator: SignupModelValidatorProtocol, webservice: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol) {
        // TODO:
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        processSignupCalled = true
    }
}
