//
//  SHIFTLabel.swift
//  SHIFTProject
//
//  Created by Дмитрий К on 11.07.2025.
//

import UIKit

class SHIFTLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    init(text: String?) {
        super.init(frame: .zero)
        self.text = text
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        textColor = .label
        font = UIFont.preferredFont(forTextStyle: .caption1)
        translatesAutoresizingMaskIntoConstraints = false
        adjustsFontSizeToFitWidth = true
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
    }
}
