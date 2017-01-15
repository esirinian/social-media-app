//
//  CustomTextField.swift
//  SocialMedia
//
//  Created by Eric Sirinian on 1/14/17.
//  Copyright © 2017 Eric Sirinian. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        //Custom Border
        layer.borderColor = UIColor(red: SHADOW_GREY, green: SHADOW_GREY, blue: SHADOW_GREY, alpha: 0.2).cgColor
        layer.borderWidth = 1.0
        
        //Shadow
        layer.shadowColor = UIColor(red: SHADOW_GREY, green: SHADOW_GREY, blue: SHADOW_GREY, alpha: 0.6).cgColor
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
        //Adds rounded corners
        layer.cornerRadius = 5.0
        
        
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        
        //Adds little tab back to textfield
        return bounds.insetBy(dx: 10, dy: 0)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        //Keeps same shape as when there is no editing
        return bounds.insetBy(dx: 10, dy: 0)
    }
    
    func textFieldShouldReturn(_ textField: CustomTextField) -> Bool
    {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(1) as? CustomTextField {
            nextField.becomeFirstResponder()
        }
        return false
    }

}
