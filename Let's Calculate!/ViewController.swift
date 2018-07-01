//
//  ViewController.swift
//  Let's Calculate!
//
//  Created by Jo Thorpe on 17/06/2018.
//  Copyright © 2018 Oxfam Reject. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputLbl: UILabel!
    
    var runningNumber = ""
    var displayNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentSymbol:Symbol = .none
    var Message = ""
    var calculatorLogic = CalculatorLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outputLbl.text = ""
    }
    
  

    @IBAction func digitPressed(_ sender: UIButton) {
        if displayNumber.count <= 8 {
            runningNumber += "\(sender.tag)"
            displayNumber += "\(sender.tag)"
            outputLbl.text = displayNumber
            print(runningNumber)
            print(displayNumber)
        } else {
            showAlert(message: "The display is full, please clear a value by pressing C")
        }
    }
    
    @IBAction func acPressed(_ sender: UIButton) {
        runningNumber = ""
        displayNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentSymbol = .none
        outputLbl.text = displayNumber
    }
    
    
    @IBAction func cPressed(_ sender: UIButton) {
        if runningNumber != "" {
            runningNumber = String(runningNumber.dropLast())
            outputLbl.text = displayNumber
        }
        if displayNumber != "" {
            displayNumber = String(displayNumber.dropLast())
            outputLbl.text = displayNumber
        }
        
        
    }
    
    @IBAction func equalPressed(_ sender: UIButton) {
        if displayNumber != "" && displayNumber.last != "+" && displayNumber.last != "-" && displayNumber.last != "." {
        calculate(symbol: currentSymbol)
        displayNumber = result
        outputLbl.text = displayNumber
        }else {
            showAlert(message: "Incorrect use of equals")
        }
    }
    
    @IBAction func decimalPressed(_ sender: UIButton) {
        if displayNumber.count <= 7 {
            if displayNumber.count >= 1 && runningNumber.contains(".") == false && runningNumber != ""{
                runningNumber += "."
                displayNumber += "."
                outputLbl.text = displayNumber
            } else {
                showAlert(message: "Incorrect use of decimal point")
                
            }
        } else {
            showAlert(message: "The display is full")
        }
    }
    
    @IBAction func symbolPressed(_ sender: UIButton) {
        
      let buttonPressed = sender.title(for: .normal)
        
        if displayNumber != ""  && displayNumber.last != "+" && displayNumber.last != "-" && displayNumber.last != "." {
            if buttonPressed == "+" {
                displayNumber += "+"
                outputLbl.text = displayNumber
                calculate(symbol: .add)
            } else if  buttonPressed == "-" {
                displayNumber += "-"
                outputLbl.text = displayNumber
                calculate(symbol: .minus)
            }
            } else {
                showAlert(message: "Incorrect use of an operator")
            }
    }
    
    func calculate(symbol: Symbol){
        
        if currentSymbol != .none {
            if runningNumber != "" {
            rightValue = runningNumber
            runningNumber = ""
                
                if currentSymbol == .add {
                    
                    result = calculatorLogic.addNumbers(value1: leftValue,value2: rightValue)
                }
                
                if currentSymbol == .minus {
                    
                    result = calculatorLogic.minusNumbers(value1: leftValue,value2: rightValue)
                }
                leftValue = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0) {
                    
                    result = calculatorLogic.resultToInt(value1: result)
                }
                
            }
            currentSymbol = symbol
            
        } else {
            leftValue = runningNumber
            runningNumber = ""
            currentSymbol = symbol
            
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Incorrect Function", message: message , preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Ok", style: .default) { (action) in
            print("Alert Shown")
        }
        alert.addAction(action1)
        present(alert, animated: true, completion: nil)
        
    }

}
