//
//  Repo.swift
//  Prueba1
//
//  Created by SARA CORREAS GORDITO on 17/4/18.
//  Copyright © 2018 SARA CORREAS GORDITO. All rights reserved.
//

import UIKit

class Repo: NSObject {
    var sAuthor:String?
    var iCommits:Int?
    var iFork:Int?
    var sImage:String?
    var sLanguage:String?
    var sName:String?
    var bPrivate:Bool?
    var iStar:Int?
    var sURL:String?
    var sUser:String?
    var iWatch:Int?
    
    func setMap(valores:[String:Any]) {
        sAuthor = valores["Author"] as? String
        iCommits = valores["Commits"] as? Int
        iFork = valores["Fork"] as? Int
        sImage = valores["Image"] as? String
        sLanguage = valores["Language"] as? String
        sName = valores["Name"] as? String
        bPrivate = valores["Private"] as? Bool
        iStar = valores["Star"] as? Int
        sURL = valores["URL"] as? String
        sUser = valores["User"] as? String
        iWatch = valores["Watch"] as? Int
    }
}
