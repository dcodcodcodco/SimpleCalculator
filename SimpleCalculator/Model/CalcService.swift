//
//  CalcService.swift
//  SimpleCalculator
//
//  Created by Alex on 21.02.2023.
//

import Foundation

class CalcService {
    
    //MARK: Properties
    var isRunning = true
    var currentNumber = "0" // текущее число, отображающееся на дисплее
    var firstNumber = 0.0
    var secondNumber = 0.0
    var result = " "
    var currentOperation = Operations.noAction
    var displayView: ViewController // ссылка на объект viewcontroller'a
    
    init(displayView: ViewController) {
        self.displayView = displayView
    }
    
    //MARK: Methods
    func updateDisplay(text: String) {
        print(text)
    }
    
    func makeCalculation(operation: Operations) {
        if currentOperation != .noAction {
            if currentNumber != "" {
                secondNumber = Double(currentNumber) ?? 0.0
                switch operation {
                case .addition:
                    result = String(firstNumber + secondNumber)
                case .substraction:
                    result = String(firstNumber - secondNumber)
                case .multiplication:
                    result = String(firstNumber * secondNumber)
                case .division:
                    result = String(firstNumber / secondNumber)
                default:
                    break
                }
            }
        } else {
            firstNumber = Double(currentNumber) ?? 0.0
            currentNumber = ""
            updateDisplay(text: currentNumber)
            currentOperation = operation
        }
        print(
    """
    \n
    __________
    current number = \(currentNumber)
    first = \(firstNumber)
    second = \(secondNumber)
    result = \(result)
    __________
    \n
    """
        )
    }
    
    func addition() {
        makeCalculation(operation: .addition)
    }
    func substraction() {
        makeCalculation(operation: .substraction)
    }
    func multiplication() {
        makeCalculation(operation: .multiplication)
    }
    func division() {
        makeCalculation(operation: .division)
    }
    
    func makeResult() {
        makeCalculation(operation: currentOperation)
    }
    
    func acAction() {
        currentNumber = ""
        firstNumber = 0.0
        secondNumber = 0.0
        result = " "
        currentOperation = Operations.noAction
        updateDisplay(text: currentNumber)
    }
    
}
