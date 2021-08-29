//
//  ThreadsViewController.swift
//  Threads
//
//  Created by Miguel Solans on 28/08/2021.
//

import UIKit
import Alamofire


class ThreadsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var direct: DirectOutput?;
    
    @IBOutlet weak var inboxTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.title = "Threads";
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(self.settingsButtonTapped));
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        self.getThreads();
    }
    
    @objc func settingsButtonTapped() {
        self.performSegue(withIdentifier: "userSettingSegue", sender: self);
    }
    
    func getThreads() {
        getInbox { data in
            self.direct = data;
            self.inboxTableView.reloadData()
        } failure: {
            print("handle failure")
        }

    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("ThreadEntryCell", owner: self, options: nil)?.first as! ThreadEntryCell;
        cell.selectionStyle = .none;
        
        if let thread = self.direct?.inbox.threads[ indexPath.row ] {
            cell.threadTitleLabel.text = thread.title
            cell.lastMessageLabel.text = thread.items[ 0 ].text;
        }
        return cell;
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.direct?.inbox.threads.count ?? 0;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected Row: \(indexPath.row)");
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil);
        
        let destinationViewController = storyboard.instantiateViewController(identifier: String(describing: SingleThreadViewController.self)) as! SingleThreadViewController;
        
        destinationViewController.threadTitle = self.direct?.inbox.threads[ indexPath.row ].title;
        destinationViewController.threadId = self.direct?.inbox.threads[ indexPath.row ].id;
        
        self.navigationController?.pushViewController(destinationViewController, animated: true);
        
    }
    
    
    
}
