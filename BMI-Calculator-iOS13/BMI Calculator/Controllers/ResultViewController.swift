//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Mathe Sharvadze on 19.09.21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var resultBackground: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        resultBackground.backgroundColor = color
        
    }
    

    @IBAction func recalculatePrssed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
