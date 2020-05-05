//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var quizBrain:QuizBrain = QuizBrain()
    @IBOutlet weak var quizTitle: UILabel!
    
    @IBOutlet weak var btnTrue: UIButton!
    @IBOutlet weak var btnFalse: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerClick(_ sender: UIButton) {
        let answer = sender.currentTitle
        if(quizBrain.checkAnswer(answerSubmitted: answer!)){
            sender.backgroundColor = UIColor.green
        }else{
           sender.backgroundColor = UIColor.red
        }
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)

    }
    
    @objc func updateUI(){
        btnTrue.backgroundColor = UIColor.clear
        btnFalse.backgroundColor = UIColor.clear
        quizTitle.text = quizBrain.getCurrentQuiz().q
    }
    
}

