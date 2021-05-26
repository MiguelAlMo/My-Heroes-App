//
//  HomeViewController.swift
//  HeroePersonal
//
//  Created by Miguel Alarcon on 25/2/21.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    @IBOutlet weak var imageBack: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let heroesType = sender as? HeroesType else {
            return
        }
        
        switch segue.destination {
            case is DcMarvelViewController:
                
                    let destination = (segue.destination as? DcMarvelViewController)
                    destination?.heroesType = heroesType
                    destination?.heroes = DataProvider.shared.filterAllHeroes(by: heroesType).sorted { ($0.name ?? "") < ($1.name ?? "") }
            case is BattleViewController:
                let destination = (segue.destination as? BattleViewController)
                destination?.heroes = DataProvider.shared.loadHeroes().sorted { ($0.name ?? "") < ($1.name ?? "") }
            case is CustomizeViewController:
                let destination = (segue.destination as? CustomizeViewController)
                destination?.heroes = DataProvider.shared.loadHeroes().sorted { ($0.name ?? "") < ($1.name ?? "") }
            default:
                break
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        180
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeViewCell",
                                                 for: indexPath) as? HomeViewCell
        switch indexPath.row {
            case 0:
                cell?.configure(image: "marvel_logo_black")
            case 1:
                cell?.configure(image: "dc_logo_black")
            case 2:
                cell?.configure(image: "logo_your_team")
            case 3:
                cell?.configure(image: "versus_home")
            default:
                break
        }
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
            case 0: performSegue(withIdentifier: "SEGUE_TO_DC_MARVEL", sender: HeroesType.marvel)
            case 1: performSegue(withIdentifier: "SEGUE_TO_DC_MARVEL", sender: HeroesType.dc)
            case 2: performSegue(withIdentifier: "SEGUE_TO_TEAM", sender: HeroesType.all)
            case 3: performSegue(withIdentifier: "SEGUE_TO_BATTLE", sender: HeroesType.all)
            default:
                break
        }
    }
}
