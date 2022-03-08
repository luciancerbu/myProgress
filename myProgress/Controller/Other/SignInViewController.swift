//
//  SignInViewController.swift
//  myProgress
//
//  Created by Lucian Cerbu on 06.03.2022.
//

import SafariServices
import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    private let headerView = SignInHeaderView()

    private let emailField: IGTextField = {
       let field = IGTextField()
        field.placeholder = "Email Address"
        field.keyboardType = .emailAddress
        field.returnKeyType = .next
        field.autocorrectionType = .no
    
        return field
    }()
    
    private let passwordField: IGTextField = {
       let field = IGTextField()
        field.placeholder = "Password"
        field.isSecureTextEntry = true
        field.keyboardType = .default
        field.returnKeyType = .continue
        field.autocorrectionType = .no
        
        return field
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        
        return button
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.link, for: .normal)
        button.setTitle("Create Account", for: .normal)
        
        return button
    }()
    
    private let termButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.link, for: .normal)
        button.setTitle("Terms of Service", for: .normal)
        
        return button
    }()
    
    private let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.link, for: .normal)
        button.setTitle("Privacy Policy", for: .normal)
        
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Sign In"
        view.backgroundColor = .systemBackground
        headerView.backgroundColor = .red
        addSubviews()
        emailField.delegate = self
        passwordField.delegate = self
        
        addButtonActions()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        headerView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: (view.height - view.safeAreaInsets.top)/3)
        
        emailField.frame = CGRect(x: 25, y: headerView.bottom+20, width: view.width-50, height: 50)
        passwordField.frame = CGRect(x: 25, y: emailField.bottom+10, width: view.width-50, height: 50)
        signInButton.frame = CGRect(x: 25, y: passwordField.bottom+20, width: view.width-50, height: 50)
        createAccountButton.frame = CGRect(x: 35, y: signInButton.bottom+20, width: view.width-70, height: 40)
        termButton.frame = CGRect(x: 35, y: createAccountButton.bottom+50, width: view.width-70, height: 40)
        privacyButton.frame = CGRect(x: 35, y: termButton.bottom+10, width: view.width-70, height: 40)
    }
    
    func addSubviews() {
        view.addSubview(headerView)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(signInButton)
        view.addSubview(createAccountButton)
        view.addSubview(termButton)
        view.addSubview(privacyButton)
    }
    
    private func addButtonActions() {
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(didTapCreateAccount), for: .touchUpInside)
        termButton.addTarget(self, action: #selector(didTapTerms), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(didTapPrivacy), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc func didTapSignIn() {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let email = emailField.text,
              let password = passwordField.text,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.isEmpty,
              password.count >= 6 else {
                  return
              }
        
        //Sign in with auth manager
        
        AuthManager.shared.signIn(email: email, password: password) {[weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    let vc = TabBarViewController()
                    vc.modalPresentationStyle = .fullScreen
                    self?.present(vc, animated: true, completion: nil)
                   break
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    @objc func didTapCreateAccount() {
        let vc = SignUpViewController()
        vc.completion = { [weak self] in
            DispatchQueue.main.async {
                let tabVc = TabBarViewController()
                tabVc.modalPresentationStyle = .fullScreen
                self?.present(tabVc, animated: true)
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didTapTerms() {
        guard let url = URL(string: "https://github.com/luciancerbu/myProgress") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc func didTapPrivacy() {
        guard let url = URL(string: "https://github.com/luciancerbu") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    // MARK: - Field Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField {
            passwordField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            didTapSignIn()
        }
        return true
    }
}
