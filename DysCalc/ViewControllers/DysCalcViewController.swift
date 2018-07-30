//
//  DysCalcViewController.swift
//  DysCalc
//
//  Created by Matthew Curtner on 7/24/18.
//  Copyright © 2018 Matthew Curtner. All rights reserved.
//

import UIKit

class DysCalcViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var lhsLabel: UILabel!
    @IBOutlet weak var rhsLabel: UILabel!
    @IBOutlet weak var answerTxtField: UITextField!
    @IBOutlet weak var rhsLabelLHSBreakdown: UITextField!
    @IBOutlet weak var rhsLabelRHSBreakdown: UITextField!
    
    // Declare controllers
    var timer: DysCalcTimer!
    var numberController: NumberController!
    
    //
    var totalTime = 600
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize controllers
        numberController = NumberController()
        timer = DysCalcTimer(totalTime: totalTime, timerLabel: timerLabel)
        
        createKeyboardDoneButton()
        addTapGestureToRHSLabel()
        displayLabelValues()
    }
    
    func displayLabelValues() {
        numberController.initalizeValues()
        lhsLabel.text = numberController.lhsInt.toString()
        rhsLabel.text = numberController.rhsInt.toString()
    }
    
    func addTapGestureToRHSLabel() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(rhsNumberWasTapped))
        rhsLabel.isUserInteractionEnabled = true
        rhsLabel.addGestureRecognizer(tap)
    }
    
    @objc func rhsNumberWasTapped(sender:UITapGestureRecognizer) {
        if rhsLabelLHSBreakdown.isHidden {
            rhsLabelLHSBreakdown.isHidden = false
            rhsLabelRHSBreakdown.isHidden = false
        } else {
            rhsLabelLHSBreakdown.isHidden = true
            rhsLabelRHSBreakdown.isHidden = true
        }
    }

    func checkAnswer() {
        // Check that the textfield is not empty
        if !(answerTxtField.text?.isEmpty)! {
            
            if answerTxtField.text?.toInt() == numberController.expectedSolution {
                print("Correct")
                showToast(message: "Correct")
                
                displayLabelValues()
                
                rhsLabelLHSBreakdown.isHidden = true
                rhsLabelRHSBreakdown.isHidden = true
                
                rhsLabelLHSBreakdown.text = ""
                rhsLabelRHSBreakdown.text = ""
                answerTxtField.text = ""
                
            } else {
                print("Try Again")
                showToast(message: "Try Again")
                rhsLabel.textColor = .red
            }
        }
    }
    
    func createKeyboardDoneButton() {
        //Initialize toolbar
        let toolbar:UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0,  width: self.view.frame.size.width, height: 30))
        
        // Create left side empty space so that done button set on right side
        let flexSpace = UIBarButtonItem(barButtonSystemItem:    .flexibleSpace, target: nil, action: nil)
        let doneBtn: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(DysCalcViewController.doneButtonAction))
        toolbar.setItems([flexSpace, doneBtn], animated: false)
        toolbar.sizeToFit()
        
        // Setting toolbar as inputAccessoryView
        self.answerTxtField.inputAccessoryView = toolbar
        self.rhsLabelLHSBreakdown.inputAccessoryView = toolbar
        self.rhsLabelRHSBreakdown.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonAction() {
        self.view.endEditing(true)
    
        checkAnswer()
    }
    
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    @IBAction func unwindToDysCalc(segue: UIStoryboardSegue) {
        print("Unwind called")
    }
    
}
