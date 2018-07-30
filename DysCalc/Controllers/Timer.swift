//
//  Timer.swift
//  DysCalc
//
//  Created by Matthew Curtner on 7/25/18.
//  Copyright © 2018 Matthew Curtner. All rights reserved.
//

import UIKit

class DysCalcTimer {
    
    var countDownTimer: Timer!
    var totalTime: Int!
    var timerLabel: UILabel!
    
    init(totalTime: Int!, timerLabel: UILabel) {
        self.totalTime = totalTime
        self.timerLabel = timerLabel
        startTimer()
    }
    
    func startTimer() {
        countDownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
       timerLabel.text = "\(formatTime(totalTime))"
        
        if totalTime != 0 {
            totalTime -= 1
        } else {
            endTimer()
        }
    }
    
    func endTimer() {
        countDownTimer.invalidate()
    }
    
    func formatTime(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60) % 60
        
        return String(format: "%02d:%02d", minutes, seconds)
    }
}


