//
//  UISearchBarFont.swift
//  reading-bea
//
//  Created by Craig Harvie on 27/02/2019.
//  Copyright © 2019 Reading Bea. All rights reserved.
//

import Foundation
import UIKit

extension UISearchBar {
    
    func setFont(textFont : UIFont?) {
        for view : UIView in (self.subviews[0]).subviews {
            if let textField = view as? UITextField {
                textField.font = textFont
            }
        }
    }

}
