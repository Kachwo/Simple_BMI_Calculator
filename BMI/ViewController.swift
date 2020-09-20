//
//  ViewController.swift
//  BMI
//
//  Created by WONG Ka Chun on 17/9/2019.
//  Copyright © 2019 EE4304. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var bmiComment: UILabel!
    @IBOutlet var bmiReport: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var logo: UIImageView!
    
    


    @IBAction func bmiButton(_ sender: Any) {
        
        //create an instant of BmiModel 
        if let height = Float(heightTextField.text!) , let weight = Float(weightTextField.text!) {
       
            let bmi = BmiModel(heightInMeter: height/100.0,weightInKg: weight)
            
            bmiReport.text = "Your BMI Value is \(String(format: "%.2f", bmi.getValue()))."
            bmiComment.text = bmi.getComment()
            logo.image = UIImage(named:bmi.getImageFilename())
            
            UserDefaults.standard.set(heightTextField.text!, forKey: "height")
            UserDefaults.standard.set(weightTextField.text!, forKey: "weight")
            
        } else {
            
            // Display a warning message if the inputs are invalid
            let alert = UIAlertController(title:  "Data Validation Error", message: "Height and Weight Inputs cannot be empty or non-numeric input", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "Close" , style: .default, handler: { (action: UIAlertAction!)
                in
                print("Data Validation Checking Completed")
            }))
            present(alert, animated: true, completion: nil)
        }
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
    
    override func touchesBegan (_ touches: Set<UITouch>, with event: UIEvent?){
        
        // Dismiss Keyboard when touching outside the text field
        view.endEditing(true)
    
    }

    
    override func viewDidLoad() {
        
        //Do any additional setup after loading the view.
        super.viewDidLoad()
        
        // restore the previous inputs
        if let height = UserDefaults.standard.string(forKey: "height"){
            heightTextField.text = height
        }
        if let weight = UserDefaults.standard.string(forKey: "weight"){
            weightTextField.text = weight
        }
        
        bmiReport.text = ""
        bmiComment.text = ""
        
    }

}


