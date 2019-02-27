//
//  ViewShadow.swift
//  reading-bea
//
//  Created by Craig Harvie on 26/02/2019.
//  Copyright © 2019 Reading Bea. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowColor = Colours.baseBlack.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = CGSize(width: 1, height: 2)
        layer.shadowRadius = 3
//        layer.shouldRasterize = true
    }
    
}
