//
//  BookRecording.swift
//  reading-bea
//
//  Created by Craig Harvie on 27/02/2019.
//  Copyright © 2019 Reading Bea. All rights reserved.
//

import UIKit

class BookRecording: UITableViewCell {

    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var recordedBy: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
