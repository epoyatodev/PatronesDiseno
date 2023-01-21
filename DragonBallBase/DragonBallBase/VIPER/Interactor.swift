//
//  Interactor.swift
//  DragonBallBase
//
//  Created by Enrique Poyato Ortiz on 17/1/23.
//

import Foundation


// object
// protocol
// ref to presenter
// api calls

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
    
    func getHeroes()
        
    
}

class HeroInteractor: AnyInteractor {
    var presenter: AnyPresenter?
    
    func getHeroes() {
        let myToken = "eyJraWQiOiJwcml2YXRlIiwidHlwIjoiSldUIiwiYWxnIjoiSFMyNTYifQ.eyJleHBpcmF0aW9uIjo2NDA5MjIxMTIwMCwiaWRlbnRpZnkiOiI0REZENUNCMy1DRTRCLTQ0Q0UtOTdBNS0zMThEOTEyQjc3MTAiLCJlbWFpbCI6ImVucmlwb29yQGhvdG1haWwuZXMifQ.choxLJoXD21WtqbdZiSdO2TM-xELlTFgX2qFMV82G5A"
        
        ApiClient(token: myToken).getHeroes{ [weak self] heroes, error in
            if (error != nil) {
                self?.presenter?
                    .interactorDidFetchHeroes(with: .failure(error!))
                
                return
            }
            
            self?.presenter?
                .interactorDidFetchHeroes(with: .success(heroes))
            
        }
    }
    
    
    
}
