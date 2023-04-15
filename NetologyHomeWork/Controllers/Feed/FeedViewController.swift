//
//  FeedViewController.swift
//  NetologyHomeWork
//
//  Created by Николай Прощалыкин on 07.04.2023.
//

import UIKit

class FeedViewController: UIViewController {

    private lazy var postButton: UIButton = {

        let postButton = UIButton()

        postButton.backgroundColor = .systemBlue
        postButton.layer.cornerRadius = 16
        postButton.setTitle("Move to post", for: .normal)
        postButton.setTitleColor(.white, for: .normal)
        postButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        postButton.addTarget(self, action: #selector(postButtonAction), for: .touchUpInside)
        postButton.translatesAutoresizingMaskIntoConstraints = false

        
        return postButton

    }()
    
    var post = Post(title: "My Post")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.backgroundColor = UIColor(hexString: "#F8F9F9")
        postButtonSetup(postButton: postButton)
    }
    
    private func postButtonSetup(postButton: UIButton) {
       
        view.addSubview(postButton)
        
        NSLayoutConstraint.activate([
            postButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -50),
            postButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 60),
            postButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60)
        ])
        
    }
    
    @objc private func postButtonAction() {

            let postViewController = PostViewController()
        
            self.navigationController?.pushViewController(postViewController, animated: true)
            postViewController.titlePost = post.title
        }

}

