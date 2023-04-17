//
//  ProfileHeaderView.swift
//  NetologyHomeWork
//
//  Created by Николай Прощалыкин on 14.04.2023.
//

import UIKit

class ProfileHeaderView: UIView {

    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "coolCat2"))
        
        imageView.frame.size = CGSize(width: 120, height: 120)
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Cool Cat"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
    
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        
        label.text = "waiting for something..."
        label.font = UIFont(name: "HelveticaNeue-Regular", size: 14)
        label.textColor = .darkGray
        label.numberOfLines = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Good day for..."
        textField.font = UIFont(name: "HelveticaNeue-Regular", size: 15)
        textField.textColor = .black
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.textAlignment = .left
        textField.autocorrectionType = .no
        textField.addTarget(self, action: #selector(statusTextFieldAction), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Set status", for: .normal)
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(setStatusButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private var statusText: String? = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        self.backgroundColor = UIColor(hexString: "#D3D3D3") //light grey
        
        self.addSubview(profileImageView)
        self.addSubview(nameLabel)
        self.addSubview(statusTextField)
        self.addSubview(setStatusButton)
        self.addSubview(statusLabel)
    
        NSLayoutConstraint.activate([
            
            profileImageView.topAnchor.constraint(equalTo: self.topAnchor,constant: 16),
            profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16),
            profileImageView.widthAnchor.constraint(equalToConstant: profileImageView.frame.width),
            profileImageView.heightAnchor.constraint(equalToConstant: profileImageView.frame.height),
            
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 27),
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor,constant: 30),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 25),
            statusLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor,constant: 30),
            statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor,constant: 8),
            statusTextField.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor,constant: 34),
            statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            setStatusButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 40),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
    
    @objc func setStatusButtonAction() {
        statusLabel.text = statusText
        print(statusLabel.text ?? "no status")
        
        
    }

    @objc func statusTextFieldAction(_ textField: UITextField){
        statusText = textField.text
    }
    
}
