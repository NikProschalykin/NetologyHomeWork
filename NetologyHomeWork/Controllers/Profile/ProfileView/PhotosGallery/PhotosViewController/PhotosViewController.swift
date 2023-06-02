//
//  PhotosViewController.swift
//  NetologyHomeWork
//
//  Created by Николай Прощалыкин on 01.05.2023.
//

import UIKit

final class PhotosViewController: UIViewController {
    
    public static let photosGalleryModel = PhotosGalleryModel.makeMockModel()
    
    private lazy var imageView: UIImageView = {
       let imageView = UIImageView(image: UIImage())
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        
        return imageView
    }()
    
    private lazy var darkView: UIView = {
       let view = UIView()
        
        view.backgroundColor = .black
        view.alpha = 0.5
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        layout.scrollDirection = .vertical
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        return collectionView
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
    
    @objc func cancelMakeBigAvatarImageViewTapAction() {
        self.darkView.isHidden = true
        self.imageView.isHidden = true
        self.cancelMakeBigAvatarImageView.isHidden = true
        self.view.layoutIfNeeded()
    }
    
    
    public func selectItemAnimation(indexPath: IndexPath) {
        UIView.animate(withDuration: 0.3, delay: 0.0) {
            self.imageView.image = PhotosViewController.photosGalleryModel[indexPath.item].image
            self.darkView.isHidden = false
            self.imageView.isHidden = false
            self.cancelMakeBigAvatarImageView.isHidden = false
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func configure() {
        view.backgroundColor = UIColor(hexString: "#F8F9F9")
        title = "Photo Gallery"
    }
    
    private func layout() {
        
        view.addSubview(collectionView)
        view.addSubview(darkView)
        view.addSubview(imageView)
        view.addSubview(cancelMakeBigAvatarImageView)
        
        NSLayoutConstraint.activate([
        
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            darkView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            darkView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            darkView.topAnchor.constraint(equalTo: view.topAnchor),
            darkView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2),
            imageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),
            
            cancelMakeBigAvatarImageView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -20),
            cancelMakeBigAvatarImageView.bottomAnchor.constraint(equalTo: imageView.topAnchor),
            cancelMakeBigAvatarImageView.widthAnchor.constraint(equalToConstant: cancelMakeBigAvatarImageView.frame.size.width),
            cancelMakeBigAvatarImageView.heightAnchor.constraint(equalToConstant: cancelMakeBigAvatarImageView.frame.size.height),
        
        ])
        
    }
}
