//
//  UserSettingsViewController.swift
//  Threads
//
//  Created by Miguel Solans on 28/08/2021.
//

import UIKit

class UserSettingsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var cookieTextField: UITextField!
    @IBOutlet weak var appIdTextField: UITextField!
    @IBOutlet weak var igClaimTextField: UITextField!
    
    var userDefaults: UserDefaults?;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.userDefaults = UserDefaults.standard;
        
        self.cookieTextField.text = userDefaults?.string(forKey: "cookie");
        self.appIdTextField.text = userDefaults?.string(forKey: "appId");
        self.igClaimTextField.text = userDefaults?.string(forKey: "igClaim")
        
        self.cookieTextField.delegate = self;
        self.appIdTextField.delegate = self;
        self.igClaimTextField.delegate = self;
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        self.userDefaults?.set(self.cookieTextField.text, forKey: "cookie")
        self.userDefaults?.set(self.appIdTextField.text, forKey: "appId")
        self.userDefaults?.set(self.igClaimTextField.text, forKey: "igClaim")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true);
        return false;
    }
}
