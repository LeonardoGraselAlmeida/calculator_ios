//
//  ViewController.swift
//  Calculator
//
//  Created by Leonardo Almeida on 07/05/22.
//

import UIKit

extension Float {
    var format: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var lblViewfinder: UILabel!
    
    var result: Float = 0
    var canReplace = true
    var lastOperation = ""
    var lastValue:Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onClear(_ sender: UIButton) {
        
        result = 0
        canReplace = true
        lastOperation = ""
        lastValue = 0
        
        lblViewfinder.text = String(result.format)
    }
    
    @IBAction func onClickChangeSymbol(_ sender: Any) {
        var value = Float(lblViewfinder.text!) ?? 0
        if(value != 0) {
            value = value * -1
            lblViewfinder.text = "\(value.format)"
        }
        
    }
    
    @IBAction func onClickPercentage(_ sender: Any) {
        var value = Float(lblViewfinder.text!) ?? 0
        
        value = value / 100
        lblViewfinder.text = "\(value.format)"
        
    }
    
    @IBAction func onClickPoint(_ sender: Any) {
        let value = lblViewfinder.text
        
        if(canReplace) {
            changeViewfinder(char: "0.")
        } else if(!canReplace && !value!.contains(".")) {
            
            changeViewfinder(char: ".")
            
        }
    }
    
    @IBAction func onClickZero(_ sender: Any) {
        changeViewfinder(char: "0")
    }
    
    @IBAction func onClickOne(_ sender: Any) {
        changeViewfinder(char: "1")
    }
    
    @IBAction func onClickTwo(_ sender: Any) {
        changeViewfinder(char: "2")
    }
    
    @IBAction func onClicThree(_ sender: Any) {
        changeViewfinder(char: "3")
    }
    
    @IBAction func onClickFour(_ sender: Any) {
        changeViewfinder(char: "4")
    }
    
    @IBAction func onClickFive(_ sender: Any) {
        changeViewfinder(char: "5")
    }
    
    @IBAction func onClickSix(_ sender: Any) {
        changeViewfinder(char: "6")
    }
    
    
    @IBAction func onClickSeven(_ sender: Any) {
        changeViewfinder(char: "7")
    }
    
    @IBAction func onClickEight(_ sender: Any) {
        changeViewfinder(char: "8")
    }
    
    
    @IBAction func onClickNine(_ sender: Any) {
        changeViewfinder(char: "9")
    }
    
    @IBAction func onClickAdd() {
        runOperation(operation: "+")
    }
    
    @IBAction func onClickSubtract() {
        runOperation(operation: "-")
    }
    
    @IBAction func onClickMultiply() {
        runOperation(operation: "*")
    }
    
    @IBAction func onClickDivision() {
        runOperation(operation: "/")
    }
    
    @IBAction func onClickResult() {
        runOperation(operation: lastOperation)
    }
    
    func changeViewfinder(char: String) {
        let value = lblViewfinder.text
        if(canReplace) {
            canReplace = false
            lblViewfinder.text = "\(char)"
        } else {
            lblViewfinder.text = "\(value!)\(char)"
        }
    }
    
    func runOperation(operation: String) {
        var value = Float(lblViewfinder.text!) ?? 0
        
        if(canReplace) {
            value = lastValue
        }
        
        if(lastOperation == "") {
            lastOperation = operation
        }
        
        if(!canReplace || lastOperation == operation) {
            lastValue = value
            switch lastOperation {
            case "+":
                result += value
            case "-":
                result -= value
            case "*":
                result = result * value
            case "/":
                result = result / value
            default:
                result = result * 1
                
            }
            
            
            lblViewfinder.text = String(result.format)
        }
        
        lastOperation = operation
        canReplace = true
    }
    
}
