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
        
        let tapAnywhere: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tapAnywhere)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        print(textField.text)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}