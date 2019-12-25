//
//  SignInViewController.swift
//  LoginAuth
//
//  Created by jikichi on 2019/12/20.
//  Copyright © 2019 jikichi. All rights reserved.
//

import UIKit
import KRProgressHUD


class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    var image: UIImage? = nil
    
    let titleTextLable: UILabel = {
        let textLabel = UILabel()
        let title = "Sign Up"
        let subtext = "\n\nLorem ipsum dolor sit amet conse ctetur adipisicing elit sed do"
        
        let attributedTitleText: NSMutableAttributedString = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 28)!, NSAttributedString.Key.foregroundColor : UIColor.black])
        
        let attributedSubText: NSMutableAttributedString = NSMutableAttributedString(string: subtext, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.45)])
        
        // attributedSubTitleの設定
        let paragrapStyle = NSMutableParagraphStyle()
        // 行間の空白の大きさ設定
        paragrapStyle.lineSpacing = 5
        attributedTitleText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragrapStyle, range: NSMakeRange(0, attributedTitleText.length))
        
        attributedTitleText.append(attributedSubText)
        textLabel.attributedText = attributedTitleText
        
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return textLabel
    }()
    
    let avatarView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        
        return myView
    }()
    
    let avatar: UIImageView = {
        let imageView = UIImageView()
        
        imageView.backgroundColor = .gray
        imageView.isUserInteractionEnabled = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        
        // avatarをタップしたらタップアクションによる遷移を行うために相互作用を有効にする
        imageView.isUserInteractionEnabled = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
        
    }()
    
    let fullnameContainerView: UIView = {
        let containerView = UIView()
        
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
        containerView.layer.cornerRadius = 3
        containerView.clipsToBounds = true
        
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        return containerView
    }()
    
    let fullnameTextField: UITextField = {
        let textField = UITextField()
        
        // 枠線のスタイル設定　枠線なし .none
        textField.borderStyle = .none
        // 入力時のキーボードを指定する
        textField.keyboardType = .default
        
        textField.textColor = UIColor(red: 99/255, green: 99/255, blue: 99/255, alpha: 1)
        
        // キーボードの改行ボタンをdoneにする
        textField.returnKeyType = .done
        
        let placeholderAttribute = NSAttributedString(string: "Full Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)])
        textField.attributedPlaceholder = placeholderAttribute
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
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
    
    let signUpButton: UIButton = {
        let buttonTitle = "Sign Up"
        let button: UIButton = UIButton(type: .system)
        
        button.setTitle(buttonTitle, for: UIControl.State.normal)
        button.setTitleColor(.white, for: UIControl.State.normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.backgroundColor = UIColor.black
        
        button.addTarget(self, action: #selector(SignUpViewController.signUpButtonDidTapped(_:)), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let closebutton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setImage(UIImage(named: "icon-Close"), for: UIControl.State.normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1)
        
        button.addTarget(self, action: #selector(SignUpViewController.dismissModal(_:)), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SignUpViewController.presentPicker(_:)))
        avatar.addGestureRecognizer(tapGesture)
        setupLayout()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @objc func dismissModal(_ sender: UIButton) {
        let parentViewController = WelcomeViewController()
        
        parentViewController.view.setNeedsDisplay()
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @objc func presentPicker(_ sender: UITapGestureRecognizer) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
    @objc func signUpButtonDidTapped(_ sender: UIButton) {
        self.view.endEditing(true)
        self.validateFields()
        self.signUp(onSuccess: {
            // switch view
        }) { (errorMessage) in
            KRProgressHUD.showError(withMessage: errorMessage)
        }
        
    }
    
}

