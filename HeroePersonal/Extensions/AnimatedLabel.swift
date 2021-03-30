//
//  AnimatedLabel.swift
//  HeroePersonal
//
//  Created by Miguel Alarcon on 11/3/21.
//

import UIKit
func animatedLabel(powerHero: Int, label: UILabel!){
    
    for valor in 0...powerHero {
        
        UIView.transition(with: label,
                          duration: 1,
                          options: .transitionFlipFromBottom,
                    animations: { label.text = "\(String(describing: valor ))"
                 }, completion: nil)
        print(valor)
        
    }
    
}

