//
//  RegistationViewController.swift
//  InstagramApp
//
//  Created by 유준상 on 2021/03/11.
//

import UIKit

class RegistationViewController: UIViewController {
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    
    // MARK: - UIView Constants
    private let usernameField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
       return field
    }()
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email Address..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
       return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password..."
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
       return field
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
       return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("RegistationViewController - viewDidLoad() called")
        // Do any additional setup after loading the view.
        
        registerButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        
        usernameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        
        addSubviews()
        view.backgroundColor = .systemBackground
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        usernameField.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 100, width: view.width - 40, height: 52)
        emailField.frame = CGRect(x: 20, y: usernameField.bottom + 10, width: view.width - 40, height: 52)
        passwordField.frame = CGRect(x: 20, y: emailField.bottom + 10, width: view.width - 40, height: 52)
        registerButton.frame = CGRect(x: 20, y: passwordField.bottom + 10, width: view.width - 40, height: 52)
    
    }
    
    private func addSubviews(){
        view.addSubview(usernameField)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(registerButton)
    }
    
    @objc private func didTapRegister() {
        emailField.resignFirstResponder()
        usernameField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty, password.count >= 8,
              let username = usernameField.text, !username.isEmpty else {
            return
        }
        
        AuthManager.shared.registerNewUser(username: username, email: email, password: password) { (registerd) in
            DispatchQueue.main.async {
                if registerd {
                    
                } else {
                    
                }
            }
        }
        
    }
    

}
extension RegistationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField {
            emailField.becomeFirstResponder()
        } else if textField == emailField {
            passwordField.becomeFirstResponder()
        } else {
            didTapRegister()
        }
        return true
    }
}
