//
//  DancerModel.swift
//  ZegiestowskyFavoriteItems
//
//  Created by Ashley Zegiestowsky on 10/21/15.
//  Copyright © 2015 Zegiestowsky, Ashley. All rights reserved.
//

import Foundation
import UIKit

class Dancer {
    var name: String
    var style: String
    var image: UIImage?
    
    init(name: String, style: String, imageName: String) {
        self.name = name
        self.style = style
        self.image = UIImage(named: imageName)
    }
}