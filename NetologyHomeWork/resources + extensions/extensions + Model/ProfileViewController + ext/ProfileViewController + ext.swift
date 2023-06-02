//
//  ProfileViewController + ext.swift
//  NetologyHomeWork
//
//  Created by Николай Прощалыкин on 01.05.2023.
//

import UIKit

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
//MARK: - UITableViewDataSource

    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return ProfileViewController.postModels.count + 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else {
            return ProfileViewController.postModels[section-1].count
        }
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfilePhotosSliderTableViewCell.identifier, for: indexPath) as! ProfilePhotosSliderTableViewCell

            return cell
        }
        else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            
            cell.setupCell(model: ProfileViewController.postModels[indexPath.section - 1][indexPath.row])
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if indexPath.section == 0 {
                navigationController?.pushViewController(PhotosViewController(), animated: true)
            }
        else {
            ProfileViewController.postModels[indexPath.section-1][indexPath.row].views += 1
            
            let vc = PostCellViewController()
            vc.indexPath = indexPath
            vc.model = ProfileViewController.postModels[indexPath.section-1][indexPath.row]
            vc.delegate = self
            self.present(vc,animated: true)
            tableView.reloadData()
            }
        }
    
//MARK: - UITableViewDelegate
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = ProfileHeaderView()
            return header
        }
        return nil
    }
    
}


