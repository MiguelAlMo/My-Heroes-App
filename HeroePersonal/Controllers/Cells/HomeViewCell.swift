//
//  HomeViewCell.swift
//  HeroePersonal
//
//  Created by Miguel Alarcon on 1/3/21.
//

import UIKit
import Kingfisher

class HomeViewCell: UITableViewCell{
    
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var viewLogo: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        viewLogo.roundedView(value: 10)
        imageLogo.roundedImage(value: 10)
    }
    
    func configure(image: String?) {
        imageLogo.image = UIImage(named: image ?? "")
    }
}



