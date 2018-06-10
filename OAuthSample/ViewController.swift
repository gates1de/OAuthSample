//
//  ViewController.swift
//  OAuthSample
//
//  Created by Yu Kadowaki on 2018/06/09.
//  Copyright © 2018 gates1de. All rights reserved.
//

import UIKit
import TwitterKit
import FirebaseAuth

class ViewController: UIViewController {

    // MARK: - Private properties

    private let logInButton = TWTRLogInButton { session, error in
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
        self.view.addSubview(self.logInButton)
        self.logInButton.center = self.view.center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

