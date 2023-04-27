//
//  UIViewController + ext.swift
//  NetologyHomeWork
//
//  Created by Николай Прощалыкин on 27.04.2023.
//

import UIKit

extension UIViewController: UITableViewDataSource,UITableViewDelegate {
    
//MARK: - UITableViewDataSource

    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return ProfileViewController.postModels.count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProfileViewController.postModels[section].count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        
        cell.setupCell(model: ProfileViewController.postModels[indexPath.section][indexPath.row])
        
        return cell
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
