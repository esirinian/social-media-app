//
//  CircleImageView.swift
//  SocialMedia
//
//  Created by Eric Sirinian on 1/15/17.
//  Copyright © 2017 Eric Sirinian. All rights reserved.
//

import UIKit

class CircleImageView: UIImageView {
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.width / 2.0
        clipsToBounds = true
    }

}
