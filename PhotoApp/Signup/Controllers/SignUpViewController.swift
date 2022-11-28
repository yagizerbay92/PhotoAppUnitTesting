//
//  SignUpViewController.swift
//  PhotoApp
//
//  Created by Erbay, Yagiz on 23.11.2022.
//  Copyright © 2022 Sergey Kargopolov. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet weak var userFirstNameTextfield: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    var signupPresenter: SignupPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let customSignupPresenter = signupPresenter {
            let signupModelValidator = SignupFormModelValidator()
        }
    }
    
    @IBAction func signupButtonTapped(_ sender: UIButton) {
        let signupFormModel = SignupFormModel(firstName: userFirstNameTextfield.text ?? "",
                                              lastName: lastNameTextField.text ?? "",
                                              email: emailTextField.text ?? "",
                                              password: passwordTextField.text ?? "",
                                              repeatPassword: repeatPasswordTextField.text ?? "")
        signupPresenter?.processUserSignup(formModel: signupFormModel)
    }
}