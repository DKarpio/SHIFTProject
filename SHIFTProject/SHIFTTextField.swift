//
//  SHIFTTextField.swift
//  SHIFTProject
//
//  Created by Дмитрий К on 10.07.2025.
//

import UIKit

class SHIFTTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        layer.borderWidth = 1
        borderStyle = .roundedRect
        layer.borderColor = UIColor.systemGray4.cgColor
        //textColor = .label
        //tintColor = .label
        //textAlignment = .left
        font = UIFont.preferredFont(forTextStyle: .title2)
        translatesAutoresizingMaskIntoConstraints = false
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        //backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        
    }
    
}
