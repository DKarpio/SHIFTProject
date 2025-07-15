//
//  SHIFTTextField.swift
//  SHIFTProject
//
//  Created by Дмитрий К on 10.07.2025.
//

import UIKit

class SHIFTDateTextField: UITextField {
    
    private var datePicker = UIDatePicker()
    private let toolbar = UIToolbar()
    var isValid: Bool = false
    
    public var selectedDate: Date {
        datePicker.date
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTextField()
        configureDatePicker()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTextField() {
        layer.cornerRadius = 10
        layer.borderWidth = 2
        borderStyle = .roundedRect
        layer.borderColor = UIColor.systemPurple.cgColor
        //textColor = .label
        //tintColor = .label
        textAlignment = .left
        font = UIFont.preferredFont(forTextStyle: .title2)
        translatesAutoresizingMaskIntoConstraints = false
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        //backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        delegate = self
        inputView = datePicker
        inputAccessoryView = toolbar
    }
    
    private func configureDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        
        toolbar.barStyle = .default
        toolbar.sizeToFit()
        
        let confirmDateAction = UIAction(title: "") { [self] (_) in
            text = datePicker.date.formatted(date: .numeric, time: .omitted)
            endEditing(true)
        }
        let doneButton = UIBarButtonItem(systemItem: .done, primaryAction: confirmDateAction)
        doneButton.tintColor = .systemPurple
        
        toolbar.setItems([doneButton], animated: true)        
    }
}

extension SHIFTDateTextField: UITextFieldDelegate {
    
    public func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        layer.borderColor = UIColor.systemPurple.cgColor
        return true
    }
    
}
