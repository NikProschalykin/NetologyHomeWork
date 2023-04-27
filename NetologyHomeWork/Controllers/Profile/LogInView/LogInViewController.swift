//
//  LogInViewController.swift
//  NetologyHomeWork
//
//  Created by Николай Прощалыкин on 21.04.2023.
//

import UIKit

class LogInViewController: UIViewController {

    private let notificationCenter = NotificationCenter.default
    private var loginText = ""
    private var passwordText = ""
    
    private let separatorStackView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 3))
        
        view.backgroundColor = .lightGray
        
        return view
    }()

    
    
    //лого ВК
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
            
        return imageView
    }()
    
    // StackView текстфилдов
    private lazy var textFieldsStackView: UIStackView = {
        var stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.cornerRadius = 10
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        
 
        return stackView
    }()
    
    // логин тексфилд
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.tintColor = .systemBlue
        textField.backgroundColor = .systemGray6
        textField.autocapitalizationType = .none
        textField.placeholder = "Email or phone"
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(logTextFieldChanged), for: .editingChanged)
        
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        textField.leftViewMode = .always
        textField.leftView = spacerView
        
        return textField
    }()
    
    
    @objc private func logTextFieldChanged(_ textField: UITextField){
        loginText = textField.text ?? ""
    }
    
    //пароль текстфилд
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.tintColor = .systemBlue
        textField.backgroundColor = .systemGray6
        textField.autocapitalizationType = .none
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(PaswdTextFieldChanged), for: .editingChanged)
        
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        textField.leftViewMode = .always
        textField.leftView = spacerView
        
        return textField
    }()
    
    @objc private func PaswdTextFieldChanged(_ textField: UITextField){
        passwordText = textField.text ?? ""
    }
    
    //конфигурация кнопки в зависимости от состояния
    let buttonHandler: UIButton.ConfigurationUpdateHandler = { button in
        switch button.state {
        case .selected:
            button.alpha = 0.8
        case .highlighted:
            button.alpha = 0.8
        case .highlighted:
            button.alpha = 0.8
        default:
            button.alpha = 1
        }
    }
    
    // кнопка logIn
    private lazy var logInButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        var button = UIButton(configuration: configuration)
        
        
        let backGroundImage = UIImage(named: "blue_pixel")
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(backGroundImage, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(logInButtonAction), for: .touchUpInside)
        button.configurationUpdateHandler = buttonHandler
        
    
        
        return button
    }()
    
    @objc private func logInButtonAction() {
        //Если пользователь ввел пароль или логин
        guard !loginText.isEmpty || !passwordText.isEmpty else { return }
            let profileViewController = ProfileViewController()
            self.navigationController?.pushViewController(profileViewController, animated: true)
        }
       
    //scrollView
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    //contentView
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hexString: "#F8F9F9")
        
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setupInitLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        notificationCenter.addObserver(self, selector: #selector(keyBoardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        notificationCenter.addObserver(self, selector: #selector(keyBoardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyBoardShow(notification: NSNotification){
        if let keyBoardSize: CGRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
    
            scrollView.contentInset.bottom = keyBoardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0,
                                                                    left: 0,
                                                                    bottom: keyBoardSize.height,
                                                                    right: 0)
        }
    }
    
    @objc private func keyBoardHide() {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    
    private func configure(){
        view.backgroundColor = UIColor(hexString: "#F8F9F9")
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
    private func setupInitLayout(){
    
        //scrollView layout
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
        
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        
        ])
        
        //layout contentView
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            
        ])
        
        
        //layout остальных UI-элементов
        [textFieldsStackView,logoImageView,logInButton].forEach({ contentView.addSubview($0) })
        [loginTextField,separatorStackView,passwordTextField].forEach({ textFieldsStackView.addArrangedSubview($0) })
        
        NSLayoutConstraint.activate([
            
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            separatorStackView.heightAnchor.constraint(equalToConstant: 0.5),
            
            textFieldsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            textFieldsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            textFieldsStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor,constant: 120),
            textFieldsStackView.heightAnchor.constraint(equalToConstant: 100),
        
            logInButton.topAnchor.constraint(equalTo: textFieldsStackView.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
            
        ])
        
    }
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
