//
//  Presenter.swift
//  DragonBallBase
//
//  Created by Enrique Poyato Ortiz on 17/1/23.
//

import Foundation


// object
// protocol
// ref interactor, router, view

protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    
    func interactorDidFetchHeroes(with result: Result<[Hero], Error>)
}


class HeroPresenter: AnyPresenter {
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.getHeroes()
        }
    }
    
    var view: AnyView?
    
    func interactorDidFetchHeroes(with result: Result<[Hero], Error>) {
        switch result {
        case .success(let heroes):
            debugPrint("success")
            view?.update(with: heroes)
        case .failure(let error):
            debugPrint("error")
            view?.update(with: error.localizedDescription)
        }
    }
    
    
}
