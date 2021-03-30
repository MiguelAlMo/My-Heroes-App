//
//  HeroViewCell.swift
//  HeroePersonal
//
//  Created by Miguel Alarcon on 25/2/21.
//

import UIKit
import Kingfisher

class HeroViewCell: UICollectionViewCell {
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var imageCell: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewCell.roundedView(value: 20)
        imageCell.roundedImage(value: 20)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageCell.image = nil
    }
    
    func configure(image: String?) {
        imageCell.kf.setImage(with: URL(string: image ?? ""),
                              placeholder: DataProvider.shared.placeholderImage)
    }
}


