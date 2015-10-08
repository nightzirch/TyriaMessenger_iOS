//
//  TMSettingsViewController.swift
//  TyriaMessenger
//
//  Created by Christian Grimsgaard on 06/10/15.
//  Copyright © 2015 ChristianGrimsgaard. All rights reserved.
//

import Foundation
import UIKit

class TMSettingsViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var apiTokenTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiTokenTextField.delegate = self
        apiTokenTextField.text = TMManager.sharedInstance.getAPIToken()
        
        let tapAnywhere: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tapAnywhere)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        let token = textField.text
        TMManager.sharedInstance.setAPIToken(token!)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}