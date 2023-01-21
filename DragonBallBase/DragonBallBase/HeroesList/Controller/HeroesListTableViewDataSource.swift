//
//  HeroesListTableViewDataSource.swift
//  DragonBallBase
//
//  Created by Enrique Poyato Ortiz on 17/1/23.
//

import Foundation
import UIKit

class HeroesListTableViewDataSource: NSObject, UITableViewDataSource {
//    var heroes: [HeroModel] = []
    var heroes: [HeroModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
            
    }
    let tableView: UITableView

    init(tableView: UITableView, heroes: [HeroModel] = []) {
        self.heroes = heroes
        self.tableView = tableView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        heroes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeroesViewListCell", for: indexPath) as! HeroeListViewCell
        let hero = heroes[indexPath.row]
        cell.configure(hero)
        //cell.textLabel?.text = hero.name
        
        return cell
    }
    
}
