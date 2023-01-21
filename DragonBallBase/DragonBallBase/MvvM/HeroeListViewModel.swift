//
//  HeroeListViewModel.swift
//  DragonBallBase
//
//  Created by Enrique Poyato Ortiz on 17/1/23.
//

import Foundation

class HeroeListViewModel: NSObject {

    override init() {
        
    }
    var updateUI: ((_ heroes: [HeroModel])-> Void)?
    
    func fetchData(){
        let myToken = "eyJraWQiOiJwcml2YXRlIiwidHlwIjoiSldUIiwiYWxnIjoiSFMyNTYifQ.eyJleHBpcmF0aW9uIjo2NDA5MjIxMTIwMCwiaWRlbnRpZnkiOiI0REZENUNCMy1DRTRCLTQ0Q0UtOTdBNS0zMThEOTEyQjc3MTAiLCJlbWFpbCI6ImVucmlwb29yQGhvdG1haWwuZXMifQ.choxLJoXD21WtqbdZiSdO2TM-xELlTFgX2qFMV82G5A"
        let apiClient = ApiClient(token: myToken)
        apiClient.getHeroes { [ weak self ] heroes, error in
            self?.updateUI?(heroes)
        }
      
    }
    
    
    

 
 
}
