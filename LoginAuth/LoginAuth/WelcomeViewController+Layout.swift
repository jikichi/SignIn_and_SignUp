//
//  WelcomeViewController+Layout.swift
//  LoginAuth
//
//  Created by jikichi on 2019/12/20.
//  Copyright © 2019 jikichi. All rights reserved.
//

import UIKit

extension WelcomeViewController {
    
    func setupLayout() {
        view.addSubview(conteinerView)
        conteinerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        conteinerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        conteinerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        conteinerView.bottomAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        conteinerView.addSubview(textLabel)
        textLabel.centerXAnchor.constraint(equalTo: conteinerView.centerXAnchor).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: conteinerView.centerYAnchor, constant: -30).isActive = true
        
        view.addSubview(emailContainerView)
        emailContainerView.topAnchor.constraint(equalTo: conteinerView.bottomAnchor).isActive = true
        emailContainerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        emailContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        emailContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        emailContainerView.addSubview(emailTextField)
        emailTextField.centerYAnchor.constraint(equalTo: emailContainerView.centerYAnchor).isActive = true
        emailTextField.heightAnchor.constraint(equalTo: emailContainerView.heightAnchor).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: emailContainerView.leadingAnchor, constant: 5).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: emailContainerView.trailingAnchor, constant: -5).isActive = true
        
        view.addSubview(passwordContainerView)
        passwordContainerView.topAnchor.constraint(equalTo: emailContainerView.bottomAnchor, constant: 20).isActive = true
        passwordContainerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        passwordContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        passwordContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        passwordContainerView.addSubview(passwordTextField)
        passwordTextField.centerYAnchor.constraint(equalTo: passwordContainerView.centerYAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: passwordContainerView.heightAnchor).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: passwordContainerView.leadingAnchor, constant: 5).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: passwordContainerView.trailingAnchor, constant: -5).isActive = true
        
        view.addSubview(signInButton)
        signInButton.topAnchor.constraint(equalTo: passwordContainerView.bottomAnchor, constant: 30).isActive = true
        signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(signUpButton)
        signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 30).isActive = true
        signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        
    }
}
