//
//  MainScreenVC.swift
//  SHIFTProject
//
//  Created by Дмитрий К on 15.07.2025.
//

import UIKit

class MainScreenVC: UIViewController {
    
    var userName: String!
    
    var books: [Data] = [] {
        didSet {
            table.dataSource = self
            table.reloadData()
        }
    }
    
    let table = UITableView()
    let welcomeButton = SHIFTButton(title: "Приветствие")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Главный экран"
        view.backgroundColor = .systemBackground
        
        configureWelcomeButton()
        configureTable()
        Task {            
            books = try await NetworkManager.shared.getBooks().data
        }
        
    }

    
    func configureTable() {
        view.addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = false
        
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            table.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            table.bottomAnchor.constraint(equalTo: welcomeButton.topAnchor, constant: -20)
        ])
    }
    
    func configureWelcomeButton() {
        view.addSubview(welcomeButton)
        welcomeButton.addTarget(self, action: #selector(onWelcomeButtonPress), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            welcomeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            welcomeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            welcomeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            welcomeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func onWelcomeButtonPress() {
        print("Button press")
    }
}

extension MainScreenVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        books.count
    }
    
    //Возвращается вьюшка для каждой ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var contentConfig = cell.defaultContentConfiguration()
        contentConfig.text = books[indexPath.row].title
        contentConfig.secondaryText = books[indexPath.row].author
        cell.contentConfiguration = contentConfig
        return cell
    }
    
    
}
