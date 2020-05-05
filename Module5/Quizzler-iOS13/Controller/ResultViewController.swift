//
//  ResultViewController.swift
//  Quizzler-iOS13
//
//  Created by Monika Singh on 06/05/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var score : String?
    
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let safeScore = score{
            result.text = safeScore
        }
    }
}
