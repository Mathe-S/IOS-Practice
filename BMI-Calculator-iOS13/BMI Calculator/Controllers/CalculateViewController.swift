//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    
    var calculatorBrain = Calculatorbrain()

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weigltSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightChanged(_ sender: UISlider) {
        heightLabel.text = " \(String(format: "%.2f", sender.value))m"
    }
    
    @IBAction func weightChanged(_ sender: UISlider) {
        weightLabel.text = " \(String(format: "%.0f", sender.value))Kg"
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let height = heightSlider.value
        let weight = weigltSlider.value
        
        let resultViewController = segue.destination as! ResultViewController
        resultViewController.bmiValue = calculatorBrain.calculateBmi(height, weight)
        resultViewController.advice = calculatorBrain.getAdvice()
        resultViewController.color = calculatorBrain.getColor()
    }

    
}

