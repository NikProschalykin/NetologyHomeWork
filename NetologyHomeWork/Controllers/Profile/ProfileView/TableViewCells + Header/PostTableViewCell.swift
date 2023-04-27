//
//  PostTableViewCell.swift
//  NetologyHomeWork
//
//  Created by Николай Прощалыкин on 27.04.2023.
//

import UIKit

final class PostTableViewCell: UITableViewCell {
    
    private lazy var contentCellView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var cellImage: UIImageView = {
        let image = UIImageView()
        
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellImage.image = nil
        viewsLabel.text = nil
        authorLabel.text = nil
        descriptionLabel.text = nil
        likesLabel.text = nil
    }
    
    func setupCell(model: ProfilePostModel) {
        cellImage.image = UIImage(named: model.image)
        authorLabel.text = model.author
        descriptionLabel.text = model.description
        viewsLabel.text = "Views: \(String(model.views))"
        likesLabel.text = "Likes: \(String(model.likes))"
        
    }
    
    
    private func layout() {
        
        [contentCellView, cellImage, viewsLabel, authorLabel, descriptionLabel, likesLabel].forEach({ contentView.addSubview($0) })
        
        let viewInset: CGFloat = 8
        let topBottomInset: CGFloat = 8
        let leadingTrailingInset: CGFloat = 16
        let imageWidth: CGFloat = UIScreen.main.bounds.width
        
        NSLayoutConstraint.activate([
        
            //contentCellView
            contentCellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: viewInset),
            contentCellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -viewInset),
            contentCellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: viewInset),
            contentCellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -viewInset),
            
            //authorLabel
            authorLabel.topAnchor.constraint(equalTo: contentCellView.topAnchor, constant: topBottomInset),
            authorLabel.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor, constant: leadingTrailingInset),
            authorLabel.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor,constant: -leadingTrailingInset),
            
            //cellImage
            cellImage.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: topBottomInset),
            cellImage.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor),
            cellImage.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor),
            cellImage.widthAnchor.constraint(equalToConstant: imageWidth),
            cellImage.heightAnchor.constraint(equalToConstant: imageWidth),
            
            //descriptionLabel
            descriptionLabel.topAnchor.constraint(equalTo: cellImage.bottomAnchor, constant: topBottomInset),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor, constant: leadingTrailingInset),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor,constant: -leadingTrailingInset),
            
            //likesLabel
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: topBottomInset * 2),
            likesLabel.bottomAnchor.constraint(equalTo: contentCellView.bottomAnchor, constant: -topBottomInset),
            likesLabel.leadingAnchor.constraint(equalTo: contentCellView.leadingAnchor, constant: leadingTrailingInset),
            
            //viewsLabel
            viewsLabel.topAnchor.constraint(equalTo: likesLabel.topAnchor),
            viewsLabel.bottomAnchor.constraint(equalTo: likesLabel.bottomAnchor),
            viewsLabel.trailingAnchor.constraint(equalTo: contentCellView.trailingAnchor, constant: -leadingTrailingInset),

        ])
    }
}
