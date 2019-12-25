//
//  SignInViewController+Layout.swift
//  LoginAuth
//
//  Created by jikichi on 2019/12/24.
//  Copyright © 2019 jikichi. All rights reserved.
//

import UIKit

extension SignUpViewController {
    func setupLayout() {
        view.addSubview(avatarView)
        avatarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        avatarView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        avatarView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        avatarView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3).isActive = true
        
        avatarView.addSubview(avatar)
        avatar.centerXAnchor.constraint(equalTo: avatarView.centerXAnchor).isActive = true
        //        avatar.centerYAnchor.constraint(equalTo: avatarView.centerYAnchor).isActive = true
        avatar.bottomAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: -20).isActive = true
        avatar.widthAnchor.constraint(equalToConstant: 80).isActive = true
        avatar.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        view.addSubview(closebutton)
        closebutton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 10).isActive = true
        closebutton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        closebutton.widthAnchor.constraint(equalToConstant: view.frame.width/20).isActive = true
        closebutton.heightAnchor.constraint(equalToConstant: view.frame.width/20).isActive = true
        
        view.addSubview(titleTextLable)
        titleTextLable.topAnchor.constraint(equalTo: closebutton.bottomAnchor, constant: 20).isActive = true
        titleTextLable.leadingAnchor.constraint(equalTo: avatarView.leadingAnchor, constant: 20).isActive = true
        titleTextLable.trailingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: -20).isActive = true
        
        titleTextLable.bottomAnchor.constraint(equalTo: avatar.topAnchor).isActive = true
        
        view.addSubview(fullnameContainerView)
        fullnameContainerView.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 20).isActive = true
        fullnameContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        fullnameContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        fullnameContainerView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        fullnameContainerView.addSubview(fullnameTextField)
        fullnameTextField.leadingAnchor.constraint(equalTo: fullnameContainerView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        fullnameTextField.centerYAnchor.constraint(equalTo: fullnameContainerView.centerYAnchor).isActive = true
        
        fullnameTextField.widthAnchor.constraint(equalTo: fullnameContainerView.widthAnchor).isActive = true
        
        view.addSubview(emailContainerView)
        emailContainerView.topAnchor.constraint(equalTo: fullnameContainerView.bottomAnchor, constant: 20).isActive = true
        emailContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        emailContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        emailContainerView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        emailContainerView.addSubview(emailTextField)
        emailTextField.leadingAnchor.constraint(equalTo: emailContainerView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        emailTextField.centerYAnchor.constraint(equalTo: emailContainerView.centerYAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: emailContainerView.widthAnchor).isActive = true
        
        view.addSubview(passwordContainerView)
        passwordContainerView.topAnchor.constraint(equalTo: emailContainerView.bottomAnchor, constant: 20).isActive = true
        passwordContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        passwordContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        passwordContainerView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        passwordContainerView.addSubview(passwordTextField)
        passwordTextField.leadingAnchor.constraint(equalTo: passwordContainerView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        passwordTextField.centerYAnchor.constraint(equalTo: passwordContainerView.centerYAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: passwordContainerView.widthAnchor).isActive = true
        
        
        
        view.addSubview(signUpButton)
        signUpButton.topAnchor.constraint(equalTo: passwordContainerView.bottomAnchor, constant: 50).isActive = true
        signUpButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        signUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
