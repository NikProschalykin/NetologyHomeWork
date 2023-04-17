//
//  ProfileViewController.swift
//  NetologyHomeWork
//
//  Created by Николай Прощалыкин on 07.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileHeader = ProfileHeaderView()
    
    private lazy var someBottomButton: UIButton = {
       var button = UIButton()
        
        button.setTitle("Some button", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        
       return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        NSLayoutConstraint.activate([
            profileHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileHeader.heightAnchor.constraint(equalToConstant: 220),
            
            someBottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            someBottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            someBottomButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            
        ])
        
    }

    private func configure() {
        //view.backgroundColor = UIColor(hexString: "#F8F9F9")
        profileHeader.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileHeader)
        view.addSubview(someBottomButton)
        
    }
}
