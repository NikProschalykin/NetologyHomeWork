//
//  ProfileHeaderView.swift
//  NetologyHomeWork
//
//  Created by Николай Прощалыкин on 14.04.2023.
//

import UIKit

class ProfileHeaderView: UIView {

    var profileImageView = UIImageView(image: UIImage(named: "coolCat2"))
    var nameLabel = UILabel()
    var statusLabel = UILabel()
    var statusTextField = UITextField()
    var showStatusButton = UIButton()
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
        
        
        profileImageView.frame.size = CGSize(width: 120, height: 120)
        profileImageView.layer.cornerRadius = profileImageView.frame.size.height / 2
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.borderWidth = 3
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.text = "Cool Cat"
        nameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        nameLabel.textColor = .black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        statusLabel.text = "waiting for something..."
        statusLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 14)
        statusLabel.textColor = .darkGray
        statusLabel.numberOfLines = 4
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        statusTextField.placeholder = "Good day for..."
        statusTextField.font = UIFont(name: "HelveticaNeue-Regular", size: 15)
        statusTextField.textColor = .black
        statusTextField.backgroundColor = .white
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.textAlignment = .left
        statusTextField.autocorrectionType = .no
        statusTextField.addTarget(self, action: #selector(statusTextFieldAction), for: .editingChanged)
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        
        showStatusButton.backgroundColor = .systemBlue
        showStatusButton.setTitleColor(.white, for: .normal)
        showStatusButton.setTitle("Set status", for: .normal)
        showStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        showStatusButton.layer.shadowRadius = 4
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOpacity = 0.7
        showStatusButton.addTarget(self, action: #selector(showStatusButtonAction), for: .touchUpInside)
        showStatusButton.translatesAutoresizingMaskIntoConstraints = false
        
       
        
        self.addSubview(profileImageView)
        self.addSubview(nameLabel)
        self.addSubview(statusTextField)
        self.addSubview(showStatusButton)
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
            
            showStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            showStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            showStatusButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 40),
            showStatusButton.heightAnchor.constraint(equalToConstant: 50)
            
            
        ])
    }
    
    @objc func showStatusButtonAction() {
        print(statusLabel.text ?? "no status")
        statusLabel.text = statusText
        
    }

    @objc func statusTextFieldAction(_ textField: UITextField){
        statusText = textField.text
    }
    
}
