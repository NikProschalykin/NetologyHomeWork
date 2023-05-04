//
//  PhotosGalleryModel.swift
//  NetologyHomeWork
//
//  Created by Николай Прощалыкин on 01.05.2023.
//

import UIKit


struct PhotosGalleryModel {
    
    var image: UIImage
    
    public static func makeMockModel() -> [PhotosGalleryModel] {
        
        var model = [PhotosGalleryModel]()
        
        for i in 1 ... 20 {
            model.append(PhotosGalleryModel(image: UIImage(named: "\(i)")!))
        }
        
        return model
    }
}
