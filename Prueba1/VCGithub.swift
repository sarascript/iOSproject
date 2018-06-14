//
//  VCGithub.swift
//  Prueba1
//
//  Created by Sara Correas on 1/6/18.
//  Copyright © 2018 SARA CORREAS GORDITO. All rights reserved.
//

import UIKit
import WebKit
import Octokit

class VCGithub: UIViewController, UIWebViewDelegate, WKNavigationDelegate{

    
    @IBOutlet var WV: WKWebView?
    
    let config = OAuthConfiguration(token: "8c89eaf28d0850fd5c91", secret: "a9ee174b231b4d1b4af5946fd3d1bf6389eb77c9", scopes: ["repo", "read:org"])
    var myToken = TokenConfiguration();
    
    //let clientId = "8c89eaf28d0850fd5c91"
    //let clientSecret = "a9ee174b231b4d1b4af5946fd3d1bf6389eb77c9"

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.request.url?.host! == "charagit-e5789.firebaseapp.com" {
            config.handleOpenURL(url: navigationAction.request.url!, completion: { (token) in
                print("TOKEN", token.accessToken)
                DataHolder.sharedInstance.tokenValue = token.accessToken!
                self.myToken = token
                self.getInfo()
            })
        }
        decisionHandler(.allow)
    }
    
    
    
    func getInfo() {
        let task = Octokit(myToken).repositories() { response in
            switch response {
            case .success(let repositories):
                print("Nº REPOS: ",repositories.count)
                DataHolder.sharedInstance.myUser.nRepos = repositories.count
                let task = Octokit(self.myToken).myFollowers() { response in
                    switch response {
                    case .success(let users):
                        print("Nº FOLLOWERS: ",users.count)
                        DataHolder.sharedInstance.myUser.nFollowers = users.count
                        DataHolder.sharedInstance.myUser.iXP = DataHolder.sharedInstance.myUser.nRepos! * 100 + DataHolder.sharedInstance.myUser.nFollowers! * 200
                        print("DATOS DH!!!: ",DataHolder.sharedInstance.myUser.iXP, DataHolder.sharedInstance.myUser.nRepos, DataHolder.sharedInstance.myUser.nFollowers)
                        if DataHolder.sharedInstance.myUser.iXP! >= 1000 {
                            DataHolder.sharedInstance.myUser.sAvatar = "https://firebasestorage.googleapis.com/v0/b/charagit-e5789.appspot.com/o/chara1.gif?alt=media&token=89a7cda2-a6f5-40b5-a38d-72b953a46ac4"
                            DataHolder.sharedInstance.myUser.sTitle = "Experienced Warrior"
                        } else {
                            DataHolder.sharedInstance.myUser.sAvatar = "https://firebasestorage.googleapis.com/v0/b/charagit-e5789.appspot.com/o/chara2.gif?alt=media&token=7cbe2ba5-0112-43a4-8585-497acce45a30"
                            DataHolder.sharedInstance.myUser.sTitle = "Newbie Adventurer"
                        }
                        self.performSegue(withIdentifier: "trGithubOK", sender: self)
                    case .failure(let error):
                        print("ERROR IN FOLLOWERS: ",error)
                    }
                }
            case .failure(let error):
                print("ERROR IN REPOS: ",error)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        WV?.navigationDelegate = self;
        let url = config.authenticate()
        WV?.load(URLRequest(url: url!))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
