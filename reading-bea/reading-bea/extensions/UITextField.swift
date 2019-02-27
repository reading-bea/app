//
//  UITextField.swift
//  reading-bea
//
//  Created by Craig Harvie on 25/02/2019.
//  Copyright © 2019 Reading Bea. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {

    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 40, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }

}
