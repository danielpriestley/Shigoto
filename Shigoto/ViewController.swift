//
//  ViewController.swift
//  Shigoto
//
//  Created by Daniel Priestley on 19/02/2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    var pomodoro = 2700
    var timer = Timer()
    var isPaused = true
    
    @IBOutlet weak var timerText: UILabel!
    @IBOutlet weak var startButtonText: UIButton!
    
    @IBAction func startTimerButton(_ sender: UIButton) {
        
        if startButtonText.title(for: .normal) == "Start" {
            // When the button is first pressed, it should change the title to Pause
            startButtonText.setTitle("Pause", for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            isPaused = false
        } else {
            // When the button runs for a second time, this code will fire as title was set to Pause above
            timer.invalidate()
            isPaused = true
            startButtonText.setTitle("Start", for: .normal)
        }

    }
    
    @IBAction func cancelTimerButton(_ sender: UIButton) {
        timer.invalidate()
        timerText.text = "45:00"
        pomodoro = 2700
        
        startButtonText.setTitle("Start", for: .normal)
        
    }
    
    func timeString(time:TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        return String(format:"%02i:%02i", minutes, seconds)
        
    }
    
    @objc func updateTimer() {
        
        // Need to format the text here so that it isn't in a 4500 format
        if pomodoro > 0 {
            timerText.text = timeString(time: TimeInterval(pomodoro))
            pomodoro -= 1
            
        } else {
            timerText.text = "Done!"
        }
    }
    
    
}

