//
//  BattleViewController.swift
//  HeroePersonal
//
//  Created by Miguel Alarcon on 4/3/21.
//

import UIKit
import Kingfisher
import AVFoundation

class BattleViewController: UIViewController {
    
    @IBOutlet weak var collectionView : UICollectionView!
    
    @IBOutlet weak var nameHero : UILabel!
    @IBOutlet weak var nameHeroRandom : UILabel!
    @IBOutlet weak var winnerLabelHero : UILabel!
    @IBOutlet weak var winnerLabelRandom : UILabel!
    @IBOutlet weak var powerLabelRandom : UILabel!
    @IBOutlet weak var powerLabelHero : UILabel!
    
    @IBOutlet weak var viewBattle : UIView!
    @IBOutlet weak var viewMarco : UIView!
    
    @IBOutlet weak var imageVs : UIImageView!
    @IBOutlet weak var imageHero : UIImageView!
    @IBOutlet weak var imageHeroRandom : UIImageView!
    
    @IBOutlet weak var fightButton : UIButton!
    
    @IBAction func fightWithRandom (_ sender: UIButton) {
        if let heroe2 = heroRandom {
            audioPlayerFight.play()
            
            if(heroe2.totalPower < heroSelected?.totalPower ?? 0) {
                
                winnerLabelHero.text = "Winner!"
                winnerLabelRandom.text = "Loser!"
                animatedLabel(powerHero: Int(heroRandom?.totalPower ?? 0), label:powerLabelRandom)
                animatedLabel(powerHero: Int(heroSelected?.totalPower ?? 0), label: powerLabelHero)

            } else if (heroe2.totalPower > heroSelected?.totalPower ?? 0){
                winnerLabelHero.text = "Loser!"
                winnerLabelRandom.text = "Winner!"
                animatedLabel(powerHero: Int(heroRandom?.totalPower ?? 0), label: powerLabelRandom)
                animatedLabel(powerHero: Int(heroSelected?.totalPower ?? 0), label: powerLabelHero)
                
            } else {
                winnerLabelHero.text = "Battle tied!"
                winnerLabelRandom.text = "Battle tied!"
                animatedLabel(powerHero: Int(heroRandom?.totalPower ?? 0), label: powerLabelRandom)
                animatedLabel(powerHero: Int(heroSelected?.totalPower ?? 0), label: powerLabelHero)
            }
            
            heroRandom = nil
        } else {
            heroRandom = DataProvider.shared.loadHeroes().randomElement()
            winnerLabelHero.text = "Power"
            winnerLabelRandom.text = "Power"
            powerLabelRandom.text = "???"
        }
    }
    
    var audioPlayer = AVAudioPlayer()
    var audioPlayerFight = AVAudioPlayer()
    var heroesType: HeroesType = .all
    var heroSelected: HeroEntity?
    var heroes : [HeroEntity?] = []
    
    private var heroRandom: HeroEntity? {
        
        didSet {
            if heroRandom != nil {
                imageHeroRandom.kf.setImage(with: URL(string: heroRandom?.image?.url ?? ""))
                nameHeroRandom.text = heroRandom?.name
                
                audioPlayer.play()
                fightButton.setTitle("Fight!", for: .normal)
            } else {
                fightButton.setTitle("Search Enemy!", for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            audioPlayer = try
                AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "select_enemy", ofType: "mp3")!))
            audioPlayer.prepareToPlay()
        } catch {
            print(error)
        }
        
        do {
            audioPlayerFight = try
                AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "fight", ofType: "mp3")!))
            audioPlayerFight.prepareToPlay()
        } catch {
            print(error)
        }
        
        viewMarco.roundedView(value: 6)
        viewBattle.roundedView(value: 6)
        imageHero.roundedImage(value: 6)
        imageHeroRandom.roundedImage(value: 6)
        fightButton.roundedButton(value: 6)
        imageHero.borderColorWhite(value: 2)
        imageHeroRandom.borderColorWhite(value: 2)
        nameHero.text = heroes[0]?.name
        imageHero.kf.setImage(with: URL(string: heroes[0]?.image?.url ?? ""))
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
extension BattleViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        heroes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 6 - 1,
               height: collectionView.frame.width / 6 - 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomizeViewCell",
                                                      for: indexPath) as? CustomizeViewCell
        
        if(indexPath.row < heroes.count) {
            let data = heroes[indexPath.row]
            cell?.configure(personImage: data?.image?.url)
        }
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(indexPath.row < heroes.count) {
            heroSelected = heroes[indexPath.row]
            nameHero.text = heroSelected?.name
            imageHero.kf.setImage(with: URL(string: heroSelected?.image?.url ?? ""))
            powerLabelHero.text = "???"
        }
    }
}
