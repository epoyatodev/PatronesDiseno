//
//  LoginViewModel.swift
//  DragonBallBase
//
//  Created by Enrique Poyato Ortiz on 21/1/23.
//

import Foundation

class LoginViewModel: NSObject {
    
    override init() {
        
    }
    
    var updateLogin: ((_ token: String)-> Void)?
    
    func login(email: String, password: String){
        let myToken = "eyJraWQiOiJwcml2YXRlIiwidHlwIjoiSldUIiwiYWxnIjoiSFMyNTYifQ.eyJleHBpcmF0aW9uIjo2NDA5MjIxMTIwMCwiaWRlbnRpZnkiOiI0REZENUNCMy1DRTRCLTQ0Q0UtOTdBNS0zMThEOTEyQjc3MTAiLCJlbWFpbCI6ImVucmlwb29yQGhvdG1haWwuZXMifQ.choxLJoXD21WtqbdZiSdO2TM-xELlTFgX2qFMV82G5A"
        let apiClient = ApiClient(token: myToken)
        apiClient.login(user: email, password: password) { [weak self] token, error in

            if let token = token{
                    self?.updateLogin?(token)
                print(token)
            }else{
                self?.updateLogin?(error?.localizedDescription ?? "")

                print("error", error?.localizedDescription ?? "")
            }
            
            
        }
    }
}
