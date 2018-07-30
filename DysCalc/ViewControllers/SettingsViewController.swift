//
//  SettingsViewController.swift
//  DysCalc
//
//  Created by Matthew Curtner on 7/27/18.
//  Copyright © 2018 Matthew Curtner. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var timeTxtField: UITextField!
    @IBOutlet weak var additionMaxValue: UITextField!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func doneButtonWasPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonWasPressed(_ sender: UIButton) {
        saveSettings()
        performSegue(withIdentifier: "unwindSegueToDysCalc", sender: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       self.view.endEditing(true)
    }
    
    func saveSettings() {
        defaults.set(timeTxtField.text?.toInt(), forKey: "TimeLimit")
        defaults.set(additionMaxValue.text?.toInt(), forKey: "MaxValue")
    }
    
}
