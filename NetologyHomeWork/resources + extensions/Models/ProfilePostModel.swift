//
//  ProfilePostModel.swift
//  NetologyHomeWork
//
//  Created by Николай Прощалыкин on 27.04.2023.
//

import UIKit

struct ProfilePostModel {
    
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
    
    public static func makeMockModel() -> [[ProfilePostModel]]{
        var model = [[ProfilePostModel]]()
        
        
        model.append([ProfilePostModel(author: "DSTU News",
                                      description: "Don State Technical University held a working meeting with a delegation from the Republic of Seychelles. The parties discussed the prospects of cooperation in science, education, sports and tourism.",
                                      image: "DSTUColoboration",
                                      likes: 358,
                                      views: 1325)])
        
        model.append([ProfilePostModel(author: "Game Reader",
                                      description: "Valve announced a new Source 2 engine for CS:GO. The estimated release date is the summer of 2023.",
                                      image: "css2",
                                      likes: 4892,
                                      views: 20480)])
        
        model.append([ProfilePostModel(author: "British travel newspaper",
                                      description: "Connemara\nNorth-west of Galway city lies one of Ireland’s most alluring wildernesses. The haunting beauty of the Connemara region stretches across County Galway: a landscape of slate-coloured lakes, bogland, sheep-dotted mountains, rugged coastline, hidden bays and small towns",
                                      image: "connemaraLandScape",
                                      likes: 73452,
                                      views: 485234)])
        
        model.append([ProfilePostModel(author: "Serials/Movies checker",
                                      description: "The possibility of a potential Scrubs reboot has received an encouraging response from Zach Braff, the star of the show revealed that he is not ready to reprise his role.",
                                      image: "scrubs",
                                      likes: 1890,
                                      views: 9654)])
        
        
        return model
    }
    
}
