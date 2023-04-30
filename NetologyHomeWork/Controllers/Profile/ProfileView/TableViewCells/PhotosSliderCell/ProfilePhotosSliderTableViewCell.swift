//
//  ProfilePhotosSliderTableViewCell.swift
//  NetologyHomeWork
//
//  Created by Николай Прощалыкин on 30.04.2023.
//

import UIKit

final class ProfilePhotosSliderTableViewCell: UITableViewCell {
    
    
    private lazy var contentCellView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        layout.scrollDirection = .horizontal
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ProfilePhotosSladerCollectionViewCell.self, forCellWithReuseIdentifier: ProfilePhotosSladerCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        return collectionView
    }()
    
    private lazy var photosSliderLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Photos"
        label.tintColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var arrowImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "arrowshape.right.fill"))
        
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .black
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionView.reloadData()
        layout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func layout() {
        
        [contentCellView,collectionView,photosSliderLabel,arrowImage].forEach({ contentView.addSubview($0) })
        
        NSLayoutConstraint.activate([
        
            //contentCellView
            contentCellView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            contentCellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentCellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentCellView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            
            //photosSliderLabel
            photosSliderLabel.topAnchor.constraint(equalTo: contentCellView.topAnchor,constant: 12),
            photosSliderLabel.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor, constant: 12),
            
            //openPhotosGalleryButton
            arrowImage.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor, constant: -16),
            arrowImage.centerYAnchor.constraint(equalTo: photosSliderLabel.centerYAnchor),
            arrowImage.widthAnchor.constraint(equalToConstant: 30),
            
            //collectionView
            collectionView.topAnchor.constraint(equalTo: photosSliderLabel.bottomAnchor, constant: 12),
            collectionView.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor, constant: 12),
            collectionView.bottomAnchor.constraint(equalTo: contentCellView.bottomAnchor, constant: -12),
            collectionView.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor, constant: -12),
            collectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 4)
        ])
        
    }
    
}
