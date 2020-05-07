//
//  Loan.swift
//  Module6-Emi Calculator
//
//  Created by Monika Singh on 07/05/20.
//  Copyright © 2020 com.phomotecg. All rights reserved.
//

import Foundation

struct Loan {
    var principle : Int = 10000 // These are the default values as per the Story board
    var intrest : Int = 7
    var time : Int = 1
    
    var emiString : String {
        return String(format: "%.1f", emi)
    }
    
    var emi : Double {
        return calculateEmi(Double(principle),loanTenure:Double(time),interestRate: Double(intrest))
    }
    
   // EMI = [P x R x (1+R)^N]/[(1+R)^N-1]
    private func calculateEmi(_ loanAmount : Double, loanTenure : Double, interestRate : Double) -> Double {
        let P = loanAmount
        let R = interestRate / 1200
        let r1 = R+1
        let N = loanTenure
        return (P * R * pow(r1, N)) / (pow(r1, N) - 1)
    }
}
