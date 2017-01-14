//
//  CustomButtonSI.swift
//  SocialMedia
//
//  Created by Eric Sirinian on 1/14/17.
//  Copyright © 2017 Eric Sirinian. All rights reserved.
//

import UIKit

class CustomButtonSI: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        //Shadow
        layer.shadowColor = UIColor(red: SHADOW_GREY, green: SHADOW_GREY, blue: SHADOW_GREY, alpha: 0.6).cgColor
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        
        layer.cornerRadius = 2.0
    }

}
