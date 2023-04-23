//
//  PostViewController.swift
//  NetologyHomeWork
//
//  Created by Николай Прощалыкин on 08.04.2023.
//

import UIKit

class PostViewController: UIViewController {
    
    var titlePost = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        // Do any additional setup after loading the view.
    }
    
    private func configure() {
        view.backgroundColor = UIColor(hexString: "#F8F9F9")
        self.title = titlePost
        
        let infoBarButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(infoBarButtonAction))
        navigationItem.rightBarButtonItem = infoBarButton
    }

    @objc func infoBarButtonAction() {
        let InfoViewController = InfoViewController()
    
        present(InfoViewController,animated: true)
    }

}
