//
//  ViewController.swift
//  Module3
//
//  Created by Monika Singh on 22/04/20.
//  Copyright © 2020 com.phomotecg. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var inOutWindow: UILabel!
    
    var currentNumberOnScreen:Double = 0
    var previousNumber:Double = 0
    
    var operationSelected = Operation.NONE
    
    var isDecimal = false
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    @IBAction func KeyPressed(_ sender: UIButton) {
        playSound(sender)
        let uiButtonText = sender.currentTitle
        if(uiButtonText == "."){
            isDecimal = true
            addDecimalTolabel()
        }else{
            addValueTolabel(uiButtonText)
        }
        
    }
    func addValueTolabel(_ uiButtonText: String?)  {
        if(isDecimal){
            let appendedValue = inOutWindow.text! + uiButtonText!
            currentNumberOnScreen = Double(appendedValue)!
            setTextToLabel(appendedValue)
            print("Last number is \(currentNumberOnScreen)")
        }else{
            let appendedValue = currentNumberOnScreen*10 + Double(Int(uiButtonText!)!)
            currentNumberOnScreen = Double(appendedValue)
            setTextToLabel(String(Int(currentNumberOnScreen)))
            print("Last number is \(currentNumberOnScreen)")
        }
    }
    
    func setTextToLabel(_ labelText:String) {
        inOutWindow.text = labelText
    }
    
    func addDecimalTolabel() -> Void {
        if(!inOutWindow.text!.contains(".")){
            inOutWindow.text = inOutWindow.text! + "."
        }
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
        playSound(sender)
        switch sender.tag {
        case 10:
            resetCalculator()
        case 12:
            setOperation(Operation.PERCENT)
        case 13:
            setOperation(Operation.DIVIDE)
        case 14:
            setOperation(Operation.MULTIPLY)
        case 15:
            setOperation(Operation.SUBSTRACT)
        case 16:
            setOperation(Operation.ADD)
        case 17:
            produceResult()
        default:
            print("I do not know this function")
        }
    }
    
    func setOperation(_ operation:Operation) -> Void {
        isDecimal = false
        previousNumber = currentNumberOnScreen
        currentNumberOnScreen = 0
        operationSelected = operation
        setTextToLabel(String(Int(previousNumber))+operation.rawValue)
    }
    
    func produceResult() {
        var ans:Double = 0
        switch operationSelected {
        case Operation.PERCENT:
            ans = (previousNumber/currentNumberOnScreen)*100
        case Operation.ADD:
            ans = previousNumber+currentNumberOnScreen
        case Operation.SUBSTRACT:
            ans = previousNumber-currentNumberOnScreen
        case Operation.MULTIPLY:
            ans = previousNumber*currentNumberOnScreen
        case Operation.DIVIDE:
            ans = previousNumber/currentNumberOnScreen
        default:
            resetCalculator()
        }
        
        setTextToLabel(String(Double(ans)))
        currentNumberOnScreen = ans
        isDecimal = false
        operationSelected = Operation.NONE
    }
    
    func resetCalculator() -> Void {
        inOutWindow.text = "0"
        currentNumberOnScreen = 0
        isDecimal = false
        operationSelected = Operation.NONE
    }
    
    enum Operation: String {
        case NONE = ""
        case ADD = "+"
        case SUBSTRACT = "-"
        case MULTIPLY = "*"
        case DIVIDE = "/"
        case PERCENT = "%"
        case NEGATE = "+/-"
    }
    
    func playSound(_ sender: UIButton) {
        sender.alpha = 0.75
        guard let url = Bundle.main.url(forResource: "buttonsound", withExtension: "mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
           sender.alpha = 1
        })
    }
    
}

