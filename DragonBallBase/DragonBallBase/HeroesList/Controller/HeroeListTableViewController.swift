//
//  HeroeListTableViewController.swift
//  DragonBallBase
//
//  Created by Enrique Poyato Ortiz on 16/1/23.
//

import Foundation
import UIKit

class HeroeListTableViewController: UIViewController {
    
    var mainView: HeroeListView { self.view as! HeroeListView } // vista principal del view controller y la convierto al tipo que yo quiero para que se quede enlazado
    
    var heroes: [HeroModel] = []
    var viewModel: HeroeListViewModel?
    var tableViewDataSource: HeroesListTableViewDataSource?
    var tableViewDelegate: HeroesListTableViewDelegate?
    
    override func loadView() {
        view = HeroeListView()
        
        tableViewDataSource = HeroesListTableViewDataSource(tableView: mainView.heroesTableView)
        mainView.heroesTableView.dataSource = tableViewDataSource
        
        tableViewDelegate = HeroesListTableViewDelegate()
        mainView.heroesTableView.delegate = tableViewDelegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = HeroeListViewModel()
        
        SetUpUpdateUI()
        getData()
        setUpTableDelegate()
        mainView.loginButton.addTarget(self, action: #selector(loginPresent), for: .touchUpInside)

    }
    
    func SetUpUpdateUI() {
        // PREPARANDOME PARA RECIBIR LOS DATOS QUE VIENEN DEL VIEW MODEL
        viewModel?.updateUI = { [weak self] heroes in
            self?.heroes = heroes
            self?.tableViewDataSource?.heroes = heroes
        }
    }
    
    func getData() {
        // CALL API TO GET HERO LIST

        viewModel?.fetchData()
    }
    func setUpTableDelegate() {
        tableViewDelegate?.didTapOnCell = { [weak self] index in
            guard let dataSource = self?.tableViewDataSource else { return }
            
            // Get the hero in the hero list according to the position index
            let hero = dataSource.heroes[index]
            
            // Prepare the view controller that I want to present
            let heroDetailViewController = HeroDetailViewController(heroDetailModel: hero)
            
            // Present the controller to show the details
            
            self?.present(heroDetailViewController, animated: true)
            
            
        }
        
    }

    
    @objc
    func loginPresent() {
        let loginController = LoginViewController(nibName: nil, bundle: nil)
        self.present(loginController, animated: true)
    }


    

    
}
