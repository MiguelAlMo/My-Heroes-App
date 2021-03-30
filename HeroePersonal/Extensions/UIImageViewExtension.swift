//
//  UIImageViewExtension.swift
//  HeroePersonal
//
//  Created by Miguel Alarcon on 10/3/21.
//

import UIKit

extension UIImageView {
    func roundedImage(value: Int) {
        self.layer.cornerRadius = CGFloat(value)
    }
}
