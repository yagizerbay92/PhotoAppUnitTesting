//
//  SignupPresenterProtocol.swift
//  PhotoApp
//
//  Created by Erbay, Yagiz on 25.11.2022.
//  Copyright © 2022 Sergey Kargopolov. All rights reserved.
//

import Foundation

protocol SignupPresenterProtocol: AnyObject {
    init(formModelValidator: SignupModelValidatorProtocol,
         webservice: SignupWebServiceProtocol,
         delegate: SignupViewDelegateProtocol)
    func processUserSignup(formModel: SignupFormModel)
}
