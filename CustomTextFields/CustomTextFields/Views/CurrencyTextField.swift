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
    
    override func prepareForInterfaceBuilder() {
        customizeView()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        customizeView()
    }
    
    private func customizeView() {
        backgroundColor = UIColor.systemGray4
        layer.cornerRadius = 5
        textAlignment = .center
        
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
