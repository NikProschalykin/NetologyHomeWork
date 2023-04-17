//
//  ProfileViewController.swift
//  NetologyHomeWork
//
//  Created by Николай Прощалыкин on 07.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileHeader = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeader.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        
    }

    private func configure() {
        //view.backgroundColor = UIColor(hexString: "#F8F9F9")
        view.addSubview(profileHeader)
        
        
    }
}
