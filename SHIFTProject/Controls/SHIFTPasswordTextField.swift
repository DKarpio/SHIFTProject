//
//  SHIFTPasswordTextField.swift
//  SHIFTProject
//
//  Created by Дмитрий К on 10.07.2025.
//

import UIKit

class SHIFTPasswordTextField: UITextField {
    
    let toolbar = UIToolbar()
    var isValid: Bool = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        layer.borderWidth = 2
        borderStyle = .roundedRect
        layer.borderColor = UIColor.systemPurple.cgColor
        font = UIFont.preferredFont(forTextStyle: .title2)
        translatesAutoresizingMaskIntoConstraints = false
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        autocorrectionType = .no
        delegate = self
        isSecureTextEntry = true
        textContentType = .newPassword
        configureToolbar()
        inputAccessoryView = toolbar
    }
    
    private func configureToolbar() {
        
        //toolbar.barStyle = .default
        toolbar.sizeToFit()
        
        let hideKeyboard = UIAction(title: "") { [self] (_) in
            endEditing(true)
        }
        let doneButton = UIBarButtonItem(systemItem: .done, primaryAction: hideKeyboard)
        doneButton.tintColor = .systemPurple
        
        toolbar.setItems([doneButton], animated: true)
    }
}

extension SHIFTPasswordTextField: UITextFieldDelegate {
    
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        layer.borderColor = UIColor.systemPurple.cgColor
        return true
    }
    
}
