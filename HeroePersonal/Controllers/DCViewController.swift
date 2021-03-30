//
//  DCViewController.swift
//  HeroePersonal
//
//  Created by Miguel Alarcon on 24/2/21.
//

import UIKit

class DCViewController: UIViewController {
    @IBOutlet weak var collectionView : UICollectionView!
    
    //var persons: [Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }


}
extension DCViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 4 - 8,
               height: collectionView.frame.width / 4 - 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        return  UICollectionViewCell()
    }
 
}

