//
//  CustomizeViewCell.swift
//  HeroePersonal
//
//  Created by Miguel Alarcon on 25/2/21.
//

import UIKit
import Kingfisher


class CustomizeViewCell: UICollectionViewCell {
    @IBOutlet weak var viewCell: UIView!
    @IBOutlet weak var imagePerson: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewCell.roundedView(value: 6)
        imagePerson.roundedImage(value: 6)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imagePerson.image = nil
        
    }
    
    func configure(personImage: String?) {
        imagePerson.kf.setImage(with: URL(string: personImage ?? ""),
                                placeholder: DataProvider.shared.placeholderImage)
    }
}
