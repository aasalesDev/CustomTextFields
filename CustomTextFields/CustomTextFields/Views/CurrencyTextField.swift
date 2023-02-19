//
//  CurrencyTextField.swift
//  CustomTextFields
//
//  Created by Anderson Sales on 19/02/23.
//

import UIKit

/*
 With @IBDesignable and prepareForInterfceBuilder()
 we can see all changes made in code in our interface builder!
 */

@IBDesignable
class CurrencyTextField: UITextField {
    
    /// This function draws and adds a currency symbol to the label
    override func draw(_ rect: CGRect) {
        
        let size: CGFloat = 40
        let currencyLabel = UILabel(frame: CGRect(x: 5, y: frame.size.height/2 - size/2, width: size, height: size))
        currencyLabel.backgroundColor = UIColor.white
        currencyLabel.layer.opacity = 0.5
        currencyLabel.textAlignment = .center
        currencyLabel.textColor = .systemGray
        currencyLabel.layer.cornerRadius = 5
        currencyLabel.clipsToBounds = true
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .current
        
        currencyLabel.text = formatter.currencySymbol
        addSubview(currencyLabel)
    }
    
    /// This funcition will prepare and enable the interface builder to show modifications made in code
    override func prepareForInterfaceBuilder() {
        customizeView()
    }

    /// This is the "view did load" method of the textfield
    override func awakeFromNib() {
        super.awakeFromNib()
        
        customizeView()
    }
    
    /// This is a method to do some customization to the view/textfield
    private func customizeView() {
        backgroundColor = UIColor.systemGray4
        layer.cornerRadius = 5
        textAlignment = .center
        clipsToBounds = true
        
        if placeholder == nil {
            placeholder = " "
        }
        
        if let placeholder = placeholder {
            let place = NSAttributedString(string: placeholder, attributes: [.foregroundColor: UIColor.white])
            attributedPlaceholder = place
            textColor = UIColor.white
        }
    }
}
