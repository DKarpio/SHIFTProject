//
//  ViewController.swift
//  SHIFTProject
//
//  Created by Дмитрий К on 10.07.2025.
//

import UIKit

class LoginScreenVC: UIViewController {
    
    let nameTextField = SHIFTTextField()
    let secondNameTextField = SHIFTTextField()
    let birthdayTextField = SHIFTDateTextField()
    let passwordTextField = SHIFTPasswordTextField()
    let confirmPasswordTextField = SHIFTPasswordTextField()
    let loginButton = SHIFTButton(title: "Регистрация")
    
    let nameLabel = SHIFTLabel()
    let secondNameLabel = SHIFTLabel()
    let birthdayLabel = SHIFTLabel()
    let passwordLabel = SHIFTLabel()
    let confirmPasswordLabel = SHIFTLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureNameTextField()
        configureSecondNameTextFiled()
        configureBirthdayTextField()
        configurePasswordTextField()
        configureConfirmPasswordTextField()
        configureLoginButton()
        configureLabels()
    }
    
    func configureLabels() {
        nameLabel.isHidden = true
        secondNameLabel.isHidden = true
        birthdayLabel.isHidden = true
        passwordLabel.isHidden = true
        confirmPasswordLabel.isHidden = true
        
        view.addSubview(nameLabel)
        view.addSubview(secondNameLabel)
        view.addSubview(birthdayLabel)
        view.addSubview(passwordLabel)
        view.addSubview(confirmPasswordLabel)
        
        nameLabel.text = "Имя должно быть не короче 2ух символов"
        secondNameLabel.text = "Фамилия должна быть не короче 2ух символов"
        birthdayLabel.text = "Возраст должен быть больше 18 лет"
        passwordLabel.text = "Пароль должен содержать хотя бы одну заглавную букву, одну цифру, длина 6 символов"
        confirmPasswordLabel.text = "Пароли не совпадают"
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 2),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        
        NSLayoutConstraint.activate([
            secondNameLabel.topAnchor.constraint(equalTo: secondNameTextField.bottomAnchor, constant: 2),
            secondNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            secondNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            secondNameLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            birthdayLabel.topAnchor.constraint(equalTo: birthdayTextField.bottomAnchor, constant: 2),
            birthdayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            birthdayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            birthdayLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
        
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 2),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            passwordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            passwordLabel.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        NSLayoutConstraint.activate([
            confirmPasswordLabel.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 2),
            confirmPasswordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            confirmPasswordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            confirmPasswordLabel.heightAnchor.constraint(equalToConstant: 20)
            ])
    }
    
    func configureNameTextField() {
        
        if let name = UserDefaults.standard.string(forKey: "name") {
            nameTextField.text = name
            nameTextField.isValid = true
        }
        view.addSubview(nameTextField)
        
        nameTextField.placeholder = "Имя"
        nameTextField.addTarget(self, action: #selector(nameTextFieldEndEditing), for: .editingDidEnd)
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            nameTextField.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    
    @objc func nameTextFieldEndEditing(sender: SHIFTTextField) {
        if !Validator.isNameValid(sender.text) {
            sender.setBorderColorRed()
            nameLabel.isHidden = false
            sender.isValid = false
        }
        else {
            sender.isValid = true
            UserDefaults.standard.set(sender.text, forKey: "name")
        }
        updateLoginButton()
    }
    
    func configureSecondNameTextFiled() {
        view.addSubview(secondNameTextField)
        
        secondNameTextField.placeholder = "Фамилия"
        secondNameTextField.addTarget(self, action: #selector(secondNameTextFieldEndEditing), for: .editingDidEnd)
        
        NSLayoutConstraint.activate([
            secondNameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 48),
            secondNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            secondNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            secondNameTextField.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    @objc func secondNameTextFieldEndEditing(sender: SHIFTTextField) {
        if !Validator.isNameValid(sender.text) {
            sender.setBorderColorRed()
            secondNameLabel.isHidden = false
            sender.isValid = false
        }
        else {
            sender.isValid = true
        }
        updateLoginButton()
    }
    
    func configureBirthdayTextField() {
        view.addSubview(birthdayTextField)
        
        birthdayTextField.placeholder = "Дата рождения"
        birthdayTextField.addTarget(self, action: #selector(birthdayTextFieldEndEditing), for: .editingDidEnd)
        
        NSLayoutConstraint.activate([
            birthdayTextField.topAnchor.constraint(equalTo: secondNameTextField.bottomAnchor, constant: 48),
            birthdayTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            birthdayTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            birthdayTextField.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    @objc func birthdayTextFieldEndEditing(sender: SHIFTDateTextField) {
        if !Validator.isAgeValid(sender.selectedDate) {
            birthdayLabel.isHidden = false
            sender.setBorderColorRed()
            sender.isValid = false
        } else {
            sender.isValid = true
            birthdayTextField.text = sender.selectedDate.formatted(date: .numeric, time: .omitted)
        }
        updateLoginButton()
    }
    
    func configurePasswordTextField() {
        view.addSubview(passwordTextField)
        
        passwordTextField.placeholder = "Пароль"
        passwordTextField.addTarget(self, action: #selector(passwordTextFieldEndEditing), for: .editingDidEnd)
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: birthdayTextField.bottomAnchor, constant: 48),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    @objc func passwordTextFieldEndEditing(sender: SHIFTPasswordTextField) {
        if !Validator.isPasswordValid(sender.text!) {
            passwordLabel.isHidden = false
            sender.setBorderColorRed()
            sender.isValid = false
        } else {
            sender.isValid = true
        }
        updateLoginButton()
    }
    
    func configureConfirmPasswordTextField() {
        view.addSubview(confirmPasswordTextField)
        
        confirmPasswordTextField.placeholder = "Повторите пароль"
        confirmPasswordTextField.addTarget(self, action: #selector(confirmPasswordTFEndEditing), for: .editingDidEnd)
        
        NSLayoutConstraint.activate([
            confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 48),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    @objc func confirmPasswordTFEndEditing(sender: SHIFTPasswordTextField) {
        if !(sender.text == passwordTextField.text) {
            sender.setBorderColorRed()
            confirmPasswordLabel.isHidden = false
            sender.isValid = false
        } else {
            sender.isValid = true
        }
        updateLoginButton()
    }
    
    func updateLoginButton() {
        if nameTextField.isValid &&
            secondNameTextField.isValid &&
            birthdayTextField.isValid &&
            passwordTextField.isValid &&
            confirmPasswordTextField.isValid {
            
            loginButton.isEnabled = true
            loginButton.backgroundColor = .systemPurple
            print("Form is valid")
            
        } else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = .systemGray
        }
    }
    
    func configureLoginButton() {
        view.addSubview(loginButton)
        
        loginButton.isEnabled = false
        loginButton.backgroundColor = .systemGray
        loginButton.addTarget(self, action: #selector(onLoginButtonTap), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func onLoginButtonTap(sender: UIButton) {
        print("Login btn pressed")
        let mainScreenVC = MainScreenVC()
        mainScreenVC.userName = nameTextField.text
        navigationController?.pushViewController(mainScreenVC, animated: true)
    }
    
}

@available(iOS 17.0, *)
#Preview {
    LoginScreenVC()
}

