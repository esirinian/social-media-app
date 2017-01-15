//
//  CircleImageView.swift
//  SocialMedia
//
//  Created by Eric Sirinian on 1/15/17.
//  Copyright © 2017 Eric Sirinian. All rights reserved.
//

import UIKit

class CircleImageView: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GREY, green: SHADOW_GREY, blue: SHADOW_GREY, alpha: 0.6).cgColor
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
    }
    
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        layer.cornerRadius = self.frame.width / 2.0

    }

}
