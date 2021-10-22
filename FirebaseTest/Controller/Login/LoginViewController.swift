//
//  LoginViewController.swift
//  FirebaseTest
//
//  Created by  Decagon on 15/10/2021.
//

import UIKit
import FirebaseAuth


class LoginViewController: UIViewController {

    private let scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.autocapitalizationType = .none
        textfield.autocorrectionType = .no
        textfield.returnKeyType = .continue
        textfield.layer.cornerRadius = 12
        textfield.placeholder = "Email"
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textfield.leftViewMode = .always
        textfield.backgroundColor = .white
        return textfield
    }()
    
    private let passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.autocapitalizationType = .none
        textfield.autocorrectionType = .no
        textfield.returnKeyType = .done
        textfield.layer.cornerRadius = 12
        textfield.placeholder = "Password"
//        textfield.textColor = .white
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        textfield.leftViewMode = .always
        textfield.backgroundColor = .white
        textfield.isSecureTextEntry = true
        return textfield
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Proceed", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Log in"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        label.textColor = .white
        return label
    }()
    
    private let forgetPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot Password", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .light)
        return button
    }()
    
    private let signUpLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't have an account?"
        label.numberOfLines = 2
        label.textColor = .white
        return label
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .light)
        button.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.2235, green: 0.1176, blue: 0.3608, alpha: 1.0)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        addViewToSubView()
    }
    
    func addViewToSubView() {
        view.addSubview(scrollView)
        scrollView.addSubview(emailTextField)
        scrollView.addSubview(passwordTextField)
        scrollView.addSubview(loginButton)
        scrollView.addSubview(loginLabel)
        scrollView.addSubview(forgetPasswordButton)
        scrollView.addSubview(signUpLabel)
        scrollView.addSubview(signUpButton)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        scrollView.frame = view.bounds
        let size = scrollView.width/3
        loginLabel.frame = CGRect(x: (scrollView.width - size)/2,
                                 y: 170,
                                 width: size,
                                 height: size)
        emailTextField.frame = CGRect(x: 30,
                                      y: loginLabel.bottom+10,
                                      width: scrollView.width - 60,
                                 height: 52)
        passwordTextField.frame = CGRect(x: 30, y: emailTextField.bottom+30, width: scrollView.width - 60, height: 52)
        forgetPasswordButton.frame = CGRect(x: 150, y: passwordTextField.bottom+5, width: scrollView.width - 100, height: 30)
        
        loginButton.frame = CGRect(x: 80, y: passwordTextField.bottom+90, width: scrollView.width - 150, height: 62)
        signUpButton.frame = CGRect(x: 90, y: loginButton.bottom+40, width: scrollView.width - 10, height: 30)
        signUpLabel.frame = CGRect(x: 40, y: loginButton.bottom+40, width: scrollView.width - 10, height: 30)
    }
    
    @objc private func loginButtonTapped() {
        UserDefaults.standard.setValue(true, forKey: "logged")
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        guard let email = emailTextField.text, let password = passwordTextField.text,
              !email.isEmpty, !password.isEmpty, password.count >= 6 else {
            alertUserLoginError()
            return
        }
        //Firebase log in
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            guard let result = authResult, error == nil else {
                print("Failed to login email: \(email)")
                self?.alertUserLoginError(message: "The user with email does not exist, Please Sign Up.")
                return
            }
            let user = result.user
            print("Logged in user: \(user)")
            strongSelf.navigationController?.dismiss(animated: true, completion: nil)
        }
    }
    
    func alertUserLoginError(message: String = "Please enter all information to log in" ) {
        let alert = UIAlertController(title: "Woops" , message: message , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    
    @objc private func didTapSignUp() {
        let vc = RegisterViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            loginButtonTapped()
        }
        
        return true
        
    }
}

