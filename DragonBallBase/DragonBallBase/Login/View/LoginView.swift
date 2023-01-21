//
//  LoginView.swift
//  DragonBallBase
//
//  Created by Enrique Poyato Ortiz on 18/1/23.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    let labelTitle = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.text = "Login"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailTextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = "Email..."
        textField.layer.cornerRadius = 5
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    let passwordTextField = {
        let textField = UITextField()
        
        textField.backgroundColor = .white
        textField.placeholder = "Password..."
        textField.layer.cornerRadius = 5
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    let loginButtom = {
        let buttom = UIButton()
        buttom.setTitle("Login", for: .normal)
        buttom.backgroundColor = .blue
        buttom.layer.cornerRadius = 5
        buttom.translatesAutoresizingMaskIntoConstraints = false

        
        return buttom
    }()
    
    let labelError = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.textAlignment = .center
        
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupViews(){
        backgroundColor = .systemBlue

        addSubview(labelTitle)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButtom)
        addSubview(labelError)
        
        NSLayoutConstraint.activate([
            // Label title
            labelTitle.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            labelTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            labelTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            labelTitle.heightAnchor.constraint(equalToConstant: 40),
            // TextField e-mail
            emailTextField.topAnchor.constraint(equalTo: topAnchor, constant: 220),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // TextField password
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 30),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // Login buttom
            loginButtom.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 30),
            loginButtom.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            loginButtom.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            loginButtom.heightAnchor.constraint(equalToConstant: 40),
            
            // Label error
            labelError.topAnchor.constraint(equalTo: loginButtom.bottomAnchor, constant: 30),
            labelError.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            labelError.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            labelError.heightAnchor.constraint(equalToConstant: 40)
            
            
            
        ])
    }
   
    
   
    
    
    
}

