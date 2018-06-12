//
//  VCGithub.swift
//  Prueba1
//
//  Created by Sara Correas on 1/6/18.
//  Copyright © 2018 SARA CORREAS GORDITO. All rights reserved.
//

import UIKit
import WebKit
import FirebaseAuthUI
//import OAuthSwift
//import SafariServices

class VCGithub: UIViewController, UIWebViewDelegate{
    
    
    

    
    
    
    /*
    @IBOutlet var WV: UIWebView?
    
    let clientId = "8c89eaf28d0850fd5c91"
    let clientSecret = "a9ee174b231b4d1b4af5946fd3d1bf6389eb77c9"
    var oauthswift = OAuth2Swift(
        consumerKey:    "8c89eaf28d0850fd5c91",
        consumerSecret: "a9ee174b231b4d1b4af5946fd3d1bf6389eb77c9",
        authorizeUrl:   "https://github.com/login/oauth/authorize",
        accessTokenUrl: "https://github.com/login/oauth/access_token",
        responseType:   "code"
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        //let strRuta:String = String(format: "https://github.com/login/oauth/authorize?client_id=%@&state=SARA!",clientId )
        //let strRuta:String = String(format: "https://github.com/login/oauth/authorize?client_id=%@",clientId )
        //WV?.loadRequest(URLRequest(url: URL(string: strRuta)!))

        // Do any additional setup after loading the view.
        
        // create an instance and retain it
       doOAuthGithub()
    }
    
    //func doOAuthGithub(_ serviceParameters: [String:String]){
    func doOAuthGithub(){
        let oauthswift = OAuth2Swift(
            consumerKey:    "8c89eaf28d0850fd5c91",
            consumerSecret: "a9ee174b231b4d1b4af5946fd3d1bf6389eb77c9",
            authorizeUrl:   "https://github.com/login/oauth/authorize",
            accessTokenUrl: "https://github.com/login/oauth/access_token",
            responseType:   "code"
        )
        oauthswift.authorizeURLHandler = getURLHandler()
        let state = generateState(withLength: 20)
        print("AUTH ENTRA")
         oauthswift.authorize(
            withCallbackURL: URL(string: "oauth-swift://oauth-callback/github")!, scope: "user,repo", state: state,
            success: { credential, response, parameters in
                print("CREDENTIAL", credential)
                self.showTokenAlert(name: "TOKEN", credential: credential)
        },
            failure: { error in
                print("ERROOOOOOOOOOOR", error.description)
        }
        )
    }
    
    
    func getURLHandler() -> OAuthSwiftURLHandlerType {
            if #available(iOS 9.0, *) {
                let handler = SafariURLHandler(viewController: self, oauthSwift: self.oauthswift)
                handler.presentCompletion = {
                    print("Safari presented")
                }
                handler.dismissCompletion = {
                    print("Safari dismissed")
                }
                handler.factory = { url in
                    let controller = SFSafariViewController(url: url)
                    // Customize it, for instance
                    if #available(iOS 10.0, *) {
                        //  controller.preferredBarTintColor = UIColor.red
                    }
                    return controller
                }
                
                return handler
            }
            return OAuthSwiftOpenURLExternally.sharedInstance
        }
    
    func showTokenAlert(name: String?, credential: OAuthSwiftCredential) {
        var message = "oauth_token:\(credential.oauthToken)"
        if !credential.oauthTokenSecret.isEmpty {
            message += "\n\noauth_token_secret:\(credential.oauthTokenSecret)"
        }
        self.showAlertView(title: name ?? "Service", message: message)
    }
    
    func showAlertView(title: String, message: String) {

        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)

    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        //print("HOLA!!!!!! ",request.url?.host)
        if let url = request.url, url.host == "charagit-e5789.firebaseapp.com" {
            //print("--------!!!!!! ",url.query)
            //let code = url.query?.split(separator: "=").last
            if let code = url.query?.split(separator: "=").last {
                //if let code = url.query?.componentsSeparatedByString("code=").last {
                let urlString = "https://github.com/login/oauth/access_token"
                if let tokenUrl = NSURL(string: urlString) {
                    print("Dentro Request  ",code)
                    let req = NSMutableURLRequest(url: tokenUrl as URL)
                    req.httpMethod = "POST"
                    req.addValue("application/json", forHTTPHeaderField: "Content-Type")
                    req.addValue("application/json", forHTTPHeaderField: "Accept")
                    let params = [
                        "client_id" : clientId,
                        "client_secret" : clientSecret,
                        "code" : code
                        ] as [String : Any]
                    req.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
                    print("REQ ",req)
                    //let task=URLSession.shared.dataTask(with: URLRequest) { (data, response, error) in
                    let task = URLSession.shared.dataTask(with: url as URL, completionHandler: {(data, response, error) in
                        print("RESPUESTA!!!!!!",data,"    ",response,"     ",error )
                        print("-------------   ",String(data: data!, encoding: String.Encoding.utf8))
                        if let data = data{
                            print("DATA")
                            do {
                                if let content = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] {
                                    print("DATA TO JSON")
                                    if let accessToken = content["access_token"] as? String {
                                        //self.getUser(accessToken)
                                        print("TOKEN ",accessToken)
                                    }
                                }
                            } catch {
                                print("HA FALLADO EL INTERPRETE DE JSON")
                            }
                        }
                        //else{
                           // print(error)
                        //}
                    })
                    task.resume()
                }
            }
            return true
        }
        return true
    }
    
    /*
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if let url = request.url, url.host == "example.com" {
            if let code = url.query?.characters.split(separator: "code=").last {
                //if let code = url.query?.componentsSeparatedByString("code=").last {
                let urlString = "https://github.com/login/oauth/access_token"
                if let tokenUrl = NSURL(string: urlString) {
                    let req = NSMutableURLRequest(url: tokenUrl as URL)
                    req.httpMethod = "POST"
                    req.addValue("application/json", forHTTPHeaderField: "Content-Type")
                    req.addValue("application/json", forHTTPHeaderField: "Accept")
                    let params = [
                        "client_id" : clientId,
                        "client_secret" : clientSecret,
                        "code" : code
                    ]
                    req.HTTPBody = try? JSONSerialization.dataWithJSONObject(params, options: [])
                    let task = URLSession.sharedSession().dataTaskWithRequest(req) { data, response, error in
                        if let data = data {
                            do {
                                if let content = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String: AnyObject] {
                                    if let accessToken = content["access_token"] as? String {
                                        self.getUser(accessToken)
                                    }
                                }
                            } catch {}
                        }
                    }
                    task.resume()
                }
            }
            return false
        }
        return true
    }*/
    /*
    func getUser(accessToken: String) {
        let urlString = "https://api.github.com/user"
        if let url = NSURL(string: urlString) {
            let req = NSMutableURLRequest(url: url as URL)
            req.addValue("application/json", forHTTPHeaderField: "Accept")
            req.addValue("token \(accessToken)", forHTTPHeaderField: "Authorization")
            let task = URLSession.sharedSession.dataTaskWithRequest(req as URLRequest) { data, response, error in
                if let data = data {
                    if let content = String(data: data, encoding: NSUTF8StringEncoding) {
                        dispatch_async(dispatch_get_main_queue()) {
                            print(content)
                            self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
                        }
                    }
                }
            }
            task.resume()
        }
 
    }*/

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

*/
}
