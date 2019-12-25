//
//  SignUpViewController+UI.swift
//  LoginAuth
//
//  Created by jikichi on 2019/12/24.
//  Copyright © 2019 jikichi. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import KRProgressHUD

extension SignUpViewController {
    
    func validateFields() {
        guard let username = self.fullnameTextField.text, !username.isEmpty else {
            print("Please enter an username")
            KRProgressHUD.showError(withMessage: ERROR_EMPTUY_USERNAME)
            return
        }
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
    
    func signUp(onSuccess: @escaping () -> Void, onError: @escaping (String) -> Void) {
        KRProgressHUD.show()
        Api.User.signUp(withUsername: self.fullnameTextField.text!, email: self.emailTextField.text!, password: self.passwordTextField.text!, image: self.image, onSuccess: {
            KRProgressHUD.dismiss()
            print("Done")
        }) { (errorMessage) in
            print(errorMessage)
        }
        
    }
}

extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageSelected = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            image = imageSelected
            avatar.image = imageSelected
        }
        
//      選択範囲を固定でavatar-iconをセット
//        if let imageOriginal = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//            image = imageOriginal
//            avatar.image = imageOriginal
//        }
        
        picker.dismiss(animated: true, completion: nil)
    }
}
