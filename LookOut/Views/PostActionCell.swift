//
//  PostActionCell.swift
//  LookOut
//
//  Created by Akshay on 3/8/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit

class PostActionCell: UITableViewCell {
    static let height: CGFloat = 46

    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func likeButtonTapped(_ sender: UIButton) {
        print("like button tapped")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
