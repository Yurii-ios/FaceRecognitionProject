//
//  ViewController.swift
//  FaceRecognitionProject
//
//  Created by Yurii Sameliuk on 09/02/2020.
//  Copyright © 2020 Yurii Sameliuk. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var myLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }


    @IBAction func signInClicked(_ sender: UIButton) {
       //LAContext() -sozdaem ekzempliar klasa kotoruj pozwoliaet nam kontrolirowat proces ayntifikacii
        let autContext = LAContext()
        
        var error : NSError?
        // proweriaem sposobno li ystrijstwo wupolnit trebyemue dejstwija
        if autContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // posle prowerki ispolzyem identifikzcujy po licy
            autContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "is it you") { (success, error) in
                if success {
                    // perewodim dejstwie w osnownoj  potok ne blokiryja raboty programu
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                    
                } else {
                    DispatchQueue.main.async {
                        self.myLable.text = "error"
                    }
                }
            }
        } else {
            autContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error)
        }
    }
}

