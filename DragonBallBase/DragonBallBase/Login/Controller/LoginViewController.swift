//
//  LoginViewController.swift
//  DragonBallBase
//
//  Created by Pedro Martín on 12/1/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    
    var mainView: LoginView {self.view as! LoginView}
    var emailTextField: UITextField?
    var passwordTextField: UITextField?
    var loginButtom: UIButton?
    
    
    var viewModel: LoginViewModel?
    
    
    override func loadView() {

        view = LoginView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LoginViewModel()
        SetUpUpdateUI()
        mainView.loginButtom.addTarget(self, action: #selector(didLoginTapped), for: .touchUpInside)


    }
    
    func SetUpUpdateUI() {
        // PREPARANDOME PARA RECIBIR LOS DATOS QUE VIENEN DEL VIEW MODEL
        viewModel?.updateLogin = { [weak self] token in
            DispatchQueue.main.async {
                self?.mainView.labelError.text = token
                
            }

            

        }
    }
    
    
    @objc func didLoginTapped(_ sender: UIButton) {
        
        guard let email = mainView.emailTextField.text, !email.isEmpty else {
            mainView.labelError.text = "email is empty"
            return
        }
        guard let password = mainView.passwordTextField.text, !password.isEmpty else {
            mainView.labelError.text = "pasword is empty"
            return
        }
        
        viewModel?.login(email: mainView.emailTextField.text!.lowercased(), password:mainView.passwordTextField.text!)


        
    }
    
    
    
    
    
    
}

