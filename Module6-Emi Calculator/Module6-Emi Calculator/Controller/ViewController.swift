//
//  ViewController.swift
//  Module6-Emi Calculator
//
//  Created by Monika Singh on 06/05/20.
//  Copyright © 2020 com.phomotecg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var loan:Loan = Loan()
    
    @IBOutlet weak var btnPersonal: UIButton!
    @IBOutlet weak var btnCar: UIButton!
    @IBOutlet weak var btnHome: UIButton!
    
    @IBOutlet weak var loanTypeImage: UIImageView!
    
    @IBOutlet weak var loanAmountLabel: UILabel!
    @IBOutlet weak var monthsLabel: UILabel!
    @IBOutlet weak var interestRateLabel: UILabel!
    
    var lastSelectedButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lastSelectedButton = btnHome
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        print(loan.emi)
    }
    @IBAction func loanTypeSelector(_ sender: UIButton) {
        
        lastSelectedButton.isSelected = false
        lastSelectedButton = sender
        lastSelectedButton.isSelected = true
        
        let btnTitle = sender.currentTitle!
        switch btnTitle {
        case "Home":
            loanTypeImage.image = #imageLiteral(resourceName: "001-construction")
        case "Car":
           loanTypeImage.image = #imageLiteral(resourceName: "003-money")
        case "Personal":
           loanTypeImage.image = #imageLiteral(resourceName: "002-file")
        default:
            print(btnTitle)
        }
    }
    
   
    
    @IBAction func LoanAmountChangeListner(_ sender: UISlider) {
        loan.principle = Int(sender.value)
        loanAmountLabel.text = "Rs \(String(format: "%.0f", sender.value))"
    }
    
    @IBAction func rateOfIntrestChangeListner(_ sender: UISlider) {
         loan.intrest = Int(sender.value)
        interestRateLabel.text = "\(String(format: "%.0f", sender.value)) %"
    }
    
    @IBAction func loanTenureChangeListner(_ sender: UISlider) {
         loan.time = Int(sender.value)
        monthsLabel.text = "\(String(format: "%.0f", sender.value)) Months"
    }
}

