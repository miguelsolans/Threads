//
//  MediaDisplayViewController.swift
//  Threads
//
//  Created by Miguel Solans on 18/09/2021.
//

import UIKit

class MediaDisplayViewController: UIViewController {
    var imageData: ImageDataOutput?
    
    @IBOutlet weak var mediaImageView: UIImageView!
    @IBOutlet weak var imageHeightLabel: UILabel!
    
    
    override func viewDidLoad() {
        self.title = "Raven Media";
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let safeImageData = imageData {
            
            let imageUrl = URL(string: safeImageData.url)!;
            
            if let imageData = try? Data(contentsOf: imageUrl) {
                mediaImageView.image = UIImage(data: imageData)
            }
            
        }
        
        
    }
    
}
