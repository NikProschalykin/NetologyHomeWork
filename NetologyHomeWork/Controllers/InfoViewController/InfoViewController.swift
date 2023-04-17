//
//  InfoViewController.swift
//  NetologyHomeWork
//
//  Created by Николай Прощалыкин on 08.04.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    private lazy var clickMeButton: UIButton = {

        let clickMeButton = UIButton()

        clickMeButton.backgroundColor = .systemBlue
        clickMeButton.layer.cornerRadius = 16
        clickMeButton.setTitle("Click me", for: .normal)
        clickMeButton.setTitleColor(.white, for: .normal)
        clickMeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        clickMeButton.addTarget(self, action: #selector(clickMeButtonAction), for: .touchUpInside)
        clickMeButton.translatesAutoresizingMaskIntoConstraints = false

        
        return clickMeButton

    }()
    
    private func clickMeButtonSetup(clickMeButton: UIButton) {
       
        view.addSubview(clickMeButton)
        
        NSLayoutConstraint.activate([
            clickMeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -90),
            clickMeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 60),
            clickMeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60)
        ])
        
    }
    
    @objc private func clickMeButtonAction() {
        
        let alertController = UIAlertController(title: "Thanks for click", message: "What's now?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { _ in print("An \"OK\" action was selected") })
        alertController.addAction(okAction)
        
        let canselAction = UIAlertAction(title: "Cancel", style: .default, handler: { _ in print("An \"Cansel\" action was selected") })
        alertController.addAction(canselAction)
        
        present(alertController,animated: true)
        }
    
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.backgroundColor = UIColor(hexString: "#F8F9F9")
        clickMeButtonSetup(clickMeButton: clickMeButton)
    }

}
