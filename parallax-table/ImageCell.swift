//
//  ImageCell.swift
//  parallax-table
//
//  Created by Tihomir Videnov on 10/15/16.
//  Copyright © 2016 Tihomir Videnov. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {

    @IBOutlet weak var parallaxImage: UIImageView!
    @IBOutlet weak var imageTitle: UILabel!
    
    @IBOutlet weak var parallaxImageHeight: NSLayoutConstraint!
    
    @IBOutlet weak var parallaxTopConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        parallaxImage.clipsToBounds = true
    }

    func configureCell(title: String, image: UIImage) {
        
        self.parallaxImage.image = image
        self.imageTitle.text = title
    }
}
