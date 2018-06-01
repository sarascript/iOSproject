//
//  GitHubAPI.swift
//  Prueba1
//
//  Created by Sara Correas on 29/5/18.
//  Copyright © 2018 SARA CORREAS GORDITO. All rights reserved.
//

import UIKit
import Foundation
import Octokit


class GitHubAPI: NSObject {
    
    
    
    func connect() {
       // var user:OCTUser = OCTUser(rawLogin: "", server: OCTServer.dotCom())
        var config = TokenConfiguration("60bcca1875bd96864e496ba7643d63e65926cca2")
        
        Octokit(config).me() { response in
            switch response {
            case .success(let user):
                print(user.login)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getInfo() {
        let username = DataHolder.sharedInstance.myUser.sUsername
        Octokit().user(name: username!) { response in
                switch response {
                case .success(let user):
                // do something with the user
                    print(user)
                case .failure(let error):
                    print(error)
                }
        }
    }
    
    /*
    var config = TokenConfiguration(token: "60bcca1875bd96864e496ba7643d63e65926cca2")
    
    Octokit(config).me() { response in
    switch response {
    case .success(let user):
    case .failure(let error):
    }
    }

    let username = DataHolder.sharedInstance.myUser.sUsername
    
    Octokit().repositories(username) { response in
    switch response {
    case .success(let repositories):
    // do something with the repositories
    case .failure(let error):
    // handle any errors
    }
    }
    
    Octokit().stars(username) { response in
    switch response {
    case .success(let repositories):
    // do something with the repositories
    case .failure(let error):
    // handle any errors
    }
    }
    
    Octokit().following(username) { response in
    switch response {
    case .success(let users):
    // do something with the users
    case .failure(let error):
    // handle any errors
    }
    }
    */
}
