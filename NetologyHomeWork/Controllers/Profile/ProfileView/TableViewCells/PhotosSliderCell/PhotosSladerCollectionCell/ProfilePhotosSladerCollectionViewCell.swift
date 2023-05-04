//
//  ProfilePhotosSladerCollectionViewCell.swift
//  NetologyHomeWork
//
//  Created by Николай Прощалыкин on 30.04.2023.
//

import UIKit

final class ProfilePhotosSladerCollectionViewCell: UICollectionViewCell {
    
    private lazy var contentCellView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    public func setupCell(model: ProfilePhotosSliderModel) {
        photoImageView.image = model.image
    }
    
    
    private func layout() {
        
        [contentCellView, photoImageView].forEach({ contentView.addSubview($0) })
        
        NSLayoutConstraint.activate([
        
            //contentCellView
            contentCellView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            contentCellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentCellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentCellView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            
            //photoImageView
            photoImageView.topAnchor.constraint(equalTo: contentCellView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentCellView.bottomAnchor),
        
        ])
        
    }
    
}
