//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Mathe Sharvadze on 19.09.21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

struct Calculatorbrain {
    
    var bmi: BMI?
    
    func getAdvice() -> String {
        return self.bmi?.advice ?? ""
    }
    
    func getColor() -> UIColor {
        return self.bmi?.color ?? .blue
    }
    
    mutating func calculateBmi(_ height: Float, _ weight: Float) -> String {
        let bmiValue = weight / pow(height, 2)
        
        if bmiValue < 18 {
            self.bmi = BMI(bmi: bmiValue, advice: "Eat more pies!", color: .blue)
        } else if bmiValue < 24 {
            self.bmi = BMI(bmi: bmiValue, advice: "Fit as a fiddle!", color: .green)
        } else {
            self.bmi = BMI(bmi: bmiValue, advice: "Eat less pies!", color: .red)
        }
        
        return String(format: "%.2f",  bmiValue)
    }
}
