//
//  HeroesLifeView.swift
//  DragonBallBase
//
//  Created by Enrique Poyato Ortiz on 16/1/23.
//

import Foundation
import UIKit

class HeroeListView: UIView {

    let loginButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "person.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    let headerLabel = {
       let label = UILabel()
        label.text = "MVVM"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
//        label.backgroundColor = .yellow
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //CREATE TABLE VIEW
    //let table = UIView()
    let heroesTableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.backgroundColor = .red
        tableView.register(HeroeListViewCell.self, forCellReuseIdentifier: "HeroesViewListCell")
        return tableView
    }()
    
  
    
    //Sobreescribiendo un constructor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // CREATE / ADD SUBVIEWS
        setUpViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpViews() {

        backgroundColor = .white
        
        addSubview(loginButton)
        addSubview(headerLabel)
        addSubview(heroesTableView)
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: topAnchor, constant: 65),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            loginButton.widthAnchor.constraint(equalToConstant: 40),
            
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            headerLabel.heightAnchor.constraint(equalToConstant: 50),
            
            heroesTableView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor),
            heroesTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            heroesTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            heroesTableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ])
        
      
    }
 
    
}


