//
//  WelcomeViewController+UI.swift
//  LoginAuth
//
//  Created by jikichi on 2019/12/24.
//  Copyright © 2019 jikichi. All rights reserved.
//

import UIKit
import FirebaseAuth
import KRProgressHUD

extension WelcomeViewController {
    
    func validateFields() {
        guard let email = self.emailTextField.text, !email.isEmpty else {
            print("Please enter an email address")
            KRProgressHUD.showError(withMessage: ERROR_EMPTY_EMAIL)
            return
        }
        guard let password = self.passwordTextField.text, !password.isEmpty else {
            print("Please enter a password")
            KRProgressHUD.showError(withMessage: ERROR_EMPTY_PASSWORD)
            return
        }
    }
    
    func signIn(onSuccess: @escaping () -> Void, onError: @escaping (String) -> Void) {
        KRProgressHUD.show()
        Api.User.signIn(email: self.emailTextField.text!, password: passwordTextField.text!, onSuccess: {
            KRProgressHUD.dismiss()
            onSuccess()
        }) { (errorMessage) in
            onError(errorMessage)
        }
        
    }
    
}
