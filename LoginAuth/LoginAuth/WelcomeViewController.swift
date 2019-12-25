//
//  WelcomeViewController.swift
//  LoginAuth
//
//  Created by jikichi on 2019/12/20.
//  Copyright © 2019 jikichi. All rights reserved.
//

import UIKit
import KRProgressHUD

class WelcomeViewController: UIViewController {
    
    let conteinerView: UIView = {
        let cView = UIView()
        cView.backgroundColor = .white
        
        cView.isUserInteractionEnabled = true
        cView.translatesAutoresizingMaskIntoConstraints = false
        
        return cView
        
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        let attributedTitleText: NSMutableAttributedString = NSMutableAttributedString(string: "ようこそ", attributes: [NSAttributedString.Key.font : UIFont.init(name: "Menlo", size: 28)!, NSAttributedString.Key.foregroundColor : UIColor.black])
        label.attributedText = attributedTitleText
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailContainerView: UIView = {
            let containerView = UIView()
            
            containerView.layer.borderWidth = 1
            containerView.layer.borderColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
            containerView.layer.cornerRadius = 3
            containerView.clipsToBounds = true
            containerView.translatesAutoresizingMaskIntoConstraints = false
            
            return containerView
        }()
        
        let emailTextField: UITextField = {
            let textField = UITextField()
            
            
            textField.borderStyle = .none
            // 入力時のキーボードをEmail用にする
            textField.keyboardType = .emailAddress
            textField.textColor = UIColor(red: 99/255, green: 99/255, blue: 99/255, alpha: 1)
            textField.returnKeyType = .done
            
            let placeholderAttribute = NSAttributedString(string: "Email Adress", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)])
            textField.attributedPlaceholder = placeholderAttribute
            
            textField.translatesAutoresizingMaskIntoConstraints = false
            
            return textField
        }()
        
        let passwordContainerView: UIView = {
            let containerView = UIView()
            
            containerView.layer.borderWidth = 1
            containerView.layer.borderColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
            containerView.layer.cornerRadius = 3
            containerView.clipsToBounds = true
            containerView.translatesAutoresizingMaskIntoConstraints = false
            
            return containerView
        }()
        
        let passwordTextField: UITextField = {
            let textField = UITextField()
            
            textField.borderStyle = .none
            textField.keyboardType = .asciiCapable
            textField.textColor = UIColor(red: 99/255, green: 99/255, blue: 99/255, alpha: 1)
            textField.returnKeyType = .done
            // 入力時のテキストを●で見えなくする
            textField.isSecureTextEntry = true
            
            let placeholderAttribute = NSAttributedString(string: "Password (8+ Characters)", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)])
            textField.attributedPlaceholder = placeholderAttribute
            
            textField.translatesAutoresizingMaskIntoConstraints = false
            
            return textField
        }()
    
        let signInButton: UIButton = {
            let buttonTitle = "Sign In"
            let button: UIButton = UIButton(type: .system)
            
            button.setTitle(buttonTitle, for: UIControl.State.normal)
            button.setTitleColor(.white, for: UIControl.State.normal)
            button.layer.cornerRadius = 5
            button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            button.backgroundColor = UIColor.black
            
            button.addTarget(self, action: #selector(WelcomeViewController.signInButtonDidTapped(_:)), for: .touchUpInside)
            
            button.translatesAutoresizingMaskIntoConstraints = false
            
            
            return button
        }()
        
        let signUpButton: UIButton = {
            let buttonTitle = "Sign Up"
            let button: UIButton = UIButton(type: .system)
            
            button.setTitle(buttonTitle, for: UIControl.State.normal)
            button.setTitleColor(.white, for: UIControl.State.normal)
            button.layer.cornerRadius = 5
            button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            button.backgroundColor = UIColor.black
            
            button.addTarget(self, action: #selector(WelcomeViewController.signUpButtonDidTapped(_:)), for: .touchUpInside)
            
            button.translatesAutoresizingMaskIntoConstraints = false
            
            return button
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
//        let viewTap = UITapGestureRecognizer(target: self, action: #selector(WelcomeViewController.presentNextView(_:)))
        setupLayout()
//        view.addGestureRecognizer(viewTap)
        
    }
    @objc func signInButtonDidTapped(_ sender: UIButton) {
        self.view.endEditing(true)
        self.validateFields()
        self.signIn(onSuccess: {
            print("Success")
            // switch view
        }) { (errorMessage) in
            KRProgressHUD.showError(withMessage: errorMessage)
        }
    }
        
    @objc func signUpButtonDidTapped(_ sender: UIButton) {
        
        let nextViewController = SignUpViewController()
        nextViewController.view.backgroundColor = .white
        self.present(nextViewController, animated: true, completion: nil)
        
        //        let nextViewController = SignInViewController()
        //        nextViewController.view.backgroundColor = .white
        //        nextViewController.modalPresentationStyle = .fullScreen
        //        let transition = CATransition()
        //        transition.duration = 0.3
        //        transition.type = CATransitionType.push
        //        transition.subtype = CATransitionSubtype.fromRight
        //        view.window!.layer.add(transition, forKey: kCATransition)
        //        self.present(nextViewController, animated: false, completion: nil)
    }
}
