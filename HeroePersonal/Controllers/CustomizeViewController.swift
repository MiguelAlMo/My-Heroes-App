//
//  CustomizeViewController.swift
//  HeroePersonal
//
//  Created by Miguel Alarcon on 25/2/21.
//

import UIKit
import Kingfisher
import AVFoundation

class CustomizeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var imageBack: UIImageView!
    @IBOutlet weak var imagePerson: UIImageView!
    @IBOutlet weak var imagePower: UIImageView!
    @IBOutlet weak var viewPerson: UIView!
   
    @IBOutlet weak var customizeLabel: UILabel!
    @IBOutlet weak var minimumLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var namePerson: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var raceLabel: UILabel!
    @IBOutlet weak var racePerson: UILabel!
    
    @IBOutlet weak var addTeamButton: UIButton!
    @IBOutlet weak var teamButton: UIButton!
    @IBAction func TeamButtonAction(_ sender: Any) {
        //addHeroesTeam(characterId: heroesTeam)
    }
    
    @IBAction func addTeamButtonAction(_ sender: Any) {
        if let hero = heroAdd {
            heroesTeam.append(hero)
        } else {
            heroesTeam.append(heroes[0]!)
        }
        counter += 1
    }
    
    var audioPlayer = AVAudioPlayer()
    var heroesTeam: [HeroEntity] = []
    var heroes : [HeroEntity?] = []
    var heroAdd: HeroEntity?
    var counter = 0 {
        didSet {
            teamButton.setTitle("Team \(counter)", for: .normal)
            showAlert(message: "The Hero has been added to the Team")
            audioPlayer.play()
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "My Team", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePerson.roundedImage(value: 6)
        viewPerson.borderColorWhite(value: 1)
        viewPerson.roundedView(value: 6)
        teamButton.roundedButton(value: 6)
        addTeamButton.roundedButton(value: 6)
        imagePerson.borderColorWhite(value: 1)
        
        teamButton.setTitle("Team \(counter)", for: .normal)
        
        customizeLabel.text = NSLocalizedString("customizeLabel", comment: "")
        minimumLabel.text = NSLocalizedString("minimumLabel", comment: "")
        nameLabel.text = NSLocalizedString("nameLabel", comment: "")
        publisherLabel.text = NSLocalizedString("publisherLabel", comment: "")
        raceLabel.text = NSLocalizedString("raceLabel", comment: "")
        namePerson.text = heroes[0]?.name
        racePerson.text = heroes[0]?.appearance?.race
        imagePerson.kf.setImage(with: URL(string: heroes[0]?.image?.url ?? ""))
        imagePower.image = UIImage(named: heroes[0]?.iconPower ?? "")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        do {
            audioPlayer = try
                AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "add_hero", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
        } catch {
            print(error)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? YourTeamViewController {
            //destination.delegate = self
            destination.heroes = heroesTeam
        }
    }

}

extension CustomizeViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        heroes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 6 - 2,
               height: collectionView.frame.width / 6 - 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomizeViewCell",
                                                      for: indexPath) as? CustomizeViewCell
        
        if(indexPath.row < heroes.count) {
            
            let data = heroes[indexPath.row]
            cell?.configure(personImage: data?.image?.url)}
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(indexPath.row < heroes.count) {
            
            heroAdd = heroes[indexPath.row]
            namePerson.text = heroAdd?.name
            if let heroRace = heroAdd?.appearance?.race {
                if heroRace.contains("null") {
                    racePerson.text = "????"
                } else {
                    racePerson.text = heroAdd?.appearance?.race
                }
            }
            imagePerson.kf.setImage(with: URL(string: heroAdd?.image?.url ?? ""))
            imagePower.image = UIImage(named: heroAdd?.iconPower ?? "")
        }
    }
    
}
