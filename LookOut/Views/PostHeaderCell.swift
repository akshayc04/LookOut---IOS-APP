//
//  PostHeaderCell.swift
//  LookOut
//
//  Created by Akshay on 3/8/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit

class PostHeaderCell: UITableViewCell {
    static let height: CGFloat = 54

    @IBOutlet weak var usernameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func optionsButtonTapped(_ sender: UIButton) {
         print("options button tapped")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
