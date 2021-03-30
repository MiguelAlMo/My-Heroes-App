//
//  UIViewExtension.swift
//  HeroePersonal
//
//  Created by Miguel Alarcon on 10/3/21.
//

import UIKit

extension UIView {
    func roundedView(value: Int) {
        self.layer.cornerRadius = CGFloat(value)
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.clipsToBounds = true
    }
    
    func borderColorWhite(value: Int) {
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = CGFloat(value)
    }
}
