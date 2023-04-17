//
//  NavBarController.swift
//  NetologyHomeWork
//
//  Created by Николай Прощалыкин on 14.04.2023.
//

import UIKit

final class NavBarController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        navigationBar.isTranslucent = false // чтобы не заканчивался на границе статус бара
        
       
    }
}
