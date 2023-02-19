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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUIButtonAndAddToKeyboard()
    }
    
    private func createUIButtonAndAddToKeyboard() {
        let calculateButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 52))
        calculateButton.backgroundColor = UIColor.systemOrange
        calculateButton.setTitle("Calculate", for: .normal)
        calculateButton.setTitleColor(UIColor.white, for: .normal)
        calculateButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        
        hourlyWageTF.inputAccessoryView = calculateButton
        itemPriceTF.inputAccessoryView = calculateButton
        
    }
    
    @objc private func calculate() {
        print("Ho ho ho")
    }


}

