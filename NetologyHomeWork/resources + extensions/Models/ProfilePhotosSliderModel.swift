//
//  ProfilePhotosSliderModel.swift
//  NetologyHomeWork
//
//  Created by Николай Прощалыкин on 30.04.2023.
//

import UIKit

struct ProfilePhotosSliderModel {
    
    var image: UIImage
    
    public static func makeMockModel() -> [ProfilePhotosSliderModel] {
        
        var model = [ProfilePhotosSliderModel]()
        
        for i in 1 ... 4 {
            model.append(ProfilePhotosSliderModel(image: UIImage(named: "ProfilePhotosSlider\(i)")!))
        }
        
        return model
    }
}
