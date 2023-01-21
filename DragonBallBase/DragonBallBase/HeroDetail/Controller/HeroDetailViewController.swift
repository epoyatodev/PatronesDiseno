//
//  HeroDetailViewController.swift
//  DragonBallBase
//
//  Created by Enrique Poyato Ortiz on 17/1/23.
//

import Foundation
import UIKit

class HeroDetailViewController: UIViewController {
    
    var mainView: HeroDetailView { self.view as! HeroDetailView } // vista principal del view controller y la convierto al tipo que yo quiero para que se quede enlazado
    
    init(heroDetailModel: HeroModel) {
        super.init(nibName: nil, bundle: nil)
        mainView.configure(heroDetailModel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = HeroDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
