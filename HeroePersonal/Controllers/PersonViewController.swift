//
//  PersonViewController.swift
//  HeroePersonal
//
//  Created by Miguel Alarcon on 25/2/21.
//

import UIKit
import Kingfisher

protocol PersonViewDelegate: AnyObject {
    func onDelete(hero: HeroEntity?)
}

class PersonViewController: UIViewController {
    
    @IBOutlet weak var imageBack: UIImageView!
    @IBOutlet weak var statImageIntelligence: UIImageView!
    @IBOutlet weak var statImageCombat: UIImageView!
    @IBOutlet weak var statImageStrength: UIImageView!
    @IBOutlet weak var statImagePower: UIImageView!
    @IBOutlet weak var statImageSpeed: UIImageView!
    @IBOutlet weak var statImageDurability: UIImageView!
    
    @IBOutlet weak var statLabelIntelligence: UILabel!
    @IBOutlet weak var statLabelCombat: UILabel!
    @IBOutlet weak var statLabelStrength: UILabel!
    @IBOutlet weak var statLabelPower: UILabel!
    @IBOutlet weak var statLabelSpeed: UILabel!
    @IBOutlet weak var statLabelDurability: UILabel!
    @IBOutlet weak var personName: UILabel!
    
    @IBOutlet weak var statView: UIView!
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBAction func onDeletePressed(_ sender: UIButton) {
        if let heroName = person?.name {
            showAlert(style: .alert,
                      title: "Remove Hero",
                      message: "You're going to eliminate a \(heroName)",
                      onAccept:  { action in
                        
                        self.delegate?.onDelete(hero: self.person)
                        
                        self.navigationController?.popViewController(animated: true)
                      })
        }
    }
    
    weak var delegate: PersonViewDelegate? = nil
    var person: HeroEntity? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageBack.kf.setImage(with: URL(string: person?.image?.url ?? ""),
        placeholder: DataProvider.shared.placeholderImage)
        personName.text = person?.name
        deleteButton.roundedButton(value: 6)
    
        statLabelIntelligence.text = NSLocalizedString("statLabelIntelligence", comment: "")
        statLabelCombat.text = NSLocalizedString("statLabelCombat", comment: "")
        statLabelStrength.text = NSLocalizedString("statLabelStrength", comment: "")
        statLabelPower.text = NSLocalizedString("statLabelPower", comment: "")
        statLabelSpeed.text = NSLocalizedString("statLabelSpeed", comment: "")
        statLabelDurability.text = NSLocalizedString("statLabelDurability", comment: "")
        
        statImageIntelligence.image = UIImage(named: person?.iconIntelligence ?? "")
        statImageCombat.image = UIImage(named: person?.iconCombat ?? "")
        statImageStrength.image = UIImage(named: person?.iconStrength ?? "")
        statImagePower.image = UIImage(named: person?.iconPower ?? "")
        statImageSpeed.image = UIImage(named: person?.iconSpeed ?? "")
        statImageDurability.image = UIImage(named: person?.iconDurability ?? "")
        //deleteButton.titleLabel = NSLocalizedString("Delete", comment: "")

        //deleteButton.setTitle("Delete", for: NSLocalizedString)
    }
}
