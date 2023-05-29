//
//  OnboardingViewController.swift
//  TwitterClone
//
//  Created by Md Shohidur Rahman on 5/23/23.
//

import UIKit

class OnboardingViewController: UIViewController {

    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "World right now"
        label.font = .systemFont(ofSize: 32,weight:  .heavy)
        label.textAlignment = .center
        label.textColor = .label
        return label
    }()
    
    
    private let createAccountButton: UIButton = {
      let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create account", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24,weight: .bold)
        button.backgroundColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        button.layer.masksToBounds = true
        button.tintColor = .white
        button.layer.cornerRadius = 30
        return button
    }()
    
    private let promptLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Have an account already"
        label.font = .systemFont(ofSize: 14, weight:  .regular)
        label.tintColor = .gray
        return label
    }()
    
    private let loginButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14)
        button.tintColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(welcomeLabel)
        view.addSubview(createAccountButton)
        view.addSubview(promptLabel)
        view.addSubview(loginButton)
        
        createAccountButton.addTarget(self, action: #selector(didTapCreateAccount), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        configureConstraints()
        
    }
    
    @objc private func didTapLogin(){
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc private func didTapCreateAccount(){
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    private func configureConstraints(){
        
        let welconeLabelConstraints = [
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
        ]
        
        let createAccountButtonConstraints = [
            createAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createAccountButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor,constant: 20),
            createAccountButton.widthAnchor.constraint(equalTo: welcomeLabel.widthAnchor, constant: -20),
            createAccountButton.heightAnchor.constraint(equalToConstant: 60)
        ]
        
        let promtLabelconstraints  = [
            promptLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            promptLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -60)
        ]
        
        let loginButtonConstraints = [
            loginButton.centerYAnchor.constraint(equalTo: promptLabel.centerYAnchor),
            loginButton.leadingAnchor.constraint(equalTo: promptLabel.trailingAnchor,constant: 10)
        ]
        
        NSLayoutConstraint.activate(welconeLabelConstraints)
        NSLayoutConstraint.activate(createAccountButtonConstraints)
        NSLayoutConstraint.activate(promtLabelconstraints)
        NSLayoutConstraint.activate(loginButtonConstraints)
    }
    
}
