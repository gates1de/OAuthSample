//
//  ViewController.swift
//  OAuthSample
//
//  Created by Yu Kadowaki on 2018/06/09.
//  Copyright © 2018 gates1de. All rights reserved.
//

import FBSDKLoginKit
import FirebaseAuth
import TwitterKit
import UIKit

class ViewController: UIViewController {

    // MARK: - Private properties

    private let facebookLogInButton = FBSDKLoginButton()

    private let twitterLogInButton = TWTRLogInButton { session, error in
        guard let session = session else { return }
        let authToken = session.authToken
        let authTokenSecret = session.authTokenSecret
        let credential = TwitterAuthProvider.credential(withToken: session.authToken, secret: session.authTokenSecret)
        Auth.auth().signIn(with: credential) { user, error in
            print("user = \(user), error = \(error)")
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.facebookLogInButton.readPermissions = ["email", "public_profile"]

        self.view.addSubview(self.facebookLogInButton)
        self.view.addSubview(self.twitterLogInButton)
        self.facebookLogInButton.center = CGPoint(
            x: self.view.center.x,
            y: self.view.center.y - self.facebookLogInButton.frame.height * 2
        )
        self.twitterLogInButton.center = CGPoint(
            x: self.view.center.x,
            y: self.facebookLogInButton.frame.origin.y + self.facebookLogInButton.frame.height * 2
        )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

