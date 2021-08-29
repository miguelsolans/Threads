//
//  BubbleMessageCell.swift
//  Threads
//
//  Created by Miguel Solans on 29/08/2021.
//

import UIKit

class BubbleMessageCell: UITableViewCell {
    
    var itemType: String?;
   
    @IBOutlet weak var messageTextLabel: UILabel!
    
    
    override class func awakeFromNib() {
        super.awakeFromNib();
        // Initialize code
        
        
        
    }
    
    func setupUI() {
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated);
        // Configure the view for the selected states
        
        self.messageTextLabel.numberOfLines = 0;
        
        
    }
}

