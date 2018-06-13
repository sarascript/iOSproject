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
                self.loadCurrentUser(config: self.myToken) 
            })
        }
        decisionHandler(.allow)
        //self.performSegue(withIdentifier: "trTokenOk", sender: self)
    }
    
    func loadCurrentUser(config: TokenConfiguration) {
        Octokit(config).me() { response in
            switch response {
            case .success(let user):
                print("Authenticated with github user: ", user.login)
                self.getRepos()
                self.getFollowers()
            case .failure(let error):
                print("ERROR IN AUTH: ", error)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        WV?.navigationDelegate = self;
        let url = config.authenticate()
        WV?.load(URLRequest(url: url!))
    }
    
    func getRepos() {
        Octokit().repositories() { response in
            switch response {
            case .success(let repository):
                print("REPOS: ", repository)
            case .failure(let error):
                print("ERROR IN REPOS: ", error)
            }
        }
    }
    
    func getFollowers() {
        Octokit().myFollowers() { response in
            switch response {
            case .success(let users):
                print("FOLLOWERS: ", users)
            case .failure(let error):
                print("ERROR IN FOLLOWERS: ", error)
            }
        }
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
