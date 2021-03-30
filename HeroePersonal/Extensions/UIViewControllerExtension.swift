//
//  UIViewControllerExtension.swift
//  HeroePersonal
//
//  Created by Miguel Alarcon on 2/3/21.
//

import UIKit


extension UIViewController {
    
    func showAlert(style: UIAlertController.Style, title: String, message: String,
                   onAccept: ((UIAlertAction) -> Void)? = nil, onCancel: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: style)
        
        alert.addAction(UIAlertAction(title: "cancel",
                                      style: .cancel,
                                      handler: onCancel))
        
        alert.addAction(UIAlertAction(title: "accept",
                                      style: .destructive,
                                      handler: onAccept))
        
        present(alert, animated: true)
    }
}
