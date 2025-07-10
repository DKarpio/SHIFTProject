//
//  ViewController.swift
//  SHIFTProject
//
//  Created by Дмитрий К on 10.07.2025.
//

import UIKit

class ViewController: UIViewController {
    
    let nameTextField = SHIFTTextField()
    let secondNameTextField = SHIFTTextField()
    let birthdayTextField = SHIFTDateTextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureNameTextField()
        configureSecondNameTextFiled()
        configureBirthdayTextField()
    }
    
    func configureNameTextField() {
        view.addSubview(nameTextField)
        
        nameTextField.placeholder = "Имя"
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            nameTextField.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    
    func configureSecondNameTextFiled() {
        view.addSubview(secondNameTextField)
        
        secondNameTextField.placeholder = "Фамилия"
        
        NSLayoutConstraint.activate([
            secondNameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 24),
            secondNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            secondNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            secondNameTextField.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    func configureBirthdayTextField() {
        view.addSubview(birthdayTextField)
        
        birthdayTextField.placeholder = "Дата рождения"
        
        NSLayoutConstraint.activate([
            birthdayTextField.topAnchor.constraint(equalTo: secondNameTextField.bottomAnchor, constant: 24),
            birthdayTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            birthdayTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            birthdayTextField.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
}

