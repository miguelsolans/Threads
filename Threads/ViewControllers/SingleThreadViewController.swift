//
//  SingleThreadViewController.swift
//  Threads
//
//  Created by Miguel Solans on 28/08/2021.
//

import UIKit


class SingleThreadViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var threadId: String?
    var threadTitle: String?
    var singleThread: SingleThreadOutput?
    
    @IBOutlet weak var threadTableView: UITableView!
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.title = self.threadTitle;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.getThread();
    }
    
    // MARK: - TableView Delegate Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.singleThread?.thread.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed(String(describing: BubbleMessageCell.self), owner: self, options: nil)?.first as! BubbleMessageCell;
        
        if let safeItem = self.singleThread?.thread.items[ indexPath.row ] {
            
            if(safeItem.itemType == "raven_media") {
                cell.messageTextLabel.text = "Raven Media";
            } else {
                cell.messageTextLabel.text = safeItem.text;
            }
        }
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let safeItem = self.singleThread?.thread.items[ indexPath.row ] {
            
            if(safeItem.itemType == "raven_media") {
                
                
                if let safeMedia = safeItem.media?.images?.candidates {
                    
                    for imageOutput in safeMedia {
                            
                        if( (imageOutput.height == safeItem.media?.height) && (imageOutput.width == safeItem.media?.width) ) {
                            
                            let storyboard = UIStoryboard.init(name: "Main", bundle: nil);
                            
                            let destinationViewController = storyboard.instantiateViewController(identifier: String(describing: MediaDisplayViewController.self)) as! MediaDisplayViewController;
                            
                            destinationViewController.imageData = imageOutput;
                            
                            self.navigationController?.pushViewController(destinationViewController, animated: true);
                            
                            return;
                        }
                        
                    }
                }
                
            }
            
        }
    }
    
    
    // MARK: - Networking Methods
    func getThread() {
        Threads.getThread(threadId: self.threadId ?? "" ) { data in
            print("Got Data: \(data)");
            
            self.singleThread = data;
            
            self.singleThread?.thread.items.reverse();
            
            self.threadTableView.reloadData();
        } failure: {
            print("Failure")
        }
    }
    
}
