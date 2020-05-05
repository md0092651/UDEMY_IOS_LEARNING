//
//  ViewController.swift
//  Module2
//
//  Created by Monika Singh on 16/04/20.
//  Copyright © 2020 com.phomotecg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImage1: UIImageView!
    @IBOutlet weak var diceImgaeView2: UIImageView!
  
    let diceImageArray = [ #imageLiteral(resourceName: "DiceOne") ,#imageLiteral(resourceName: "DiceTwo") ,#imageLiteral(resourceName: "DiceThree") ,#imageLiteral(resourceName: "DiceFour") ,#imageLiteral(resourceName: "DiceFive") ,#imageLiteral(resourceName: "DiceSix") ]
    
    @IBAction func clickRollDice(_ sender: UIButton) {
      
        diceImgaeView2.image = diceImageArray.randomElement()
        diceImage1.image = diceImageArray.randomElement()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

        
    }


}

