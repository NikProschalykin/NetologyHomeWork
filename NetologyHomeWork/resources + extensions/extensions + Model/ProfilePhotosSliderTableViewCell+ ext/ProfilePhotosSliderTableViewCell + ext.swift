//
//  ProfilePhotosSliderTableViewCell + ext.swift
//  NetologyHomeWork
//
//  Created by Николай Прощалыкин on 01.05.2023.
//

import UIKit

// MARK: - UICollectionViewDataSource
extension ProfilePhotosSliderTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ProfileViewController.photosSliderModel.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfilePhotosSladerCollectionViewCell.identifier, for: indexPath) as! ProfilePhotosSladerCollectionViewCell
        
        cell.setupCell(model: ProfileViewController.photosSliderModel[indexPath.item])
        
        return cell
    }
    
// MARK: - UICollectionViewDelegateFlowLayout
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width =  (collectionView.bounds.width - 8 * 4) / 4 
        
        return CGSize(width: width, height: width)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
}

