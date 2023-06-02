//
//  PostCellViewController.swift
//  NetologyHomeWork
//
//  Created by Николай Прощалыкин on 01.06.2023.
//

import UIKit

final class PostCellViewController: UIViewController {
    
    var indexPath: IndexPath?
    var model: ProfilePostModel?
    weak var delegate: PostCellDelegate? 
    
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        
        label.text = model?.author
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 2
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var heartImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "heart.fill"))
        
        imageView.tintColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        label.text = model?.description
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Likes: \(String(describing: model?.likes ?? 0))"
        label.font = .systemFont(ofSize: 16)
        if model?.isLiked ?? false {
            label.textColor = .red
            heartImageView.isHidden = false
            leadingLikeView.constant += 16
            self.view.layoutIfNeeded()
        }  else {
            label.textColor = .black
        }
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(likesLabelTap)))
        
        return label
    }()
    
    @objc func likesLabelTap() {
        if let delegate = delegate {
            guard model?.isLiked == false else { return }
            if let indexPath = indexPath {
                
                ProfileViewController.postModels[indexPath.section-1][indexPath.row].likes += 1
                ProfileViewController.postModels[indexPath.section-1][indexPath.row].isLiked = true
                
                
                heartImageView.isHidden = false
                leadingLikeView.constant += 16
                view.layoutIfNeeded()
                
                
                likesLabel.text = "Likes: \(String(describing: (model?.likes ?? 0)+1))"
                    likesLabel.textColor = .red
                
                    delegate.likeTapped()
                    model?.isLiked = true
            }
        }
    }
    
    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Views: \(String(describing: model?.views ?? 0))"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var cellImage: UIImageView = {
        let imageView = UIImageView()
        
        if let image = model?.image {
            imageView.image = UIImage(named: image)
        }
        
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        layout()
    }
    override func viewWillLayoutSubviews() {
        guard model?.isLiked == true else { return }
        leadingLikeView.constant = 32
    }
    
    private var leadingLikeView = NSLayoutConstraint()
    
    private func layout() {
        [authorLabel,descriptionLabel,likesLabel,viewsLabel,cellImage,heartImageView].forEach({view.addSubview($0)})
        
        let marginInsert: CGFloat = 16
        let paddingInsert: CGFloat = 8
        let imageWidth: CGFloat = UIScreen.main.bounds.width
        let imageHeight: CGFloat = UIScreen.main.bounds.height / 2
        leadingLikeView = likesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: marginInsert)
        
        NSLayoutConstraint.activate([
            
            //authorLabel
            authorLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: marginInsert),
            authorLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -marginInsert),
            authorLabel.bottomAnchor.constraint(equalTo: cellImage.topAnchor),
            
            //cellImage
            cellImage.topAnchor.constraint(equalTo: authorLabel.bottomAnchor,constant: paddingInsert),
            cellImage.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: marginInsert),
            cellImage.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -marginInsert),
            cellImage.widthAnchor.constraint(equalToConstant: imageWidth),
            cellImage.heightAnchor.constraint(equalToConstant: imageHeight),
            
            //descriptionLabel
            descriptionLabel.topAnchor.constraint(equalTo: cellImage.bottomAnchor,constant: paddingInsert),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: marginInsert),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -marginInsert),
            
            //likesLabel
            leadingLikeView,
            likesLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -marginInsert*3),
            
            //viewsLabel
            viewsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -marginInsert),
            viewsLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -marginInsert*3),
            
            //heartImageView
            heartImageView.widthAnchor.constraint(equalToConstant: marginInsert),
            heartImageView.heightAnchor.constraint(equalToConstant: marginInsert),
            heartImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: marginInsert),
            
            heartImageView.topAnchor.constraint(equalTo: likesLabel.topAnchor),
        ])
    }
    
}
