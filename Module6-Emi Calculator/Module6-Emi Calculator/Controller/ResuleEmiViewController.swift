//
//  ResuleEmiViewController.swift
//  Module6-Emi Calculator
//
//  Created by Monika Singh on 07/05/20.
//  Copyright © 2020 com.phomotecg. All rights reserved.
//

import UIKit

class ResuleEmiViewController: UIViewController {
    
    @IBOutlet weak var emiAmountLabel: UILabel!
    public var emiAmount : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emiAmountLabel.text = emiAmount
    }
    
    @IBAction func resetClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
   
}
