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
    override class func awakeFromNib() {
        super.awakeFromNib();
        
        // Initialize code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated);
        
        // Configure the view for the selected states
    }
    
    
}
