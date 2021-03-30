//
//  UIButtonExtension.swift
//  HeroePersonal
//
//  Created by Miguel Alarcon on 10/3/21.
//

import Foundation

import UIKit

extension UIButton {
    func roundedButton(value: Int) {
        self.layer.cornerRadius = CGFloat(value)
    }
}
