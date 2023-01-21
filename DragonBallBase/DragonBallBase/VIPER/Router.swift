//
//  Router.swift
//  DragonBallBase
//
//  Created by Enrique Poyato Ortiz on 17/1/23.
//

import Foundation
import UIKit
// object
// Entry point

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? { get }
    static func start() -> AnyRouter
}

class HeroRouter: AnyRouter {
    var entry: EntryPoint?
    
    static func start() -> AnyRouter {
        let router = HeroRouter()
        
        // Assign View Interactor and present
        
        var view: AnyView = HeroViewController()
        var presenter: AnyPresenter = HeroPresenter()
        var interactor: AnyInteractor = HeroInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        router.entry = view as? EntryPoint
        
        return router
    }
    
    
}
