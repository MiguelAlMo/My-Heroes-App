//
//  YourTeamViewController.swift
//  HeroePersonal
//
//  Created by Miguel Alarcon on 25/2/21.
//

import UIKit
import Kingfisher

class YourTeamViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imageBack: UIImageView!
    @IBOutlet weak var yourTeamLabel: UILabel!
    
    var heroes: [HeroEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        }
    }
}

extension YourTeamViewController: PersonViewDelegate {
    func onDelete(hero: HeroEntity?) {
        heroes.removeAll { $0.name == hero?.name }
        collectionView.reloadData()
    }
}

extension YourTeamViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        heroes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 3 - 10,
               height: collectionView.frame.width / 3 - 10)
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


