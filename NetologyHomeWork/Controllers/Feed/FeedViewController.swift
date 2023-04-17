//
//  FeedViewController.swift
//  NetologyHomeWork
//
//  Created by Николай Прощалыкин on 07.04.2023.
//

import UIKit

class FeedViewController: UIViewController {

    private lazy var postButton1: UIButton = {

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
    
    private lazy var postButton2: UIButton = {

        let postButton = UIButton()

        postButton.backgroundColor = .systemBlue
        postButton.layer.cornerRadius = 16
        postButton.setTitle("One more move to post", for: .normal)
        postButton.setTitleColor(.white, for: .normal)
        postButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)

        postButton.addTarget(self, action: #selector(postButtonAction), for: .touchUpInside)
        postButton.translatesAutoresizingMaskIntoConstraints = false


        return postButton

    }()
    
    private lazy var feedStackView: UIStackView = {
        var stackView = UIStackView()
        
        //stackView.backgroundColor = .systemGray5
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        return stackView
    }()
    
    var post = Post(title: "My Post")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setupInitLayout()
    }
    
    private func setupInitLayout(){
        NSLayoutConstraint.activate([
        
            feedStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            feedStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
        ])
    }
    
    private func configure() {
        view.backgroundColor = UIColor(hexString: "#F8F9F9")
        
        view.addSubview(feedStackView)
        
        feedStackView.addArrangedSubview(postButton1)
        feedStackView.addArrangedSubview(postButton2)
    }
    
    @objc private func postButtonAction() {

            let postViewController = PostViewController()

            self.navigationController?.pushViewController(postViewController, animated: true)
            postViewController.titlePost = post.title
        }

}

