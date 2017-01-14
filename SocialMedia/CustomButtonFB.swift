//
//  CustomButtonFB.swift
//  SocialMedia
//
//  Created by Eric Sirinian on 1/14/17.
//  Copyright © 2017 Eric Sirinian. All rights reserved.
//

import UIKit

class CustomButtonFB: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        //Adds similar shadow around button
        layer.shadowColor = UIColor(red: SHADOW_GREY, green: SHADOW_GREY, blue: SHADOW_GREY, alpha: 0.6).cgColor
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
        //Forces Aspect Fit on image
        imageView?.contentMode = .scaleAspectFit
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //Sets Perfect circle based on width of view; cannot be done in awakeFromNib
        layer.cornerRadius = self.frame.width / 2.0
    }

}
