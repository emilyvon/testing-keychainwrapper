//
//  ViewController.swift
//  testing-keychainwrapper
//
//  Created by Mengying Feng on 5/08/2016.
//  Copyright © 2016 Mengying Feng. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var secret: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(saveSecretMessage), name: UIApplicationWillResignActiveNotification, object: nil )
        
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(unlockSecretMessage), name: UIApplicationDidBecomeActiveNotification, object: nil)
        
    }
    
    
    
    
    func unlockSecretMessage() {
        
        secret.hidden = false
        
        if let text = KeychainWrapper.stringForKey("SecretMessage") {
            
            secret.text = text
            
        }
        
    }

    
    func saveSecretMessage() {
        
        if !secret.hidden {
            
            KeychainWrapper.setString(secret.text!, forKey: "SecretMessage")
            secret.resignFirstResponder()
            secret.hidden = true
            
        }
        
    }
    
    @IBAction func btnPressed(sender: AnyObject) {
        
        unlockSecretMessage()
        
        
    }

}

