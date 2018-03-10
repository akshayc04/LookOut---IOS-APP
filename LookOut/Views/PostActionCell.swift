//
//  PostActionCell.swift
//  LookOut
//
//  Created by Akshay on 3/8/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit

protocol PostActionCellDelegate: class {
    func didTapLikeButton(_ likeButton: UIButton, on cell: PostActionCell)
}

class PostActionCell: UITableViewCell {
    static let height: CGFloat = 46
    weak var delegate: PostActionCellDelegate?

    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var timeAgoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func likeButtonTapped(_ sender: UIButton) {
    delegate?.didTapLikeButton(sender, on: self)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
