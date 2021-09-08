//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var player: AVAudioPlayer?
    
    let eggTimes = [
        "Soft": 5,
        "Medium": 7,
        "Hard": 12
    ]
    
    var timer = Timer()
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        self.labelText.text = sender.currentTitle!
        
        let hardness: String = sender.currentTitle!
        
        let constTimeToCook = eggTimes[hardness]!
        
        var timeToCook = constTimeToCook
        
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            
            if (timeToCook == 0) {
                timer.invalidate()
                self.playSound()
                self.labelText.text = "done"
            }
            
            let progressBarValue = Float(1 - (Double(timeToCook) / Double(constTimeToCook)))
            
            print(progressBarValue)
            self.progressBar.progress = progressBarValue
            timeToCook -= 1
            
        }
        
    }
    
    
    
}
