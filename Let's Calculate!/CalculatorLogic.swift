//
//  CalculatorLogic.swift
//  Let's Calculate!
//
//  Created by Jo Thorpe on 17/06/2018.
//  Copyright © 2018 Oxfam Reject. All rights reserved.
//

import Foundation

class CalculatorLogic {
    
    func addNumbers(value1: String, value2: String)-> String {
  
        var value: String = ""
        
        if ((Double(value1)!) / 1) != 0 {
            var value1double:Double
            var value2double:Double
            var valuez:Double
            
            value1double = Double(value1)!
            value2double = Double(value2)!
            valuez = value1double + value2double
            value = (String(format: "%.7f", valuez))
            
            while value.last == "0" {
                value = String(value.dropLast())
            }
            
        } else {
            
            value = "\(Double(value1)! + Double(value2)!)"
            
        }
        
       return value
    }
    
    func minusNumbers(value1: String, value2: String)-> String{
       
        var value: String = ""
        if ((Double(value1)!) / 1) != 0 {
            var value1double:Double
            var value2double:Double
            var valuez:Double
            
            value1double = Double(value1)!
            value2double = Double(value2)!
            valuez = value1double - value2double
            value = (String(format: "%.7f", valuez))
            
            while value.last == "0" {
                value = String(value.dropLast())
            }
            
        } else {
            value = "\(Double(value1)! - Double(value2)!)"
            
        }
        
        return value
    }
    
    func resultToInt(value1: String)-> String{
        
        var value: String = ""
        value = "\(Int(Double(value1)!))"
        
        return value
    }
}
