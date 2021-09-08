//
//  ThreadEntryCell.swift
//  Threads
//
//  Created by Miguel Solans on 28/08/2021.
//

import UIKit

class ThreadEntryCell: UITableViewCell {
    
    @IBOutlet weak var threadTitleLabel: UILabel!
    @IBOutlet weak var lastMessageLabel: UILabel!
    @IBOutlet weak var threadImage: UIImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib();
        
        // Initialize code
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated);
        
        // Configure the view for the selected states
        self.threadImage.layer.borderWidth = 1;
        self.threadImage.layer.masksToBounds = false;
        self.threadImage.layer.borderColor = UIColor.gray.cgColor;
        self.threadImage.layer.cornerRadius = self.threadImage.frame.height / 2;
        self.threadImage.clipsToBounds = true;
    }
    
    
}
