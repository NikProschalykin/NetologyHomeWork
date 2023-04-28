//
//  ProfileViewController.swift
//  NetologyHomeWork
//
//  Created by Николай Прощалыкин on 07.04.2023.
//

import UIKit

final class ProfileViewController: UIViewController {

    public static var postModels = ProfilePostModel.makeMockModel()
    
    
    private lazy var profileTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        layout()
        
    }
    
    private func layout() {
        
        view.addSubview(profileTableView)
        NSLayoutConstraint.activate([
            
            profileTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
            
        ])
    }


    private func configure() {
        //view.backgroundColor = UIColor(hexString: "#F8F9F9")
        title = "Profile"
        
        
    }
}
