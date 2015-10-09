//
//  GreekIslandModel.swift
//  ZegiestowskyGreekIslandsWithSegue
//
//  Created by Ashley Zegiestowsky on 9/29/15.
//  Copyright © 2015 Zegiestowsky, Ashley. All rights reserved.
//

import Foundation
import UIKit

class GreekIsland {
    var name: String
    var attractions: String
    var image: UIImage?
    var location: String?
    var weather: String?
    var region: String? //north or south
    
    init(name: String, attractions: String, imageName: String) {
        self.name = name
        self.attractions = attractions
        self.image = UIImage(named: imageName)
    }
}
