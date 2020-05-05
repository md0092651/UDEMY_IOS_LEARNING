//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var totalTime = 0
    var secondsLeft = 0
    var timer : Timer = Timer()
    @IBOutlet weak var eggPreptitle: UILabel!
    
    let eggTimer = ["Soft":3, "Medium":5 ,"Hard":7]
    @IBOutlet weak var progressStatus: UIProgressView!
    
    @IBAction func eggSelector(_ sender: UIButton) {
        resetAndStart()
        eggPreptitle.text = "Your timer will start in 3 Seconds"
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            let hardness = sender.currentTitle!
            self.totalTime = self.eggTimer[hardness]!
            self.timer  = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.runTimedCode), userInfo: nil, repeats:true)
        })
    }
    
    override func viewDidLoad() {
        resetAndStart()
    }
    func resetAndStart() -> Void {
        timer.invalidate()
        secondsLeft = 0
        totalTime = 0
        progressStatus.progress = 0
        eggPreptitle.text = "How would you like your eggs ?"
    }
    
    @objc func runTimedCode() {
        if(secondsLeft < totalTime){
            eggPreptitle.text = "Time Left \(totalTime-secondsLeft-1) seconds"
            secondsLeft += 1
            print(Float(secondsLeft)/Float(totalTime))
            progressStatus.progress = Float(secondsLeft)/Float(totalTime)
        }else{
           eggPreptitle.text = "Your eggs are ready"
            // play sound
        }
    }
}
