//
//  WelcomeVC.swift
//  SHIFTProject
//
//  Created by Дмитрий К on 20.07.2025.
//

import UIKit

class WelcomeVC: UIViewController {
    
    var userName: String!
    let welcomeLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(welcomeLabel)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.font = .preferredFont(forTextStyle: .largeTitle)
        welcomeLabel.numberOfLines = 0
        welcomeLabel.textAlignment = .center
        welcomeLabel.text = "Привет, " + userName
        
        sheetPresentationController?.detents = [.medium()]
        sheetPresentationController?.prefersGrabberVisible = true
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            welcomeLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])

    }

}

@available(iOS 17.0, *)
#Preview {
    let vc = WelcomeVC()
    vc.userName = "Welcome to SHIFT! Looooooooooong teeeeeeext"
    return vc
}
