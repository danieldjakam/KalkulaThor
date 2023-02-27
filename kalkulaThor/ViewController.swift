//
//  ViewController.swift
//  kalkulaThor
//
//  Created by Daniel Djakam on 31/01/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var operationLabel: UILabel!;
    @IBOutlet weak var resultLabel: UILabel!;
    var operation:String = "";
    
    override func viewDidLoad() {
        super.viewDidLoad();
        clearAll();
    }

    func clearAll(){
        operation = "";
        operationLabel.text = "0";
        resultLabel.text = operation;
    }
    
    func addCaracterToOperation(value: String) {
        operation = operation + value;
        operationLabel.text = operation
    }
    
    func formatEqual(result: Double) -> String{
        if (result.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%.0f", result)
        }else{
            return String(format: "%.0f", result)
        }
    }
//    Touch's operations
    
    @IBAction func clearOne(_ sender: Any) {
        if (!operation.isEmpty) {
            operation.removeLast();
            operationLabel.text = operation
        }
    }
    
    @IBAction func pressClear(_ sender: Any) {
        clearAll();
    }
    
    @IBAction func pressPercent(_ sender: Any) {
        addCaracterToOperation(value: "%")
    }
    
    @IBAction func pressDivision(_ sender: Any) {
        addCaracterToOperation(value: "/")
    }
    
    @IBAction func pressMultiplication(_ sender: Any) {
        addCaracterToOperation(value: "*")
    }
    
    @IBAction func pressSoustraction(_ sender: Any) {
        addCaracterToOperation(value: "-")
    }
    
    @IBAction func pressAddition(_ sender: Any) {
        addCaracterToOperation(value: "+")
    }
    
    @IBAction func pressEqual(_ sender: Any) {
        
        if validInput() {
            let checkOperationForPercent = operation.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkOperationForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
                
            let resutString = formatEqual(result: result)
            resultLabel.text = resutString
        }else{
            let alert = UIAlertController(
                title: "Erreur de calcul",
                message: "Une erreur est survenue lors du calcul",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    func validInput() -> Bool
    {
        var count = 0;
        var funcCharIndexes = [Int]()
        
        for char in operation
        {
            if(specialCharacter(char: char)){
                funcCharIndexes.append(count)
            }
            count += 1;
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes
        {
            
            if (index == 0)
            {
                return false
            }
            
            
            if (index == operation.count - 1)
            {
                return false
            }
            
            if(previous != -1)
            {
                if (index - previous == 1){
                    return false
                }
            }
            previous = index
        }
        
        return true;
    }
    
    func specialCharacter(char: Character) -> Bool {
        if (char == "*") {
            return true;
        }
        if (char == "/") {
            return true;
        }
        if (char == "+") {
            return true;
        }
        if (char == "-") {
            return true;
        }
        return false;
    }
    
//    Touch's numbers
    
    @IBAction func pressZero(_ sender: Any) {
        addCaracterToOperation(value: "0")
    }
    
    @IBAction func pressOne(_ sender: Any) {
        addCaracterToOperation(value: "1")
    }
    
    @IBAction func pressTwo(_ sender: Any) {
        addCaracterToOperation(value: "2")
    }
    
    @IBAction func pressThree(_ sender: Any) {
        addCaracterToOperation(value: "3")
    }
    
    @IBAction func pressFour(_ sender: Any) {
        addCaracterToOperation(value: "4")
    }
    
    @IBAction func pressFive(_ sender: Any) {
        addCaracterToOperation(value: "5")
    }
    
    @IBAction func pressSix(_ sender: Any) {
        addCaracterToOperation(value: "6")
    }
    
    @IBAction func pressSeven(_ sender: Any) {
        addCaracterToOperation(value: "7")
    }
    
    @IBAction func pressEigth(_ sender: Any) {
        addCaracterToOperation(value: "8")
    }
    
    @IBAction func pressNine(_ sender: Any) {
        addCaracterToOperation(value: "9")
    }
    
    @IBAction func pressPoint(_ sender: Any) {
        addCaracterToOperation(value: ".")
    }
    
    
}

