//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Alex on 21.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Views
    private let display = UITextField()
    private let displayView = UIView()
    private let mainVStack = UIStackView()
    
    
    //MARK: Properties
    var service: CalcService?
    
    //MARK: ViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        service = CalcService(displayView: self)
        view.backgroundColor = .systemRed
        
        configureAppearance()
    }
    
    //MARK: Methods
    func updateDisplay(text: String) {
        print(text)
    }
}

//MARK: ViewController Private Methods
private extension ViewController {
    func configureAppearance() {
        setupDisplayView()
        setupButtons()
        setupMainVStack() // появляется после настройки всего остального
    }
    
    func setupMainVStack() {
        mainVStack.axis = .vertical // направление добавления элементов
        mainVStack.frame = CGRect(x: 0, y: 60, width: Constants.screenWidth, height: Constants.screenHeight-60) // stack window
        mainVStack.backgroundColor = .systemGreen
        
        self.view.addSubview(mainVStack) // показать на экране
    }
    
    func setupDisplayView() {
        displayView.frame = CGRect(x: 0, y: 0, width: Constants.screenWidth, height: Constants.screenHeight - (82 * 5) - 60 - 30)
        displayView.backgroundColor = .lightGray
        
        display.frame = CGRect(x: 0, y: 0, width: displayView.frame.width, height: displayView.frame.height)
    }
    
    func setupButtons() {
        let line1 = createHStack(yPosition: 0)
        line1.addSubview(createButton(order: 0, title: "0", tag: 0))
        line1.addSubview(createButton(order: 1, title: "1", tag: 1))
        line1.addSubview(createButton(order: 2, title: "2", tag: 2))
        line1.addSubview(createButton(order: 3, title: "3", tag: 3))
        mainVStack.addSubview(line1)
        
        let line2 = createHStack(yPosition: 80 + 2)
        line2.addSubview(createButton(order: 0, title: "4", tag: 4))
        line2.addSubview(createButton(order: 1, title: "5", tag: 5))
        line2.addSubview(createButton(order: 2, title: "6", tag: 6))
        line2.addSubview(createButton(order: 3, title: "7", tag: 7))
        mainVStack.addSubview(line2)
        
        let line3 = createHStack(yPosition: 80 + 80 + 4)
        line3.addSubview(createButton(order: 0, title: "8", tag: 8))
        line3.addSubview(createButton(order: 1, title: "9", tag: 9))
        line3.addSubview(createButton(order: 2, title: "10", tag: 10))
        line3.addSubview(createButton(order: 3, title: "11", tag: 11))
        mainVStack.addSubview(line3)
        
        let line4 = createHStack(yPosition: 80 + 80 + 80 + 6)
        line4.addSubview(createButton(order: 0, title: "12", tag: 12))
        line4.addSubview(createButton(order: 1, title: "13", tag: 13))
        line4.addSubview(createButton(order: 2, title: "14", tag: 14))
        line4.addSubview(createButton(order: 3, title: "15", tag: 15))
        mainVStack.addSubview(line4)
        
        let line5 = createHStack(yPosition: 80 + 80 + 80 + 80 + 8)
        
        let zeroButton = createButton(order: 0, title: "16", tag: 16) // большая кнопка ноль
        zeroButton.frame = CGRect(x: 2, y: 0, width: (Int(Constants.screenWidth)/4)*2-2, height: 80)
        line5.addSubview(zeroButton)
        
        line5.addSubview(createButton(order: 2, title: "18", tag: 18))
        line5.addSubview(createButton(order: 3, title: "19", tag: 19))
        mainVStack.addSubview(line5)
    }
    
    func createButton(order: Int, title: String, tag: Int) -> UIButton {
        let button = UIButton(frame: CGRect(x: (0+Int(Constants.screenWidth)/4*order+2), y: 0, width: Int(Constants.screenWidth/4-2), height: 80))
        
        button.setTitle(title, for: .normal)
        button.backgroundColor = .blue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        
        return button
    }
    
    func createHStack(yPosition: Int) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.frame = CGRect(x: 0, y: yPosition, width: Int(Constants.screenWidth), height: 80)
        
        return stack
    }
}
