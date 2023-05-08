//
//  ProfileHeaderView.swift
//  NetologyHomeWork
//
//  Created by Николай Прощалыкин on 14.04.2023.
//

import UIKit

class ProfileHeaderView: UIView {

    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "coolCat2")
        
        imageView.frame.size = CGSize(width: 120, height: 120)
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill // default value
        
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(profileImageViewTapAction)))
        
        return imageView
    }()
    
    private lazy var darknedView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .black
        view.alpha = 0.5
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var cancelMakeBigAvatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "xmark.circle")
        imageView.tintColor = .white
        
        imageView.frame.size = CGSize(width: 40, height: 40)
        imageView.isHidden = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cancelMakeBigAvatarImageViewTapAction)))
        
        return imageView
    }()
    
    private lazy var avatarBorderImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.frame.size = profileImageView.frame.size
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        imageView.clipsToBounds = true
        
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        return imageView
    }()
    
    @objc func cancelMakeBigAvatarImageViewTapAction() {
        UIView.animate(withDuration: 0.3) {
            
            self.profileImageView.layer.cornerRadius = self.avatarBorderImageView.frame.size.height / 2
            self.profileImageView.clipsToBounds = true
            self.cancelMakeBigAvatarImageView.isHidden = true
            self.layoutIfNeeded()
            
        } completion: { _ in
            UIView.animate(withDuration: 0.5) {
                // layout
                self.topProfileImageView.constant = 16
                self.leadingProfileImageView.constant = 16
                self.widthProfileImageView.constant =  self.avatarBorderImageView.frame.size.width
                self.heightProfileImageView.constant = self.avatarBorderImageView.frame.size.height
                
                //properties
                self.darknedView.isHidden = true
                self.layoutIfNeeded()
            }
            
            
        }
    }
    
    
    @objc func profileImageViewTapAction() {
        
        UIView.animate(withDuration: 0.5) {
            // layout
            self.topProfileImageView.constant = 42
            
            if UIDevice.current.orientation.isLandscape {
                self.leadingProfileImageView.constant = UIScreen.main.bounds.width / 4
                self.widthProfileImageView.constant = UIScreen.main.bounds.width / 2
                self.heightProfileImageView.constant = UIScreen.main.bounds.height / 1.5
            } else {
                self.heightProfileImageView.constant = UIScreen.main.bounds.height / 2
                self.widthProfileImageView.constant = UIScreen.main.bounds.width - 32
            }
            
            

            //properties
            self.darknedView.isHidden = false
            self.layoutIfNeeded()
            
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.profileImageView.layer.cornerRadius = 0
                self.profileImageView.clipsToBounds = false
                self.cancelMakeBigAvatarImageView.isHidden = false
                self.layoutIfNeeded()
            }
        }
        
        
    }
    
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
        textField.textAlignment = .natural
        textField.autocorrectionType = .no
        textField.addTarget(self, action: #selector(statusTextFieldAction), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        textField.leftViewMode = .always
        textField.leftView = spacerView
        
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
    
    private var statusText: String = ""
    
    private var leadingProfileImageView = NSLayoutConstraint()
    private var topProfileImageView = NSLayoutConstraint()
    private var widthProfileImageView = NSLayoutConstraint()
    private var heightProfileImageView = NSLayoutConstraint()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        //setupGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView(){
        self.backgroundColor = .systemGray4
        
        self.addSubview(avatarBorderImageView)
        self.addSubview(nameLabel)
        self.addSubview(statusTextField)
        self.addSubview(setStatusButton)
        self.addSubview(statusLabel)
        self.addSubview(darknedView)
        self.addSubview(cancelMakeBigAvatarImageView)
        self.addSubview(profileImageView)
        
        
        topProfileImageView = profileImageView.topAnchor.constraint(equalTo: self.topAnchor,constant: 16)
        leadingProfileImageView = profileImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16)
        heightProfileImageView = profileImageView.heightAnchor.constraint(equalToConstant: profileImageView.frame.height)
        widthProfileImageView = profileImageView.widthAnchor.constraint(equalToConstant: profileImageView.frame.width)
        
        
        
        NSLayoutConstraint.activate([
            
            // ProfileImageView
            topProfileImageView, leadingProfileImageView, heightProfileImageView, widthProfileImageView,
            
            //darknedView
            darknedView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            darknedView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            darknedView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            darknedView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            
            //cancelMakeBigAvatarImageView
            cancelMakeBigAvatarImageView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: -20),
            cancelMakeBigAvatarImageView.bottomAnchor.constraint(equalTo: profileImageView.topAnchor),
            cancelMakeBigAvatarImageView.widthAnchor.constraint(equalToConstant: cancelMakeBigAvatarImageView.frame.size.width),
            cancelMakeBigAvatarImageView.heightAnchor.constraint(equalToConstant: cancelMakeBigAvatarImageView.frame.size.height),
            
            //avatarBorderImageView
            avatarBorderImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            avatarBorderImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            avatarBorderImageView.widthAnchor.constraint(equalToConstant: avatarBorderImageView.frame.width),
            avatarBorderImageView.heightAnchor.constraint(equalToConstant: avatarBorderImageView.frame.height),
            
            
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor,constant: 27),
            nameLabel.leadingAnchor.constraint(equalTo: avatarBorderImageView.trailingAnchor,constant: 30),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 25),
            statusLabel.leadingAnchor.constraint(equalTo: avatarBorderImageView.trailingAnchor,constant: 30),
            statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor,constant: 8),
            statusTextField.leadingAnchor.constraint(equalTo: avatarBorderImageView.trailingAnchor,constant: 34),
            statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            setStatusButton.topAnchor.constraint(equalTo: avatarBorderImageView.bottomAnchor, constant: 18),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -8),
            
        ])
    }
    
    @objc func setStatusButtonAction() {
        if !statusText.isEmpty {
            statusLabel.text = statusText
        }
        print(statusLabel.text ?? "no status")
    }

    @objc func statusTextFieldAction(_ textField: UITextField){
            statusText = textField.text ?? ""
        
    }
    
}
