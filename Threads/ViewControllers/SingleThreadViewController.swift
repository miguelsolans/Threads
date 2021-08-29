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
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.title = self.threadTitle;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getThread(threadId: self.threadId ?? "" ) { data in
            print("Got Data: \(data)");
            
            self.singleThread = data;
            
            self.threadTableView.reloadData();
        } failure: {
            print("Failure")
        }

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.singleThread?.thread.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed(String(describing: BubbleMessageCell.self), owner: self, options: nil)?.first as! BubbleMessageCell;
        
        if let safeItem = self.singleThread?.thread.items[ indexPath.row ] {
            cell.messageTextLabel.text = safeItem.text;
        }
        return cell;
    }
    
}
