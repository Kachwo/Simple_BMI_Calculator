//
//  BmiModel.swift
//  BMI
//
//  Created by WONG Ka Chun on 17/9/2019.
//  Copyright © 2019 EE4304. All rights reserved.
//

import Foundation

class BmiModel {
    
    var height: Float
    var weight: Float
    var bmiValue: Float
    
    init(heightInMeter: Float,weightInKg: Float) {
        height = heightInMeter
        weight = weightInKg
        bmiValue = weight / (height * height)
    }
    
    func getValue() -> Float {
        return bmiValue
    }
    
    func getComment() -> String {
        if (bmiValue > 25) {
            return "You should be on diet!"
        }else if (bmiValue < 20){
            return "You need more calories!"
        }else {
            return "You look great!"
        }
    }
    
    func getImageFilename() -> String {
        if (bmiValue > 25) {
            return "bot_fat.png"
        } else if (bmiValue < 20) {
            return "bot_thin.png"
        } else {
            return "bot_fit.png"
        }
    }
}
