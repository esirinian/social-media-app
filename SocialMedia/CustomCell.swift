//
//  CustomCell.swift
//  SocialMedia
//
//  Created by Eric Sirinian on 1/15/17.
//  Copyright © 2017 Eric Sirinian. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var captionField: UITextView!
    @IBOutlet weak var likesLbl: UILabel!

    
    var post: Post!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(post: Post) {
        self.post = post
        self.captionField.text = post.caption
        self.likesLbl.text = "\(post.likes)"
    }
}
