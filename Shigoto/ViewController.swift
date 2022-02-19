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
    
    @IBOutlet weak var timerText: UILabel!
    @IBOutlet weak var startButtonText: UIButton!
    
    
    
    
    
    @IBAction func startTimerButton(_ sender: UIButton) {
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        startButtonText.titleLabel!.text = "Pause"
        
    }
    
    @IBAction func cancelTimerButton(_ sender: UIButton) {
        timer.invalidate()
        timerText.text = "45:00"
        pomodoro = 2700
        
        startButtonText.titleLabel!.text = "Start"
        
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

