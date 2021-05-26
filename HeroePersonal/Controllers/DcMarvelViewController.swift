//
//  PersonViewController.swift.swift
//  HeroePersonal
//
//  Created by Miguel Alarcon on 23/2/21.
//

import UIKit
import Kingfisher

class DcMarvelViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imageBack: UIImageView!
    @IBOutlet weak var imageLogo: UIImageView!
    
    var heroesType: HeroesType = .all
    var heroes : [HeroEntity] = []

    override func viewDidLoad() {
    
        
        switch heroesType {
            case .dc: imageBack.image = UIImage(named: "batman_fondo_dc")
                imageLogo.image = UIImage(named: "dc_logo")
                
            case .marvel: imageBack.image = UIImage(named: "capitan_america")
                imageLogo.image = UIImage(named: "marvel_logo")
                imageLogo.roundedImage(value: 6)

            case .all:
                break
        }
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let destination = segue.destination as? PersonViewController,
              let cell = sender as? UICollectionViewCell,
              let indexPath = collectionView.indexPath(for: cell) else {
            return
        }
        
        if(indexPath.row < heroes.count) {
            let heroSelected = heroes[indexPath.row]
            destination.person = heroSelected
            destination.delegate = self
        }
    }
}

extension DcMarvelViewController: PersonViewDelegate {
    func onDelete(hero: HeroEntity?) {
        heroes.removeAll { $0.name == hero?.name }
        collectionView.reloadData()
    }
}

extension DcMarvelViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        heroes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 3 - 7,
               height: collectionView.frame.width / 3 - 7)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeroViewCell",
                                                      for: indexPath) as? HeroViewCell
        
        if(indexPath.row < heroes.count) {
            let data = heroes[indexPath.row]
            cell?.configure(image: data.image?.url)
        }
        return cell ?? UICollectionViewCell()
    }
 
}

