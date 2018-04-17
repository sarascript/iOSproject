//
//  Repo.swift
//  Prueba1
//
//  Created by SARA CORREAS GORDITO on 17/4/18.
//  Copyright © 2018 SARA CORREAS GORDITO. All rights reserved.
//

import UIKit

class Repo: NSObject {
    let IDAUTHOR = "Author"
    let IDCOMMITS = "Commits"
    let IDFORK = "Fork"
    let IDIMAGE = "Image"
    let IDLANGUAGE = "Language"
    let IDNAME = "Name"
    let IDPRIVATE = "Private"
    let IDSTAR = "Star"
    let IDURL = "URL"
    let IDUSER = "User"
    let IDWATCH = "Watch"
    
    var sID:String?
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
        sAuthor = valores[IDAUTHOR] as? String
        iCommits = valores[IDCOMMITS] as? Int
        iFork = valores[IDFORK] as? Int
        sImage = valores[IDIMAGE] as? String
        sLanguage = valores[IDLANGUAGE] as? String
        sName = valores[IDNAME] as? String
        bPrivate = valores[IDPRIVATE] as? Bool
        iStar = valores[IDSTAR] as? Int
        sURL = valores[IDURL] as? String
        sUser = valores[IDUSER] as? String
        iWatch = valores[IDWATCH] as? Int
    }
    
    func getMap() -> [String:Any] {
        return [
            IDAUTHOR: sAuthor as Any,
            IDCOMMITS: iCommits as Any,
            IDFORK: iFork as Any,
            IDIMAGE: sImage as Any,
            IDLANGUAGE: sLanguage as Any,
            IDNAME: sName as Any,
            IDPRIVATE: bPrivate as Any,
            IDSTAR: iStar as Any,
            IDURL: sURL as Any,
            IDUSER: sUser as Any,
            IDWATCH: iWatch as Any
        ]
    }
}
