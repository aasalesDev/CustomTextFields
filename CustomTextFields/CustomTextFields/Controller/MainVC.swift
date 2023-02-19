//
//  MainVC.swift
//  CustomTextFields
//
//  Created by Anderson Sales on 19/02/23.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var hourlyWageTF: CurrencyTextField!
    @IBOutlet weak var itemPriceTF: CurrencyTextField!
    @IBOutlet weak var clearCalculatorButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUIButtonAndAddToKeyboard()
        configureButton()
        hideKeyboardWhenTappedAround()
        resultLabel.isHidden = true
        hoursLabel.isHidden = true
    }
    
    private func configureButton() {
        clearCalculatorButton.layer.cornerRadius = 10
    }
    
    private func createUIButtonAndAddToKeyboard() {
        //        let calculateButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 52))
        //        calculateButton.backgroundColor = UIColor.systemOrange
        //        calculateButton.setTitle("Calculate", for: .normal)
        //        calculateButton.setTitleColor(UIColor.white, for: .normal)
        //        calculateButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        //
        //        /// This two lines attach the created button to the keyboard!
        //        hourlyWageTF.inputAccessoryView = calculateButton
        //        itemPriceTF.inputAccessoryView = calculateButton
        
        lazy var button: UIButton = {
            let btn = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 52))
            btn.backgroundColor = UIColor.systemOrange
            btn.setTitle("Calculate", for: .normal)
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.addTarget(self, action: #selector(calculate), for: .touchUpInside)
            return btn
        }()
        
        hourlyWageTF.inputAccessoryView = button
        itemPriceTF.inputAccessoryView = button
        
    }
    
    @objc private func calculate() {
        if let hoursTxt = hourlyWageTF.text, let priceTxt = itemPriceTF.text {
            if let hours = Double(hoursTxt), let price = Double(priceTxt) {
                resultLabel.text = "\(Wage.getHours(for: Double(hours) , and: Double(price)))"
                resultLabel.isHidden = false
                hoursLabel.isHidden = false
                view.endEditing(true)
            }
        }
        
    }
    
    private func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func clearCalculatorPressed(_ sender: UIButton) {
        hourlyWageTF.text = ""
        itemPriceTF.text = ""
        resultLabel.isHidden = true
        hoursLabel.isHidden = true
    }
    
}
